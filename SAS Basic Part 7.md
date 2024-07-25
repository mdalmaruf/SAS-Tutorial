# Data Analysis with SAS: Supervised and Unsupervised Learning

## Introduction
In this tutorial, we will cover two fundamental types of machine learning techniques: Supervised Learning and Unsupervised Learning. We will use the `Poverty` dataset to perform clustering using SAS.

## Supervised vs Unsupervised Learning

### Supervised Learning
Supervised learning involves training a model on a labeled dataset, which means that each training example is paired with an output label. The goal is to learn a mapping from inputs to outputs that can be used to predict the labels of new, unseen data.

**Examples:**
- **Classification:** Predicting a categorical label (e.g., whether an email is spam or not).
- **Regression:** Predicting a continuous value (e.g., predicting house prices).

### Unsupervised Learning
Unsupervised learning involves training a model on data without labeled responses. The goal is to identify patterns, groupings, or underlying structures in the data.

**Examples:**
- **Clustering:** Grouping similar data points together (e.g., customer segmentation).
- **Dimensionality Reduction:** Reducing the number of features in the dataset while retaining essential information (e.g., PCA).
- **Association:** It is about finding relationships between variables in large datasets. You remember the “customers who bought this also bought these” prompt, right?


## Differences between Classification, Regression, and Clustering

| Aspect               | Classification                  | Regression                       | Clustering                          |
|----------------------|---------------------------------|----------------------------------|-------------------------------------|
| **Goal**             | Predict categorical labels      | Predict continuous values        | Identify natural groupings in data  |
| **Type of Learning** | Supervised                      | Supervised                       | Unsupervised                        |
| **Output**           | Discrete categories             | Continuous values                | Clusters (groups)                   |
| **Example Algorithms** | Logistic Regression, Decision Trees | Linear Regression, Polynomial Regression | K-Means, Hierarchical Clustering |

## Clustering Example with Poverty Dataset
We will use the provided Poverty dataset to perform clustering using SAS. The dataset includes various indicators related to poverty for different countries.

