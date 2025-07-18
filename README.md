# Robotic Arm Cube Grasping with SAC & LeRobot (MuJoCo Simulation)

This repository contains the necessary code to train a simulated robotic arm to grasp a cube using **reinforcement learning**. The simulation is built with **MuJoCo** and the training leverages the [LeRobot](https://lerobot.org/) library, implementing the **Soft Actor-Critic (SAC)** algorithm.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [How to Run (Lightning.ai / Headless Environments)](#how-to-run-lightningai--headless-environments)

---

## Overview

This project demonstrates how to train a simulated robotic arm in the MuJoCo environment to pick up a cube using reinforcement learning. Main components:

- **MuJoCo Simulation:** Physics-based environment for robotic manipulation.
- **LeRobot Library:** Simplifies robotics and RL integration.
- **Soft Actor-Critic (SAC):** State-of-the-art RL algorithm.

---

## Features

- End-to-end training pipeline for robotic manipulation.

---


## How to Run (Lightning.ai / Headless Environments)

If you are running in a headless environment (such as [Lightning.ai](https://lightning.ai/)), you need to set up a virtual display.  
From the folder that contains this repository, run:

```bash
chmod +x ./simple_sac_pick_cube/no_display_env_utils/start_server.sh
chmod +x ./simple_sac_pick_cube/no_display_env_utils/noVNC/utils/websockify/run
./simple_sac_pick_cube/no_display_env_utils/start_server.sh
```