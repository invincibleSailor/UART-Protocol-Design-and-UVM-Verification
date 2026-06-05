# UART Protocol Design and UVM Verification

## Overview

This project implements a configurable UART (Universal Asynchronous Receiver Transmitter) in SystemVerilog and verifies its functionality using a UVM-based verification environment.

The UART supports:

* Variable baud rates
* Configurable data lengths (5, 6, 7, and 8 bits)
* Optional parity generation and checking
* Odd and Even parity modes
* Single and Dual stop bits
* Full duplex communication through transmitter and receiver modules

---

## Features

### UART Transmitter

* Start bit generation
* Data serialization
* Configurable data length
* Optional parity generation
* One or two stop bits

### UART Receiver

* Start bit detection
* Data deserialization
* Parity checking
* Stop bit validation
* Error detection

### Clock Generator

Supported baud rates:

* 4800
* 9600
* 14400
* 19200
* 38400
* 57600

---

## Verification Methodology

The design is verified using Universal Verification Methodology (UVM).

### UVM Components

* Transaction
* Sequence
* Sequencer
* Driver
* Monitor
* Agent
* Environment
* Scoreboard
* Test

### Verification Scenarios

#### Baud Rate Verification

* Random baud rate generation
* Single stop bit mode
* Dual stop bit mode

#### Data Length Verification

* 5-bit transmission
* 6-bit transmission
* 7-bit transmission
* 8-bit transmission

#### Parity Verification

* Even parity enabled
* Odd parity enabled
* Parity disabled

#### Stop Bit Verification

* Single stop bit
* Dual stop bit

---

## Testbench Architecture

Transaction → Sequencer → Driver → DUT

DUT → Monitor → Scoreboard

The scoreboard compares transmitted data with received data and reports PASS/FAIL status.

---

## Results

All verification scenarios passed successfully.

Verified combinations include:

* Multiple baud rates
* Different frame lengths
* Parity enabled/disabled
* Single and dual stop bits
<img width="1827" height="425" alt="image" src="https://github.com/user-attachments/assets/81e82790-f1a7-4ffa-b899-335afb69740e" />

---

## Tools Used

* SystemVerilog
* UVM
* ModelSim / QuestaSim
* GTKWave

---

## Future Enhancements

* Functional Coverage
* Assertions (SVA)
* UART Register Model
* APB-UART Integration
* Error Injection Testing
* Coverage Driven Verification

---

## Author

Kashyap Joshi

Electronics and Communication Engineering

Institute of Technology, Nirma University
