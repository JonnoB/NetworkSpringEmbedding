<p align="center">
<img src="https://github.com/JonnoB/rSETSe/blob/master/SETSe_logo.png" width="300", >
</p>

## An R package for embedding graphs using the SETSe algorithm

This is the R package for the Strain Elevation Tension Spring embeddgins (SETSe) algorithm. SETSe is a deterministic graph embeddings algorithm. It converts the node attributes of a graph into forces and the edge attributes into springs. The algorithm finds an equilibrium position when the forces of the nodes are balanced by the forces on the springs. A full description of the algorithm is given in my forthcoming paper "The spring bounces back: Introduction to Strain Elevation Tension Spring embedding for network representation"

# Installation instructions

 1. Open R/Rstudio and ensure that devtools has been installed
 1. Run the following code library(devtools); install_github("JonnoB/rSETSE")
 1. Load the Power Grid Networking package normally using library(rSETSe)
 1. All functions have help files e.g ?auto_SETSe

The package can also be downloaded or cloned then installed locally using the install function from devtools.

# Basic use

```
library(rSETSe)

#prepares a graph for embedding using SETSe
set.seed(234) #set the random see for generating the network
g <- generate_peels_network(type = "E") %>%
  #prepare the network for a binary embedding
  prepare_SETSe_binary(., node_names = "name", k = 1000, 
                       force_var = "class", 
                       positive_value = "A") 
                       
#Embedds using the bi-connected auto-parametrization algorithm.
#This method is strongly reccomended, it tends to be much faster and almost always converges
embeddings <- SETSe_bicomp(g,
                           tol = sum(abs(vertex_attr(g, "force")))/1000,
                           hyper_tol = 0.1,
                           hyper_iters = 3000,
                           verbose = T)

```

The code used in this package is part of my PhD and a fundemental component of the below projects

* The spring bounces back ([code](https://github.com/JonnoB/SETSe_assortativity_and_clusters))
* Power grid robusteness ([code](https://github.com/JonnoB/setse_and_network_robustness/edit/master/README.md))

# N.B

The package is still underdevleopment and does not have any examples of code. For current examples of code see the links above.
