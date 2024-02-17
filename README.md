*AGEC 652 - Spring 2024*

*Department of Agricultural Economics, Purdue University*

*Instructor: Diego S. Cardoso*


# Problem set 2

**Due Feb. 29 at 8 PM**

**Instructions**: To submit your solution, please commit and push your solution files to your GitHub Education repository. Files must be named `ps2_qX.jl` (or `.py`), where X is the number of the question you are solving. 


### Setting for Questions 1 and 2

Consider an economy with two goods, where each good has its own market characterized by isoelastic supply and demand functions. The supply for each good $i$ is given by an isoelastic function $S_i = c_i p_i^{\sigma_i}$, where $c_i$ is a constant, $p_i$ is the price of good $i$, and $\sigma_i$ is the price elasticity of supply for good $i$.

The demand for each good $i$ is also isoelastic but depends not only on its own price $p_i$ but also on the price of the other good $j$ and is multiplied by some income level $y$. The demand function is given by $D_i = y p_i^{\epsilon_{ii}} p_j^{\epsilon_{ij}}$, where $\epsilon_{ii}$ is the own price elasticity of demand for good $i$, and $\epsilon_{ij}$ is the cross-price elasticity of demand for good $i$ with respect to the price of good $j$.

This setting gives us 6 unknowns: $S_1, S_2, D_1, D_2, p_1, p_2$. We have the four equations above representing supply and demand. To close the model, we need two additional equations: market clearing conditions. This is: $S_1 = D_1$ and $S_2 = D_2$. To simplify the system, we will embed the market clearing conditions and call $q_i$ as the quantity that clears the market. This way, the market equilibrium is now represented by the system

$$
\begin{align}
q_1 & = c_1 p_1^{\sigma_1} \\
q_2 & = c_2 p_2^{\sigma_2} \\
q_1 & = y p_1^{\epsilon_{11}} p_2^{\epsilon_{12}} \\
q_2 & = y p_2^{\epsilon_{ii}} p_2^{\epsilon_{22}} \\
\end{align}
$$


### Question 1

A. Using a package to solve nonlinear systems, solve the system formed by nonlinear equations $1-4$ above using an adequate method of your choice. For that, use the following parameters:

- $c_1 = 2.0$, $c_2 = 3.0$
- $σ_1 = 1.5$, $σ_2 = 1.3$
- $ϵ_{11} = -1.2$, $ϵ_{12} = ϵ_{21} = 0.2$, $ϵ_{22} = -1.6$
- $y_0 = 10.0$

B. Next, solve the same system but for an income level 10% higher: $y_1=11.0$. Then, calculate the percent changes for each endogenous variable $(q_1, q_2, p_1, p_2)$.

### Question 2

Log-linearizing equations is a common technique in economics to perform comparative statics and calculate the approximate impact of exogenous shocks in markets. In this question, you will use this technique to calculate the impact of an exogenous shock on income.

Given an equilibrium, we are interested in quantifying the impact of a small percent shock in income $\tilde{y} \equiv \frac{dy}{y}$ on prices and quantities. To log-linearize the model, we will rely on the fact that $\tilde{x} \equiv \frac{dx}{x} = d \ln x$ for any variable $x >0$. Applying this identity, we can totally differentiate each of the equations to obtain *(try showing this by yourself to get a good practice on log-linearization)*

$$
\begin{align}
\tilde{q_1} - \sigma_1 \tilde{p_1} & = 0\\
\tilde{q_2} - \sigma_2 \tilde{p_2} & = 0\\
\tilde{q_1} - \epsilon_{11} \tilde{p_1} - \epsilon_{12} \tilde{p_2} & = \tilde{y} \\
\tilde{q_2} - \epsilon_{21} \tilde{p_1} - \epsilon_{22} \tilde{p_2} & = \tilde{y} \\
\end{align}
$$

With this, we formed a $4 \times 4$ system that allows us to estimate the percent changes in equilibrium variables given an exogenous shock!

A. Solve the linear system formed by equations $5-8$ above for a 10% income increase shock: $\tilde{y} = 0.1$.

B. Compare the results from questions 1 and 2. Discuss the relative merits of both approaches. In doing so, consider what characteristics of this specific model improves or lowers the quality of the log-linearized approximation.

### Question 3

In econometrics, Ordinary Least Squares (OLS) estimation is a fundamental method for estimating the parameters of a linear regression model. For a simple linear regression model with one independent variable, the model can be expressed as:

$$y_i = \beta_0 + \beta_1 x_i + \epsilon_i$$

where $y_i$ is the dependent variable, $x_i$ is the independent variable, $\beta_0$ is the intercept, $\beta_1$ is the slope, and $\epsilon_i$ is the error term for observation $i$.

Your task is to estimate the parameter vector $\beta = [\beta_0, \beta_1]$ of this linear regression using two methods. Your repository will contain a starter code that generates synthetic data for your estimation. Please do not modify that code and only insert your solution below it. *(If you are using a language other than Julia, please generate synthetic data following the same steps and true values of $\beta$.)*

A. **Linear system of equations approach**: Using the matrix formulation of the OLS estimator, solve for $\beta$ as an unkown vector of a linear system of equations. *(You can check how to formulate that system of equations in your econometrics textbook)*

B. **Non-linear equation approach**: Solve for $\beta$ as the solution to a non-linear equation representing the first-order conditions of the minimization problem of the sum of squared residuals. The steps below outline how to do it.
   1. Let $F(\beta) = \sum_{i=1}^N (y_i - \beta_0 - \beta_1 x_i)^2$ be the sum of squared residuals we want to minimize. Then, the FOCs of $\min_\beta F(\beta)$ will be given by $\frac{\partial F}{\partial \beta_0} = 0$ and $\frac{\partial F}{\partial \beta_1} = 0$.  Analytically derive the FOCs for $\beta_0$ and $\beta_1$. *(You don't need to type this into your solution)*
   2. Program a function that take a candidate value $\beta^{(k)}$ and returns a vector of equations $[\frac{\partial F}{\partial \beta_0}, \frac{\partial F}{\partial \beta_1}]$.
   3. Use an adequate solver of your choice to estimate $\beta$ using your function from the previous step (i.e., find the roots of the system of nonlinear equations formed by the FOCs).

C. **Discussion**. Compare your solutions from parts A and B. Are they close?

