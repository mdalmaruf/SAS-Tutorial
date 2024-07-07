# Instructions to Import `ameshousing3.sas7bdat` and Perform Various Tasks in SAS Studio

## Step 1: Assign a Library Reference
To start, assign a library reference to the directory where the dataset is located.
```sas
libname mydata '/home/u63922045/SAS24';
```
### Step 2: Read the Dataset
Create a new dataset named ames from the uploaded ameshousing3 dataset.
```sas
data ames;
    set mydata.ameshousing3;
run;

```
### Step 3: Display the First 10 Observations
Use the `proc print` procedure to print the first 10 observations of the dataset to verify it has been read correctly.
```sas
proc print data=ames (obs=10);
run;

```
### Step 4: Generate Summary Statistics
Generate summary statistics and metadata about the dataset using the `proc contents` procedure.
```sas
proc contents data=ames;
run;
```
### Categorical Variables: Frequency Distribution
Generate frequency distributions for categorical variables, such as `House_Style` and `Lot_Area`.

```sas
proc freq data=ames;
    tables House_Style Lot_Area;
run;
```
### Interval Variables: Mean, Median, Standard Deviation of Sale Prices
Calculate the mean, median, standard deviation, and other statistics for interval variables like `SalePrice`
```sas
proc means data=ames;
    var SalePrice;
run;

```
### Visualization: Histograms for Interval Variables
Create histograms to visualize the distribution of interval variables, such as house prices.

```sas
proc sgplot data=ames;
    histogram SalePrice;
run;
```
###  Visualization: Bar Charts for Categorical Variables
Create bar charts to visualize the count of categorical variables, such as house styles.

```sas
proc sgplot data=ames;
    vbar House_Style;
run;

```
### Full Code Example
Below is the full code that you can run in SAS Studio to perform the above tasks.
```sas
/* Step 1: Assign a library reference */
libname mydata '/home/u63922045/SAS24';

/* Step 2: Read the dataset */
data ames;
    set mydata.ameshousing3;
run;

/* Step 3: Display the first 10 observations */
proc print data=ames (obs=10);
run;

/* Step 4: Generate summary statistics */
proc contents data=ames;
run;

/* Categorical Variables: Frequency of different building types and lot areas */
proc freq data=ames;
    tables House_Style Lot_Area;
run;

/* Interval Variables: Mean, median, standard deviation of sale prices */
proc means data=ames;
    var SalePrice;
run;

/* Visualization: Histograms for Interval Variables: Distribution of house prices */
proc sgplot data=ames;
    histogram SalePrice;
run;

/* Visualization: Bar Charts for Categorical Variables: Count of houses by house style */
proc sgplot data=ames;
    vbar House_Style;
run;
```



