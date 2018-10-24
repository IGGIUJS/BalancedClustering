# BalancedKmeans
The source code of the paper "Optimizing MSE for Clustering with Balanced Size Constraints".
# How to use?
This alogrithm is very easy to use! First you need to init some points as the initial centroids. We recommend you using kmeans++ which has been provided in the kmeanpp.m to generate them. Then you just need to call the balancedKmeans function which contains in BalancedKmeansWithIntLinPro.m. Examples can be found in the path of /Statistic Results/Clustering/ClusteringRandomDatasets.m or /Statistic Results/Clustering/ClusteringRealDatasets.m. Also, if you want to using our proposed balanced assingment algorithm, you can find examples in the path of /Statistic Results/SinglePartition/singlepartition.m. 
# Notice
Notice that we can not provide the code of the paper "Malinen M I, Fränti P. Balanced K-Means for Clustering[C]// Joint Int. Workshop on Structural, Syntactic, and Statistical Pattern Recognition. 2014:32-41" which had been used in our experiments without the authors' approval. So if you run the /Statistic Results/Clustering/ClusteringRandomDatasets.m natively, you may catch some problems such as Matlab can not find the file. If you want to reproduce our experiments, you need to contact the authors for the code first. Moreover, to use our algothm in your field, you may need to change some parameter like n, k, etc.
# Description
## Data
The real datasets we used in this work. Notice that the sythetic datasets we had used was contains in the result of our experimental results. You can find both sythetic and real datasets in the experimental results. 

## Regression statistic
The regression statistic results which used to evaluate the running time of our algorithm.

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
Get the cost matrix of the Hungarian algorithm and our algorithm. These files are used in the experiments which evaluate the performance of the balanced assignment.

## kmeanspp.m
The best version of kmeans++ implementation.

## BalancedKmeansWithKbs.m
The implementation of "Zhu S, Wang D, Li T. Data clustering with size constraints[J]. Knowledge-Based Systems, 2010, 23(8):883-889".
