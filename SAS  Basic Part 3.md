# Instructions to Import `ameshousing3.sas7bdat` and Perform Various Tasks in SAS Studio

## Step 1: Assign a Library Reference
To start, assign a library reference to the directory where the dataset is located.
```sas
libname mydata '/home/u639220466/SAS24';
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
libname mydata '/home/u639220466/SAS24';

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

## Additional Descriptive Statistics

Here are the definitions and examples for some descriptive statistics:

### Frequency

- **Definition**: The number of times a particular value appears in a dataset.
- **Example**: If the dataset contains the values [1, 2, 2, 3, 4], the frequency of 2 is 2 because it appears twice.

### Mean

- **Definition**: The average of a dataset.
- **Example**: For the numbers 1, 2, 3, 4, 5, the mean is (1+2+3+4+5)/5 = 3.

### Median

- **Definition**: The middle value when the data is sorted.
- **Example**: For the numbers 1, 2, 3, 4, 5, the median is 3.

### Mode

- **Definition**: The number that occurs most often in a data set.
- **Example**: In the dataset [1, 2, 2, 3, 4], the mode is 2 because it appears most frequently.

### Standard Deviation

- **Definition**: Measures the spread of data points.
- **Example**: In a dataset where most values are near the mean, the standard deviation is low.

By following these instructions, you can successfully import the `ameshousing3.sas7bdat` file into SAS Studio and perform various descriptive statistical analyses and visualizations.

## Additional Analyses and Visualizations

### Line Graph

Create a line graph to visualize trends over time or other continuous variables.

```sas
proc sgplot data=ames;
    series x=Year_Built y=SalePrice;
run;
```
You will find line graph quite cluttered due to the large number of data points. Therefore, you can reduce the number of data or observation.

```sas
/* Filter the first 20 observations */
data ames_first_20;
    set ames(obs=20);
run;

/* Create a scatter plot */
proc sgplot data=ames_first_20;
    series x=Year_Built y=SalePrice;
run;

```



### Pie Chart
Create a pie chart to visualize the proportion of different categories.
```sas
/* Filter the first 20 observations */
data ames_first_20;
    set ames(obs=20);
run;

/* Create a pie chart */
proc gchart data=ames_first_20;
    pie House_Style / sumvar=SalePrice type=percent;
    run;
quit;
```
### Group by Category
Group data by a categorical variable and calculate summary statistics.
```sas
proc means data=ames;
    class House_Style;
    var SalePrice;
run;
```


