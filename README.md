# Traffic Light Controller using FSM

## Overview
[cite_start]This project implements an intelligent traffic management system designed for modern smart city infrastructure[cite: 15, 17]. [cite_start]Unlike traditional fixed-timer systems, this controller utilizes a **Finite State Machine (FSM)** to manage transitions between North-South (NS) and East-West (EW) directions[cite: 18, 19].

## Key Features
* [cite_start]**FSM-Based Logic:** Clearly defined states for Green, Yellow, and Red phases[cite: 19].
* [cite_start]**PWM Integration:** Includes a Pulse-Width Modulation (PWM) module for controlling light intensity[cite: 22].
* [cite_start]**Scalability:** Features a `big_system` module capable of instantiating up to 200 controllers for large-scale urban modeling[cite: 128, 142].
* [cite_start]**Parameterizable Design:** Easily adjust green and yellow light durations through Verilog parameters[cite: 25, 26].

## Implementation Details
* [cite_start]**Synthesis:** The design was synthesized using **Design Vision** (Version O-2018.06-SP1)[cite: 218, 222].
* [cite_start]**Cell Count:** The synthesized controller utilizes 3,631 cells with a total area of 5,709.00 units[cite: 292].
* [cite_start]**Hardware Mapping:** Verified through behavioral and mapped gate-level simulations to ensure functional parity[cite: 216].

## Simulation Results
The project includes simulation waveforms confirming:
1.  [cite_start]Safe transitions (no two green lights simultaneously)[cite: 203, 204].
2.  [cite_start]Accurate state timing based on internal counters [cite: 64-67].
3.  [cite_start]Successful hardware mapping and synthesis preservation[cite: 216].

---
[cite_start]**Submitted by:** Ganesh Manjunath & Aryan Verma [cite: 8, 11]
[cite_start]**Instructor:** Prof. Carl Sechen [cite: 6]
