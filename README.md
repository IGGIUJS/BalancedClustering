# BalancedKmeans
The source code of the paper "Optimizing MSE for Clustering with Balanced Size Constraints"
# Description
## Data
The real datasets we used in this work.

## Regression statistic
The regression statistic results which used to evaluate the time of our algorithm

## Statistic Results
The experiments we have done in this work.This floder includes Clustering,SinglePartition and ClusteringProcedure.

### Clustering
This dictionary includes the clustering experiments results of random and real datesets and the scripts we have used.

### SinglePartition
This dictionary includes the single partition experiments results of random and real datesets and the scripts we have used.

### ClusteringProcedure
This dictionary includes the figure we used to explain the procedure of our method and the figure-drawing script we have used.

## AssignmentByIntLinPro.m & BalancedKmeansWithIntLinPro.m
These two files using 0-1 integer programming to assign the observations into clusters to solve the balanced assignment problem.

## getCostMat.m & getCostMatMe.m
Get the cost matrix of Hungarian algorithm and our algorithm.These two files used in the experiments which mean to evaluete the 
performance of sinle partition.

## kmeanapp.m
The best version of kmeans++ implementation