### Data Preparation
```sas
data Poverty;
   input Birth Death InfantDeath Country $20. @@;
   datalines;
24.7  5.7  30.8 Albania               12.5 11.9  14.4 Bulgaria
13.4 11.7  11.3 Czechoslovakia        12   12.4   7.6 Former E. Germany
11.6 13.4  14.8 Hungary               14.3 10.2    16 Poland
13.6 10.7  26.9 Romania                 14    9  20.2 Yugoslavia
17.7   10    23 USSR                  15.2  9.5  13.1 Byelorussia SSR
13.4 11.6    13 Ukrainian SSR         20.7  8.4  25.7 Argentina
46.6   18   111 Bolivia               28.6  7.9    63 Brazil
23.4  5.8  17.1 Chile                 27.4  6.1    40 Columbia
32.9  7.4    63 Ecuador               28.3  7.3    56 Guyana
34.8  6.6    42 Paraguay              32.9  8.3 109.9 Peru
  18  9.6  21.9 Uruguay               27.5  4.4  23.3 Venezuela
  29 23.2    43 Mexico                  12 10.6   7.9 Belgium
13.2 10.1   5.8 Finland               12.4 11.9   7.5 Denmark
13.6  9.4   7.4 France                11.4 11.2   7.4 Germany
10.1  9.2    11 Greece                15.1  9.1   7.5 Ireland
 9.7  9.1   8.8 Italy                 13.2  8.6   7.1 Netherlands
14.3 10.7   7.8 Norway                11.9  9.5  13.1 Portugal
10.7  8.2   8.1 Spain                 14.5 11.1   5.6 Sweden
12.5  9.5   7.1 Switzerland           13.6 11.5   8.4 U.K.
14.9  7.4     8 Austria                9.9  6.7   4.5 Japan
14.5  7.3   7.2 Canada                16.7  8.1   9.1 U.S.A.
40.4 18.7 181.6 Afghanistan           28.4  3.8    16 Bahrain
42.5 11.5 108.1 Iran                  42.6  7.8    69 Iraq
22.3  6.3   9.7 Israel                38.9  6.4    44 Jordan
26.8  2.2  15.6 Kuwait                31.7  8.7    48 Lebanon
45.6  7.8    40 Oman                  42.1  7.6    71 Saudi Arabia
29.2  8.4    76 Turkey                22.8  3.8    26 United Arab Emirates
42.2 15.5   119 Bangladesh            41.4 16.6   130 Cambodia
21.2  6.7    32 China                 11.7  4.9   6.1 Hong Kong
30.5 10.2    91 India                 28.6  9.4    75 Indonesia
23.5 18.1    25 Korea                 31.6  5.6    24 Malaysia
36.1  8.8    68 Mongolia              39.6 14.8   128 Nepal
30.3  8.1 107.7 Pakistan              33.2  7.7    45 Philippines
17.8  5.2   7.5 Singapore             21.3  6.2  19.4 Sri Lanka
22.3  7.7    28 Thailand              31.8  9.5    64 Vietnam
35.5  8.3    74 Algeria               47.2 20.2   137 Angola
48.5 11.6    67 Botswana              46.1 14.6    73 Congo
38.8  9.5  49.4 Egypt                 48.6 20.7   137 Ethiopia
39.4 16.8   103 Gabon                 47.4 21.4   143 Gambia
44.4 13.1    90 Ghana                   47 11.3    72 Kenya
  44  9.4    82 Libya                 48.3   25   130 Malawi
35.5  9.8    82 Morocco                 45 18.5   141 Mozambique
  44 12.1   135 Namibia               48.5 15.6   105 Nigeria
48.2 23.4   154 Sierra Leone          50.1 20.2   132 Somalia
32.1  9.9    72 South Africa          44.6 15.8   108 Sudan
46.8 12.5   118 Swaziland             31.1  7.3    52 Tunisia
52.2 15.6   103 Uganda                50.5   14   106 Tanzania
45.6 14.2    83 Zaire                 51.1 13.7    80 Zambia
41.7 10.3    66 Zimbabwe
;
```

# K-Means Clustering in SAS

## Introduction to K-Means Clustering
K-means clustering is an unsupervised learning algorithm that partitions data into k distinct clusters based on distance metrics. The goal is to minimize the variance within each cluster. Each cluster is represented by its centroid, which is the mean of the points in that cluster.

## How K-Means Clustering Works
1. **Initialization:** Choose k initial centroids randomly from the data points.
2. **Assignment:** Assign each data point to the nearest centroid based on the Euclidean distance.
3. **Update:** Recalculate the centroids as the mean of all data points assigned to each cluster.
4. **Repeat:** Repeat the assignment and update steps until the centroids no longer change or a maximum number of iterations is reached.

### Centroid and Distance
- **Centroid:** The center of a cluster, calculated as the mean of all points in the cluster.
- **Distance:** Typically, the Euclidean distance is used to measure the distance between a point and a centroid.

## Performing K-Means Clustering in SAS

### Step 1: Standardizing the Data
Standardizing the data ensures that each variable contributes equally to the distance calculations.

```sas
proc standard data=Poverty mean=0 std=1 out=Poverty_std;
   var Birth Death InfantDeath;
run;
```
**Explanation:**

- PROC STANDARD: Standardizes the variables to have a mean of 0 and a standard deviation of 1.
- out=Poverty_std: Saves the standardized dataset as Poverty_std.
- var Birth Death InfantDeath: Specifies the variables to standardize

## Step 2: K-Means Clustering using PROC FASTCLUS

The PROC FASTCLUS procedure in SAS performs the K-means clustering.

```sas
proc fastclus data=Poverty_std maxclusters=3 out=Clusters;
   var Birth Death InfantDeath;
   id Country;
run;
```
**Explanation:**

