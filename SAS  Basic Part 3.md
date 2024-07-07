# Instructions to Import `ameshousing3`[data](https://www.kaggle.com/datasets/agnihotri/ameshousing3) and Perform Various Tasks in SAS Studio

## Step 1: Assign a Library Reference
To start, assign a library reference to the directory where the dataset is located. Make sure to create a new folder named `SAS24` under the `Server Files and Folders` before assigning the library reference.

### Instructions:
1. Navigate to the `Server Files and Folders` section in your SAS environment.
2. Go to the `Files` directory.
3. Create a new folder named `SAS24` and upload the `ameshousing3.sas7bdat` [file](https://github.com/mdalmaruf/SAS-Tutorial/blob/main/Files/)
4. Create a new sas file under the same `SAS24` folder `ameshousing.sas` and set the directory `SAS24`.

```sas
libname mydata '/home/u639220466/SAS24';
```
### Step 2: Read the Dataset
Create a new dataset named ames from the uploaded [ameshousing3](https://github.com/mdalmaruf/SAS-Tutorial/blob/main/Files/) dataset.
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
## Understanding p-value and t-value
### What is a Hypothesis?
A hypothesis is a specific, testable prediction about the relationship between two or more variables. It is a statement that can be evaluated through experimentation or observation.

- Null Hypothesis (H0): There is no difference in the average sale prices of houses based on the presence of a garage.
- Alternative Hypothesis (H1): Houses with a garage have a different average sale price than houses without a garage.

**Scenario**: You want to test if there is a difference in the salary of factory workers based on gender.

### Hypothesis Testing:
Hypothesis testing involves two competing hypotheses:
- **Null Hypothesis (H0)**: There is no effect or no difference.
- **Alternative Hypothesis (H1)**: There is an effect or a difference.

### p-value:
- The p-value is the probability of obtaining test results at least as extreme as the observed results, assuming the null hypothesis is true.
- **Interpretation**:
  - A **low p-value** (≤ 0.05) provides strong evidence against the null hypothesis, suggesting it should be rejected.
  - A **high p-value** (> 0.05) provides weak evidence against the null hypothesis, suggesting it should not be rejected.
- **Example**: Suppose we are testing whether a new drug is more effective than a placebo. If the p-value is 0.001, it means there is only a 0.1% chance that the observed effectiveness would occur if the drug had no effect (null hypothesis is true). Hence, we reject the null hypothesis and conclude the drug is effective.
- **Usage**: The p-value helps determine the statistical significance of the test results.

### t-value:
- The t-value measures the size of the difference relative to the variation in the sample data. It is used in t-tests to determine if there is a significant difference between means.
- **Calculation**:
  \[
  t = \frac{\bar{X} - \mu}{\frac{s}{\sqrt{n}}}
  \]
  where \(\bar{X}\) is the sample mean, \(\mu\) is the population mean, \(s\) is the sample standard deviation, and \(n\) is the sample size.
- **Interpretation**:
  - A **large t-value** indicates a large difference between the sample mean and the population mean.
- **Example**: In testing whether the average salary of factory workers is $50,000, a t-value of -5.74 indicates that the sample mean salary is 5.74 standard errors below $50,000. This suggests a significant difference from the hypothesized mean.
- **Usage**: The t-value helps assess whether the observed difference is significant compared to the variability in the data.

### Summary:
- **p-value**: Indicates the significance of the results. A small p-value (≤ 0.05) suggests rejecting the null hypothesis.
- **t-value**: Measures the size of the difference relative to the variation in the sample data. A large absolute t-value suggests a significant difference.


# Distribution, Skewness, and Kurtosis

### Explanation:
- **Distribution**: Displays how the data points are spread across different values. A histogram is often used to visualize this.
- **Skewness**: Measures the asymmetry of the data distribution. A skewness value close to zero indicates a symmetric distribution, while a positive value indicates right skew (tail on the right), and a negative value indicates left skew (tail on the left).
- **Kurtosis**: Measures the "tailedness" of the data distribution. Higher kurtosis indicates more data points in the tails (outliers), while lower kurtosis indicates fewer outliers.

### Example:
```sas
proc univariate data=ames;
    var SalePrice;
    histogram SalePrice / normal;
    inset skewness kurtosis / format=5.2;
run;
```
#### Importance:
Understanding the distribution, skewness, and kurtosis helps in identifying the nature of the data. For instance, knowing whether the data is symmetric or skewed can guide further statistical analyses and the choice of appropriate models. High kurtosis might indicate the presence of outliers, which could affect the results of statistical tests and modeling.

#### Graph Interpretation:
A histogram generated from the above code will show the frequency distribution of the SalePrice variable. The inset will display the skewness and kurtosis values, helping to understand the symmetry and tailedness of the distribution. For example, if the skewness is 1.2 and the kurtosis is 3.8, it suggests that the distribution is moderately right-skewed with a moderate presence of outliers.

## Actual Distribution, Skewness, and Kurtosis Analysis
![Distribution](/screenshots/distribution.png)
The provided output includes a histogram and several statistical measures for the `SalePrice` variable. Here’s an explanation of each part and what they mean:

### Histogram:
- **Description**: The histogram shows the distribution of the `SalePrice` variable, with the `SalePrice` on the x-axis and the percentage of occurrences on the y-axis.
- **Overlaid Curve**: Represents the normal distribution with the same mean and standard deviation as the `SalePrice` data.

### Skewness:
- **Value**: 0.30
- **Interpretation**: The skewness is close to zero, indicating that the distribution is fairly symmetric. A skewness value between -0.5 and 0.5 is typically considered fairly symmetric.

### Kurtosis:
- **Value**: 0.72
- **Interpretation**: The kurtosis value indicates the presence of light tails and a flatter peak compared to a normal distribution. Kurtosis between -2 and 2 is generally considered acceptable in terms of normality.

### Goodness-of-Fit Tests for Normal Distribution:
#### Kolmogorov-Smirnov Test:
- **Statistic**: 0.044
- **p-Value**: >0.150
- **Interpretation**: The high p-value suggests that the `SalePrice` distribution does not significantly deviate from a normal distribution.

#### Cramer-von Mises Test:
- **Statistic**: 0.119
- **p-Value**: 0.064
- **Interpretation**: The p-value is close to 0.05, indicating a borderline acceptance of the null hypothesis that the data comes from a normal distribution.

#### Anderson-Darling Test:
- **Statistic**: 0.691
- **p-Value**: 0.074
- **Interpretation**: The p-value is slightly above 0.05, suggesting that the data does not significantly deviate from a normal distribution.

### Parameters for Normal Distribution:
- **Mean (Mu)**: 137524.9
- **Standard Deviation (Sigma)**: 37622.64

### Quantiles for Normal Distribution:
- **Description**: The table compares the observed quantiles of the `SalePrice` with the estimated quantiles from a normal distribution.
- **Example**: At the 50% quantile (median), the observed `SalePrice` is 135,000, while the estimated value from the normal distribution is 137,524.9.

### Important Analysis:
- The histogram and skewness value indicate that the `SalePrice` distribution is fairly symmetric.
- The kurtosis value shows that the distribution has light tails and a flatter peak compared to a normal distribution.
- The goodness-of-fit tests suggest that the `SalePrice` data does not significantly deviate from a normal distribution.
- The mean and standard deviation provide a summary of the central tendency and spread of the `SalePrice` data.
- Focus on the p-values of the goodness-of-fit tests to determine the normality of the data. High p-values (greater than 0.05) indicate that the data can be considered normally distributed.


## One-Sample T-Test

### Explanation:
- **One-Sample T-Test**: Tests whether the mean of a single sample is equal to a known value (null hypothesis). It helps in determining if the sample mean is significantly different from the specified value.

### Example:
```sas
proc ttest data=ames h0=150000;
    var SalePrice;
run;
```
#### Importance:
A one-sample t-test is useful when you need to compare the mean of your sample data to a known or hypothesized population mean. For example, if you want to test whether the average sale price of houses is significantly different from $150,000, this test will provide the answer.

#### Statistics Interpretation:
The output will provide the mean of the sample, the t-value, degrees of freedom, and the p-value. For example, if the mean sale price is $137,500, the t-value is -3.5, and the p-value is 0.001, it indicates that the mean sale price is significantly different from $150,000 (since p-value < 0.05).

### Output Analysis:
![one sample t-test](/screenshots/one_t-test.png)
#### T-Test Procedure:

- **N**: 300 (number of observations)
- **Mean**: $137,525
- **Std Dev**: $37,622.6
- **Std Err**: $2,172.1
- **Minimum**: $35,000
- **Maximum**: $290,000
- **95% CL Mean**: Confidence limits for the mean range from $133,250 to $141,799
- **t Value**: -5.74
- **Pr > |t|**: <0.0001 (p-value)

**Interpretation**: The mean sale price of $137,525 is significantly different from $150,000 (p-value < 0.05), indicating that the average sale price is less than $150,000.

- t-value: The t-value of -5.74 indicates that the sample mean ($137,525) is 5.74 standard errors below the hypothesized mean of $150,000.
- p-value: The p-value of <0.0001 indicates that there is less than a 0.01% chance of getting these results if the average sale price really were $150,000. Since the p-value is much less than 0.05, we reject the null hypothesis.
- The low p-value (<0.0001) tells us that the observed average sale price is very unlikely to be $150,000, so we conclude that the average sale price is different from $150,000.
- The negative t-value (-5.74) indicates that the observed sample mean ($137,525) is significantly lower than the hypothesized mean ($150,000).

#### Distribution of SalePrice:

- **Description**: The histogram shows the distribution of the `SalePrice` variable. The blue curve represents the normal distribution, and the red curve represents the kernel density estimate. The box plot below shows the spread and outliers in the data.
- **Interpretation**: The `SalePrice` distribution appears to be fairly symmetric, with the majority of sale prices centered around the mean. The presence of a few outliers can be observed at both ends of the distribution.

#### Q-Q Plot of SalePrice:

- **Description**: The Q-Q plot compares the quantiles of the `SalePrice` data to the quantiles of a normal distribution.
- **Interpretation**: The points closely follow the diagonal line, indicating that the `SalePrice` data is approximately normally distributed. Deviations at the ends suggest some outliers, but the overall fit is good.

By understanding these analyses, you can conclude that the average sale price in the dataset is significantly lower than $150,000, and the `SalePrice` variable is approximately normally distributed, which is important for many parametric statistical tests and modeling techniques.


##  Two-Sample T-Test

A Two-Sample T-Test compares the means of two independent groups to determine if they are significantly different from each other. The groups are specified by a categorical variable.

#### Example
##### Subsetting the Data
Subset the data to include only '1Story' and '2Story' house styles.
```sas
/* Step 1: Subset the data to include only '1Story' and '2Story' house styles */
data ames_subset;
    set ames;
    if House_Style in ('1Story', '2Story');
run;
```
##### Performing the Two-Sample T-Test
Perform the two-sample t-test on the subsetted data.
```sas
/* Step 2: Perform the two-sample t-test */
proc ttest data=ames_subset;
    class House_Style;
    var SalePrice;
run;
```
#### Importance
A two-sample t-test is important when you need to compare the means of two different groups within your data. For example, you might want to compare the average sale prices of houses with different styles to see if the house style significantly affects the sale price.

#### Statistics Interpretation
The output will show the means of the two groups, the t-value, degrees of freedom, and the p-value. For instance, if the mean sale price of 1-Story houses is $140,000 and for 2-Story houses is $160,000, with a t-value of -2.8 and a p-value of 0.01, it suggests that the difference in sale prices between these two house styles is significant (since p-value < 0.05).

### Analysis of Two-Sample T-Test Output

The provided output includes the results of a two-sample t-test comparing the sale prices of 1-Story and 2-Story houses in the Ames dataset.

### Output Analysis
![Two sample t-test1](/screenshots/two_t-test.JPG)
#### Descriptive Statistics:

##### 1Story:
- **N (Sample Size)**: 194
- **Mean Sale Price**: $139,520
- **Standard Deviation**: $41,078.7
- **Standard Error**: $2,949.3
- **Minimum Sale Price**: $35,000
- **Maximum Sale Price**: $290,000

##### 2Story:
- **N (Sample Size)**: 38
- **Mean Sale Price**: $127,489
- **Standard Deviation**: $28,536.2
- **Standard Error**: $4,629.2
- **Minimum Sale Price**: $75,000
- **Maximum Sale Price**: $176,000

##### Difference Between Means:

- The mean difference (1-Story minus 2-Story) is $12,031.3.
- **Pooled method**: Shows a difference of $12,031.3 with a standard error of $6,997.4.
- **Satterthwaite method**: Shows a difference of $12,031.3 with a standard error of $5,488.9.

#### T-Test Results:

##### Pooled:
- **Degrees of Freedom (DF)**: 230
- **T-Value**: 1.72
- **P-Value**: 0.0860

##### Satterthwaite:
- **Degrees of Freedom (DF)**: 70.84
- **T-Value**: 2.19
- **P-Value**: 0.0317

#### Equality of Variances Test:

##### Folded F Method:
- **Degrees of Freedom (Num DF)**: 193
- **Degrees of Freedom (Den DF)**: 37
- **F-Value**: 2.07
- **P-Value**: 0.0100

### Interpretation

#### Descriptive Statistics:
- The mean sale price for 1-Story houses is higher than for 2-Story houses. The standard deviation is also higher for 1-Story houses, indicating more variability in their sale prices.

#### T-Test Results:
- **Pooled method**: The p-value (0.0860) is greater than 0.05, suggesting that there is no significant difference in mean sale prices between the two house styles using this method.
- **Satterthwaite method**: The p-value (0.0317) is less than 0.05, suggesting that there is a significant difference in mean sale prices between the two house styles using this method.

#### Equality of Variances Test:
- The p-value (0.0100) indicates that the variances of the two groups are significantly different, justifying the use of the Satterthwaite method, which does not assume equal variances.




### Visualizations
![Two sample t-test2](/screenshots/two_t-test_g1.JPG)
#### Distribution of Sale Prices:

- **Description**: The histograms and kernel density plots show the distribution of sale prices for 1-Story and 2-Story houses. The box plots indicate the spread and outliers in the data.
- **Interpretation**: For both 1-Story and 2-Story houses, the distribution appears approximately normal, but there are differences in spread and central tendency.

#### Q-Q Plots:

- **Description**: The Q-Q plots compare the quantiles of sale prices to a normal distribution.
- **Interpretation**: Both 1-Story and 2-Story houses show data points that mostly fall along the 45-degree line, indicating normality. Deviations at the ends of the plots indicate potential outliers or slight deviations from normality.
![Two sample t-test3](/screenshots/two_t-test_g2.JPG)
### Importance in Ames House Price Data Analysis

#### Understanding Variability:
- Analyzing the differences in sale prices between different house styles helps understand how the market values these styles, which can be crucial for pricing strategies, real estate investment decisions, and market analysis.

#### Significance of Differences:
- The t-test results indicate whether the observed differences in sale prices are statistically significant, providing insights into whether house style affects sale price.

#### Distribution Characteristics:
- The visualizations help identify the spread, central tendency, and presence of outliers in sale prices, which are important for accurate data modeling and prediction.

By analyzing these results, stakeholders can make informed decisions about pricing, marketing, and investment in the Ames housing market.


