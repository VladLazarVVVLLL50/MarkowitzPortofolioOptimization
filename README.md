# Portfolio Optimization (Markowitz Model)

## Overview
This project implements **Markowitz's Modern Portfolio Theory (MPT)** in **MATLAB**, optimizing portfolio investments to **maximize returns while minimizing risk**.

The model was developed by **Harry Markowitz in 1952**, earning him the **Nobel Prize in Economics in 1990**. It remains a key approach for portfolio allocation in financial markets.

## Problem Statement
Given an **initial capital**, how can we invest in different assets to **achieve the best risk-return balance**?

To solve this, we use:
- **Variance**: Measures an asset's risk (how much it deviates from its expected return).
- **Covariance**: Measures how two assets' returns move together (correlation of risks).

### Objective:
**Minimize portfolio volatility** while ensuring a target return.

## Mathematical Foundation
- **Portfolio Variance Minimization**
- **Quadratic Programming Approach**
- **Statistical Measures (Variance & Covariance)**
- **Optimization Techniques**:
  - **Projected Gradient Method**
  - **Frank-Wolfe Algorithm**

## Implementation (MATLAB)
This project is implemented in **MATLAB** using:
- **CVX (Convex Optimization Toolbox)**
- **Quadprog (MATLAB's Quadratic Programming Solver)**
- **Projected Gradient Method** for efficient convergence.
- **Frank-Wolfe Algorithm** as an alternative optimization approach.

## Results
- Both optimization methods successfully **converge**.
- **Projected Gradient Method** converges **faster** and requires **fewer iterations** than **Frank-Wolfe**.
- Results validate Markowitz's approach for **real-world portfolio optimization**.

## Visualization
- The project includes **graphs and performance comparisons** for different optimization methods.

## How to Run the Project
### Prerequisites:
- MATLAB (with **Optimization Toolbox** installed)
- CVX Toolbox (if used)

### Running the Code:
1. Open MATLAB and navigate to the project folder.
2. Run the main script:
