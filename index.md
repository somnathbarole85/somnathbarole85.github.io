---
title       : Reliability predictions using stress-strength interference
subtitle    : 
author      : Somnath S. Barole
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Reliability and Stress strength interference

When pressure or force is applied on a component, it induces stress in the component. More the applied force, more will be the stress.  

Strength is a material property and this is unique for perticular material.   

If induced stress in component is more than material strength then component will fail and will not be able to perform its intended function.    

Reliability is the ability of a component/machine/system to perform it's intended function for specified time under predefined conditions.  

Stregth and stresses are assumed to have normal distribution.   

If we plot distribution of strength and stress then the overlapping or common area between these two curves gives the probability of failure. Reliability, also called probability of component to perform without any failure is given by (1-probability of failure).

--- .class #id 

## Reliability and Stress strength interference
### Example:

Consider when the part is loaded (a) Stress developed is 300 MPa (b)Standard deviation of stress is 60 MPa (c)Strength of the material is 500 MPa and (d) Standard deviation of material strength is 50 MPa   
Below is the code chunk that explains Reliability and probability of failure of the component.

```r
Strength_mean <- 4000; Stress_sd <- 400; Stress_mean <- 2500; Strength_sd <- 500;
Z <- (Strength_mean - Stress_mean) / sqrt((Strength_sd^2 + Stress_sd^2))
Reliablity <- round(pnorm(Z), digits = 4); Prob_fail <- 1-Reliablity
Reliablity
```

```
## [1] 0.9904
```

```r
Prob_fail
```

```
## [1] 0.0096
```

--- .class #id 

## Reliability and Stress strength interference

Below is the plot showing stress strength interference.
The common area under these curve is the stress strength interference region and it gives probability of failure of the component.


<div style='text-align: center;'>
    <img height='480' src='Fig2.png' />
    </div>
    
--- .class #id 

## Slide5

---

## How to use this app??

Yo can open the app at below link:   

<https://reliabilitycalculator.shinyapps.io/Reliabilityapp/>

Enter the following inputs in the side bar panel   

1. Mean value of the material strength    

2. Standard deviation of material strength   

3. Mean value of the stress developed in the component   

4. Standard deviation of the stress    

Once all inputs are entered, hit submit button. You can see calculated value of Reliability, Probability of failure and plot with distribution of stress strength on the right side.    

More the value of Reliability, less the value of probability of failure indicates more likelyhood
of component performing well without any failure.
