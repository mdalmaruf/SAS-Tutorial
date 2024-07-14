# Analysis of Variance (ANOVA) on AmesHousing3 Dataset

## Introduction

Analysis of Variance (ANOVA) is a statistical method used to test if there are significant differences between the means of three or more independent groups. This blog post will explore the different types of ANOVA, their differences, how ANOVA differs from t-tests, and when to use ANOVA over t-tests. We will then apply these concepts using SAS Studio with the `ameshousing3` dataset.

## Types of ANOVA

1. **One-Way ANOVA**
   - **Purpose:** Compares the means of three or more independent groups based on one independent variable.
   - **Example:** Comparing sale prices across different heating quality levels.

2. **Two-Way ANOVA**
   - **Purpose:** Examines the effect of two independent variables on one dependent variable, including the interaction effect between the two variables.
   - **Example:** Evaluating sale prices based on heating quality and the season sold.

3. **Repeated Measures ANOVA**
   - **Purpose:** Compares means across multiple measurements of the same individuals or subjects.
   - **Example:** Comparing test scores of students at multiple points in time.

## Differences Between Types of ANOVA

- **One-Way vs. Two-Way ANOVA:** One-Way ANOVA involves one independent variable, while Two-Way ANOVA involves two independent variables and can assess interaction effects.
- **Two-Way ANOVA vs. Repeated Measures ANOVA:** Two-Way ANOVA involves different subjects for each group, whereas Repeated Measures ANOVA involves the same subjects measured multiple times.

## ANOVA vs. t-Tests

### t-Tests

- **Purpose:** Compares the means of two groups.
- **Types:**
  - **Independent Samples t-Test:** Compares means of two independent groups.
  - **Paired Samples t-Test:** Compares means of two related groups (e.g., before and after measurements).
- **Example:** Comparing the average sale price of houses with central air conditioning to those without.

### ANOVA

- **Purpose:** Compares the means of three or more groups.
- **Example:** Comparing the average sale price of houses across different heating quality levels.

### When to Use ANOVA Over t-Tests

- **Multiple Groups:** When comparing the means of three or more groups, use ANOVA instead of multiple t-tests to avoid increasing the Type I error rate.
- **Interaction Effects:** When you need to examine the interaction effects between two independent variables, use Two-Way ANOVA.

## Applying ANOVA on AmesHousing3 Dataset

### One-Way ANOVA: Comparing Sale Prices Across Different Heating Quality Levels

#### Hypothesis

- **Null Hypothesis (H0):** The mean Sale Prices are equal across different Heating Quality levels.
- **Alternative Hypothesis (H1):** At least one mean Sale Price is different across Heating Quality levels.

#### Assumptions

1. Independent observations.
2. Normal distribution of residuals.
3. Equal variances across groups.

#### SAS Code for One-Way ANOVA

```sas
/* Step 1: Assign a library reference */
libname mydata '/home/u63922XXX/SAS24';

/* Step 2: Read the dataset */
data ames;
    set mydata.ameshousing3;
run;

/* Step 3: Display the first 10 observations */
proc print data=ames (obs=10);
run;

/* Step 4: Perform One-Way ANOVA */
proc glm data=ames;
    class Heating_QC;
    model SalePrice = Heating_QC;
    means Heating_QC / hovtest=levene;
    title "One-Way ANOVA for Sale Prices across Heating Quality Levels";
run;
quit;
```
## Interpretation

The ANOVA table provides the F-statistic and the p-value to determine if there are significant differences between the group means. If the p-value is less than 0.05, we reject the null hypothesis, indicating significant differences in mean Sale Prices across Heating Quality levels.

## Two-Way ANOVA: Evaluating SalePrice Based on Heating Quality and Season Sold

### Hypothesis

- **Null Hypothesis (H0):** The mean Sale Prices are equal across Heating Quality levels and Season Sold.
- **Alternative Hypothesis (H1):** At least one mean Sale Price is different across Heating Quality levels or Season Sold.

### Assumptions

1. Independent observations.
2. Normal distribution of residuals.
3. Equal variances across groups.
4. Random assignment within blocks.
5. Constant treatment effects across block levels.

### SAS Code for Two-Way ANOVA

```sas
/* Step 1: Assign a library reference */
libname mydata '/home/u63922XXX/SAS24';

/* Step 2: Read the dataset */
data ames;
    set mydata.ameshousing3;
run;

/* Step 3: Perform Two-Way ANOVA */
proc glm data=ames;
    class Heating_QC Season_Sold;
    model SalePrice = Heating_QC Season_Sold Heating_QC*Season_Sold;
    lsmeans Heating_QC*Season_Sold / slice=Heating_QC pdiff adjust=tukey;
    title "Two-Way ANOVA for Sale Prices by Heating Quality and Season Sold";
run;
quit;
```
## Interpretation

The Two-Way ANOVA table provides F-statistics and p-values for the main effects of Heating Quality and Season Sold, as well as their interaction effect. A significant interaction effect indicates that the effect of Heating Quality on Sale Prices depends on the Season Sold.

## Visualizing the Results

### Interaction Plot

We can use the `PROC SGPLOT` procedure to visualize the interaction between Heating Quality and Season Sold.

### SAS Code for Interaction Plot

```sas
/* Step 1: Assign a library reference */
libname mydata '/home/u63922XXX/SAS24';

/* Step 2: Read the dataset */
data ames;
    set mydata.ameshousing3;
run;

/* Step 3: Interaction Plot */
proc sgplot data=ames;
    scatter x=Season_Sold y=SalePrice / group=Heating_QC;
    series x=Season_Sold y=SalePrice / group=Heating_QC lineattrs=(pattern=solid);
    xaxis label="Season Sold";
    yaxis label="Sale Price";
    title "Interaction Plot for Sale Price by Heating Quality and Season Sold";
run;
```

## Explanation of the Code

### Generate the Interaction Plot:


```sas
proc sgplot data=ames;
    scatter x=Season_Sold y=SalePrice / group=Heating_QC;
    series x=Season_Sold y=SalePrice / group=Heating_QC lineattrs=(pattern=solid);
    xaxis label="Season Sold";
    yaxis label="Sale Price";
    title "Interaction Plot for Sale Price by Heating Quality and Season Sold";
run;

```
- **PROC SGPLOT:** The procedure used to create the interaction plot.
- **SCATTER Statement:** Creates a scatter plot with `Season_Sold` on the x-axis and `SalePrice` on the y-axis, grouping the points by `Heating_QC`.
- **SERIES Statement:** Connects the points with lines, also grouped by `Heating_QC`.
- **XAXIS and YAXIS Labels:** Custom labels for the axes.
- **TITLE Statement:** Adds a title to the plot.

## Explanation of the Results

- **Interaction Plot:** The plot visualizes the interaction between Heating Quality and Season Sold on Sale Prices. Each line represents a different level of Heating Quality, showing how the Sale Price varies with the Season Sold.
- **Significance of Interaction:** If the lines are not parallel, it suggests an interaction between Heating Quality and Season Sold, meaning the effect of Heating Quality on Sale Prices depends on the Season Sold.

## Conclusion

In this tutorial post, we covered the different types of ANOVA, their differences, and when to use ANOVA over t-tests. We then demonstrated how to perform One-Way and Two-Way ANOVA using SAS Studio with the `ameshousing3` dataset. We found significant differences in Sale Prices across Heating Quality levels and observed that the effect of Heating Quality on Sale Prices depends on the Season Sold.

By understanding and applying ANOVA, we can gain valuable insights into the factors affecting property sales, which can inform decision-making in real estate and other fields.
