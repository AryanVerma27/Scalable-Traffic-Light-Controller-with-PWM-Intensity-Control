`timescale 1ns/1ps
module traffic_light_controller_tb;
  // ---- Tunables ----
  localparam integer CLK_PER_NS   = 10;   // 100 MHz
  localparam integer RESET_CYCLES = 10;   // hold reset this many cycles
  localparam integer RUN_CYCLES   = 4000; // main stimulus length
  // ---- DUT I/O ----
  reg  clk, rst, sensor;
  wire NS_Red, NS_Yellow, NS_Green;
  wire EW_Red, EW_Yellow, EW_Green;
  // Instantiate DUT (matches your gate netlist top)
  traffic_light_controller dut (
    .clk(clk), .rst(rst), .sensor(sensor),
    .NS_Red(NS_Red), .NS_Yellow(NS_Yellow), .NS_Green(NS_Green),
    .EW_Red(EW_Red), .EW_Yellow(EW_Yellow), .EW_Green(EW_Green)
  );
  // ---- Clock ----
  initial begin
    clk = 1'b0;
    forever #(CLK_PER_NS/2) clk = ~clk;
  end
  // ---- Optional waveform dump (VCD for non-ModelSim tools) ----
`ifdef VCD
  initial begin
    $dumpfile("traffic_light_controller_tb.vcd");
    $dumpvars(0, traffic_light_controller_tb);
  end
`endif
  // ---- Stimulus + heartbeat + basic checks ----
  integer i;
  initial begin
    $timeformat(-9,0," ns",10);
    $display("** TB start @ %0t **", $realtime);
    rst    = 1'b1;
    sensor = 1'b0;
    // reset
    for (i = 0; i < RESET_CYCLES; i = i + 1) @(posedge clk);
    rst = 1'b0;
    // main run
    for (i = 0; i < RUN_CYCLES; i = i + 1) begin
      @(posedge clk);
      // deterministic activity on 'sensor' (avoids $random quirks)
      sensor <= sensor ^ NS_Green ^ EW_Green ^ NS_Yellow ^ EW_Yellow;
      // heartbeat every 500 cycles so you see progress in Transcript
      if ((i % 500) == 0)
        $display("%0t: heartbeat (i=%0d)  NS[G,Y,R]=%0b%0b%0b  EW[G,Y,R]=%0b%0b%0b",
                 $realtime, i, NS_Green, NS_Yellow, NS_Red, EW_Green, EW_Yellow, EW_Red);
      // simple safety check: never both greens high in the same cycle
      if (!rst && (NS_Green & EW_Green)) begin
        $display("ERROR @ %0t: Both NS and EW GREEN!", $realtime);
        $stop;
      end
    end
    $display("** TB finish @ %0t **", $realtime);
    $finish;
  end
endmodule
