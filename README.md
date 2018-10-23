# BalancedKmeans
The source code of the paper "Optimizing MSE for Clustering with Balanced Size Constraints"
# How to use?
This alogrithm is very easy to use! First you need to init some points as the initial centroids. We recommend you using kmeans++ which provided in the kmeanpp.m to generate them. Then you just need to call the balancedKmeans function which contains in BalancedKmeansWithIntLinPro.m. Examples can be found in /Statistic Results/Clustering/
# Description
## Data
The real datasets we used in this work.

## Regression statistic
The regression statistic results which used to evaluate the time of our algorithm

## Statistic Results
The experiments we have done in this work. This floder includes the dictionary of Clustering, SinglePartition and ClusteringProcedure. Notice that the sythetic datasets and real datasets are both contain in the results. If you load these .Mat files in matlab, you can found all of the values.

### Clustering
This dictionary includes the clustering results of both random and real datesets and the scripts we have used.

### SinglePartition
This dictionary includes the balanced assignment results of both random and real datesets and the scripts we have used.

### ClusteringProcedure
This dictionary includes the figure we used to explain the procedure of our method and the figure-drawing script we have used.

## AssignmentByIntLinPro.m & BalancedKmeansWithIntLinPro.m
The two files using 0-1 integer programming to assign observations into clusters to solve the balanced assignment problem.

## getCostMat.m & getCostMatMe.m
Get the cost matrix of the Hungarian algorithm and our algorithm. These files used to evaluate the performance of the balanced assignment.

## kmeanspp.m
The best version of kmeans++ implementation.
