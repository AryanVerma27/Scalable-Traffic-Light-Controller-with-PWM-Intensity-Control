# Traffic Light Controller using FSM

## Overview
This project implements an intelligent traffic management system designed for modern smart city infrastructure. Unlike traditional fixed-timer systems, this controller utilizes a **Finite State Machine (FSM)** to manage transitions between North-South (NS) and East-West (EW) directions.

## Key Features
* **FSM-Based Logic:** Clearly defined states for Green, Yellow, and Red phases.
* **PWM Integration:** Includes a Pulse-Width Modulation (PWM) module for controlling light intensity.
* **Scalability:** Features a `big_system` module capable of instantiating up to 200 controllers for large-scale urban modeling.
* **Parameterizable Design:** Easily adjust green and yellow light durations through Verilog parameters.

## Implementation Details
* **Synthesis:** The design was synthesized using **Design Vision** (Version O-2018.06-SP1).
* **Cell Count:** The synthesized controller utilizes 3,631 cells with a total area of 5,709.00 units.
* **Hardware Mapping:** Verified through behavioral and mapped gate-level simulations to ensure functional parity.

## Simulation Results
The project includes simulation waveforms confirming:
1.  Safe transitions (no two green lights simultaneously).
2.  Accurate state timing based on internal counters .
3.  Successful hardware mapping and synthesis preservation.

---
**Submitted by:** Aryan Verma 
**Instructor:** Prof. Carl Sechen 