- **PROC FASTCLUS:** Performs K-means clustering.
- **data=Poverty_std:** Uses the standardized dataset.
- **maxclusters=3:** Specifies the number of clusters.
- **out=Clusters:** Saves the output dataset with cluster assignments.
- **var Birth Death InfantDeath:** Specifies the variables used for clustering.
- **id Country:** Identifies each observation by the country name.

## Step 3: Visualizing the Clusters

To visualize the clusters, we use the PROC SGPLOT procedure.

```sas
proc sgplot data=Clusters;
   scatter x=Birth y=Death / group=Cluster markerattrs=(symbol=CircleFilled size=12);
   title "K-Means Clustering of Poverty Data";
run;
```

**Explanation:**

- **PROC SGPLOT:** Generates plots for data visualization.
- **data=Clusters:** Uses the dataset with cluster assignments.
- **scatter x=Birth y=Death / group=Cluster:** Creates a scatter plot of the Birth and Death variables, grouped by clusters.
- **markerattrs=(symbol=CircleFilled size=12):** Customizes the appearance of the markers.
- **title "K-Means Clustering of Poverty Data":** Adds a title to the plot.

## Example Output

The output will show a scatter plot of the Birth and Death rates for each country, with different colors or symbols representing the different clusters. This visualization helps to see how the countries are grouped based on their poverty indicators.




# Extra Task
## Clustering Analysis PCA

### Step 1: Principal Component Analysis (PCA) using PROC ACECLUS

```sas
proc aceclus data=Poverty out=Ace p=.03 noprint;
   var Birth Death InfantDeath;
run;
```

**Explanation:**

- **PROC ACECLUS:** Performs a principal component analysis (PCA) on the variables Birth, Death, and InfantDeath to reduce dimensionality.
- **out=Ace:** Saves the output dataset as Ace.
- **p=.03:** Specifies the proportion of the data to be used for the analysis.
- **noprint:** Suppresses the output.

### Step 2: Hierarchical Clustering using PROC CLUSTER

```sas
ods graphics on;

proc cluster data=Ace method=ward ccc pseudo print=15 out=tree
   plots=den(height=rsq);
   var can1-can3;
   id Country;
run;

ods graphics off;
```
**Explanation:**

- **PROC CLUSTER:** Performs hierarchical clustering on the data.
- **method=ward:** Specifies Ward's minimum variance method for clustering.
- **ccc pseudo print=15:** Requests the cubic clustering criterion and pseudo statistics for the first 15 clusters.
- **out=tree:** Saves the clustering results as tree.
- **plots=den(height=rsq):** Creates a dendrogram with height based on the R-squared value.
- **var can1-can3:** Uses the first three canonical variables for clustering.
- **id Country:** Uses Country as the identifier for each observation.

### Step 3: Creating Clusters using PROC TREE

```sas
proc tree data=tree out=new nclusters=3 noprint;
   height _rsq_;
   copy can1 can2;
   id Country;
run;
```

**Explanation:**

- **PROC TREE:** Creates clusters from hierarchical clustering results.
- **data=tree:** Uses the dataset from the hierarchical clustering step.
- **out=new:** Saves the new dataset with cluster assignments.
- **nclusters=3:** Specifies the number of clusters to create.
- **noprint:** Suppresses the output.
- **height _rsq_:** Uses the R-squared value as the height criterion for clustering.
- **copy can1 can2:** Copies the specified canonical variables to the new dataset.
- **id Country:** Uses Country as the identifier for each observation.

## Step 4: Visualizing Clusters using PROC SGPLOT

```sas
proc sgplot data=new;
   scatter y=can2 x=can1 / group=cluster;
run;
```
**Explanation:**

- **PROC SGPLOT:** Generates plots for data visualization.
- **data=new:** Uses the dataset with cluster assignments.
- **scatter y=can2 x=can1 / group=cluster:** Creates a scatter plot of the canonical variables, grouped by clusters.

## Conclusion
This tutorial provided an overview of supervised and unsupervised learning and demonstrated examples of classification, regression, and clustering using SAS. The Poverty dataset was used to perform clustering, illustrating the steps and analysis involved in such tasks.



