# Genetic Algorithm for Underwater Acoustic Sensor Networks (UWASN)

## Overview

This project focuses on optimizing routing protocols for Underwater Acoustic Sensor Networks (UWASN) using Genetic Algorithms (GA). The primary objective is to improve energy efficiency and prolong network lifetime in underwater sensor networks, where communication is often challenged by high propagation delay, limited bandwidth, and increased bit error rates.
![Underwater Network](https://github.com/user-attachments/assets/cbe010d3-3cb0-41b7-88ec-2d3a9f9c88f7)


## Features

- **Genetic Algorithm Implementation**: Custom GA designed to optimize network parameters for enhanced performance.
- **Energy-Efficient Routing**: Incorporates a modified LEACH protocol to dynamically select cluster heads, improving energy distribution across the network.
- **Simulation Environment**: Built using NS2, enabling detailed simulation and analysis of network performance.
- **Visualization**: Node mobility and network performance visualized using NAM.

## Getting Started

### Prerequisites

- **NS2 (Network Simulator 2)**: Ensure NS2 is installed on your system.
  ```bash
  sudo apt-get install ns2
  ```

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/GururajaSR/UWASN_GeneticAlgorithm.git
   cd UWASN_GeneticAlgorithm
   ```

### Running the Simulation

To run the simulation using NS2, execute the following command:

```bash
ns project.tcl
```

The simulation will produce an output trace file (`out.tr`) and a NAM file (`out.nam`) for visualization.

### Visualizing the Simulation

To visualize the simulation:

```bash
nam out.nam
```

## Understanding the Simulation Results

The simulation results are logged in the output trace file (`out.tr`). This file captures the movement and interactions of nodes throughout the simulation. Each entry in the trace file provides valuable data about node activities, which can be used to analyze network performance.

### Example Trace Entry

Consider the following entry from the `out.tr` file:

```
M 10.50000 67 (1364.92, 627.13, 0.00), (1421.66, 299.00), 20.50
```

### Breakdown of the Entry

- **M**: Indicates a mobility event, meaning this line describes the movement of a node.
- **10.50000**: The simulation time at which this event occurred (in seconds). This helps in tracking node movement over time.
- **67**: The ID of the node that is moving. This identifier is used to track activities of a specific node.
- **(1364.92, 627.13, 0.00)**: The starting position of the node in 3D coordinates (x, y, z). Here, `x = 1364.92`, `y = 627.13`, and `z = 0.00` (since this is a 2D simulation, z is zero).
- **(1421.66, 299.00)**: The ending position of the node (x, y). The node moves to `x = 1421.66` and `y = 299.00`.
- **20.50**: The speed of the node's movement (in some units, typically meters per second). This indicates how fast the node is traveling between its starting and ending positions.


## Results and Analysis

### Fig-1: Initial Random Placement of Nodes
![Initial Random Placement of Nodes](https://github.com/user-attachments/assets/ed066e94-2931-40f5-9609-337361633dd1)



- **Description**: This figure shows the initial random placement of nodes within the simulation area. Nodes are scattered to simulate real-world deployment challenges in an underwater environment.

### Fig-2: Re-arranging of Nodes
![Re-arranging of Nodes](https://github.com/user-attachments/assets/ede136ba-6b05-4f04-a73b-e1ad98305199)


- **Description**: This figure illustrates the re-arrangement of nodes after applying the genetic algorithm. The re-arrangement aims to optimize node positions for improved network performance, as shown in the final simulation stage.

### Fig-3: Data Transmission with Nodes Moving Towards Destination
![Data Transmission](https://github.com/user-attachments/assets/5776f5d0-3b8d-43b8-98a1-e3439eb0cfcb)


- **Description**: Demonstrates the path data packets take from source to destination nodes. This visualization highlights the effectiveness of the genetic algorithm in ensuring efficient data transmission.

### Fig-4: Node Movement in NAM
![Node Movement in NAM](https://github.com/user-attachments/assets/ec561847-96fc-46cf-8464-d6e87ac92b5d)


- **Description**: Provides a visual representation of node movements through the network using NAM. This helps in understanding how nodes transition and interact dynamically.

### Fig-5: PDR (Packet Delivery Ratio) vs. Round Numbers
![PDR vs. Round Numbers](https://github.com/user-attachments/assets/e7087e4b-5121-4669-b8f9-3688b3780fe5)


- **Description**: Shows the Packet Delivery Ratio (PDR) across different rounds of the simulation. PDR measures the percentage of successfully delivered packets. 
- **Analysis**:
  - For networks with 1 to 35 nodes, the Vector-Based Forwarding (VBF) routing system outperforms the Depth-Based Routing (DBR) method, achieving a higher PDR.
  - For networks with 36 to 70 nodes, DBR performs better than VBF in terms of PDR.
  - For networks with 71 to 100 nodes, the Energy-Efficient Routing (EER) method demonstrates superior PDR compared to both DBR and VBF. This indicates that EER provides a more robust network for packet delivery.

### Fig-6: Delay vs. Node Density
![Delay vs. Node Density](https://github.com/user-attachments/assets/2201523c-a7d4-4983-a70e-6d8e7ecc5af3)


- **Description**: Examines the relationship between network delay and node density.
- **Analysis**:
  - Delay increases with higher node density due to increased network congestion.
  - All routing schemes show reduced efficiency with up to 76 nodes. 
  - DBR is more effective than VBF in reducing delay in networks with up to 76 nodes.
  - EER consistently outperforms DBR and VBF in terms of delay efficiency, indicating better performance in maintaining low delays even as node density increases.

### Fig-7: Residual Energy vs. Round Numbers
![Residual Energy vs. Round Numbers](https://github.com/user-attachments/assets/ca93a03a-8149-416c-93f0-8f1c0d1843d8)


- **Description**: Displays the remaining energy in nodes over multiple simulation rounds.
- **Analysis**:
  - All routing schemes show a decrease in residual energy with increasing rounds.
  - DBR has better energy generation in networks with 36 to 70 nodes and 71 to 100 nodes.
  - VBF has a more favorable total energy consumption profile compared to DBR.
  - EER shows the best residual energy efficiency, maintaining active nodes throughout cycles, thus extending network lifetime.

### Fig-8: Network Lifetime vs. Node Density
![Network Lifetime vs. Node Density](https://github.com/user-attachments/assets/e36ca005-cfca-4aff-bfc1-4f2c8b74d3da)


- **Description**: Correlates network lifetime with node density.
- **Analysis**:
  - Network lifetime decreases with increasing node density due to higher communication overhead.
  - EER shows significant improvement in network lifetime compared to DBR and VBF, demonstrating its effectiveness in sustaining network operation for longer periods.

## Fig-9: Underwater Networking Visualization
![Underwater Networking](https://github.com/user-attachments/assets/860ed273-33e9-4248-9cc8-4eef6d583982)


-**Description**: Provides a comprehensive view of node interactions and data flow in the underwater network.
- **Analysis**:
  - Highlights the overall network connectivity and data transmission dynamics.
  - Demonstrates the effectiveness of the routing strategies in managing communication in a complex underwater environment.

## Key Metrics and Performance Evaluation

### Packet Delivery Ratio (PDR)
- **Importance**: Measures the success rate of packet delivery. Higher PDR indicates better network reliability.
- **Evaluation**: Use Fig-5 to assess the impact of routing techniques on packet delivery success.

### Energy Consumption
- **Importance**: Critical for networks with energy-limited nodes.
- **Evaluation**: Fig-7 provides insights into energy efficiency and helps identify optimal configurations for minimizing energy usage.

### Network Lifetime
- **Importance**: Indicates how long the network remains operational before node batteries are depleted.
- **Evaluation**: Fig-8 shows how node density affects network lifetime and the effectiveness of different routing strategies in prolonging operation.

## Contributing

Contributions are welcome! If you have suggestions or new features, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
