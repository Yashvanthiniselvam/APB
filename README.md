# 🔗 AMBA APB Master-Slave Protocol (Verilog)

## 📌 Project Overview

This project implements the **AMBA APB (Advanced Peripheral Bus)** protocol using Verilog.
It includes both **Master and Slave modules** with FSM-based control logic.

---

## ⚙️ Features

* ✔ APB FSM: IDLE → SETUP → ACCESS
* ✔ Read & Write operations
* ✔ Proper PREADY handling
* ✔ Address & data transfer
* ✔ Fully verified using testbench

---


## 🧠 Design Details

### Master

* Generates control signals (`psel`, `penable`, `pwrite`)
* Handles state transitions

### Slave

* Responds with `pready`
* Performs memory read/write operations

---

## 🧪 Simulation

Simulated using:

* Cadence Xcelium / EDA Playground

---

## 📁 Files

* `apb_master.v` → Master module
* `apb_slave.v` → Slave module
* `tb_apb.v` → Testbench
* `apb_waveform.png` → Simulation output

---

## 🚀 Author

Yashvanthini Selvam
