# Post Hoc Tests on AmesHousing3 Dataset

## Introduction

Post Hoc tests are statistical analyses that are conducted after an ANOVA test when the null hypothesis is rejected. They are used to determine exactly which means are significantly different from each other. This blog post will guide you through a scenario using the `ameshousing3` dataset, explaining when and why Post Hoc tests are necessary, and providing detailed steps and SAS code for conducting these tests.

# Key Values and Their Importance

| Term              | Description                                                                                 |
|-------------------|---------------------------------------------------------------------------------------------|
| **p-value**       | Indicates if there are significant differences among group means.                           |
| **F Value**       | Ratio of between-group variance to within-group variance. Higher F values indicate greater variance among group means. |
| **Confidence Interval** | Range within which the true difference between group means lies, with a specified level of confidence (e.g., 95%). |
| **Difference**    | The estimated difference between group means.                                               |


## Task Scenario

### Scenario 1: Determining Differences in Sale Prices Across Heating Quality Levels

You are tasked with analyzing the `ameshousing3` dataset to determine if there are significant differences in sale prices based on heating quality. Initially, you will perform a One-Way ANOVA to test for overall differences among the group means. If the ANOVA indicates significant differences, you will use Post Hoc tests to pinpoint exactly which groups differ from each other.

### Approach to Analysis

1. **Perform One-Way ANOVA:** To test for overall differences in sale prices across heating quality levels.
2. **Conduct Post Hoc Tests:** If the ANOVA is significant, use Post Hoc tests to identify which specific groups' means are different.

### SAS Code for One-Way ANOVA

```sas
/* Step 1: Assign a library reference */
libname mydata '/home/u63922XXX/SAS24';

/* Step 2: Read the dataset */
data ames;
    set mydata.ameshousing3;
run;

/* Step 3: Perform One-Way ANOVA */
proc glm data=ames;
    class Heating_QC;
    model SalePrice = Heating_QC;
    means Heating_QC / hovtest=levene;
    title "One-Way ANOVA for Sale Prices across Heating Quality Levels";
run;
quit;
```

# Post Hoc Tests

## When to Apply Post Hoc Tests

Post Hoc tests are applied after an ANOVA when:

- The ANOVA test shows significant differences among the group means (p-value < 0.05).
- You need to determine which specific groups differ from each other.

## Considerations for Post Hoc Tests

- **Type of Post Hoc Test**: Common tests include Tukey, Bonferroni, and Scheffé. Tukey's test is widely used for its balance between Type I error rate control and statistical power.
- **Assumptions**: Ensure that the assumptions of ANOVA (independent observations, normality, homogeneity of variances) are met before applying Post Hoc tests.

## Scenario 2: Analyzing Sale Prices Based on Heating Quality and Season Sold

In cases where you need to analyze more complex interactions, such as the effect of both heating quality and season sold on sale prices, a Two-Way ANOVA followed by Post Hoc tests is necessary.

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

# Post Hoc Tests in SAS

## What is a Post Hoc Test?

Post Hoc tests are follow-up tests to ANOVA, used to identify which specific group means are significantly different. They help control the Type I error rate when multiple comparisons are made.

## Types of Post Hoc Tests

- **Tukey's HSD (Honestly Significant Difference)**: Controls for Type I error and is suitable for pairwise comparisons.
- **Bonferroni Correction**: Adjusts the significance level based on the number of comparisons.
- **Scheffé's Test**: More conservative and can be used for any number of comparisons.
## Example Scenario and SAS Code for Post Hoc Tests
### Example Scenario
Suppose the One-Way ANOVA on the ameshousing3 dataset indicates significant differences in sale prices across different heating quality levels. You need to determine which specific heating quality levels (e.g., Excellent, Fair, Good, Typical/Average) have significant differences in sale prices. This is where Post Hoc tests come into play.

## SAS Code for Post Hoc Tests

```sas
/* Perform One-Way ANOVA with Post Hoc Tests */
proc glm data=ames;
    class Heating_QC;
    model SalePrice = Heating_QC;
    means Heating_QC / tukey cldiff;
    title "One-Way ANOVA with Tukey Post Hoc Test for Sale Prices across Heating Quality Levels";
run;
quit;

/* Perform Two-Way ANOVA with Post Hoc Tests */
proc glm data=ames;
    class Heating_QC Season_Sold;
    model SalePrice = Heating_QC Season_Sold Heating_QC*Season_Sold;
    lsmeans Heating_QC*Season_Sold / slice=Heating_QC pdiff adjust=tukey;
    title "Two-Way ANOVA with Tukey Post Hoc Test for Sale Prices by Heating Quality and Season Sold";
run;
quit;
```
### Explanation of SAS Code

- **proc glm**: Calls the General Linear Model procedure in SAS.
- **class**: Specifies categorical variables (e.g., Heating_QC, Season_Sold).
- **model**: Defines the dependent variable and the independent variables (predictors).
- **means**: Requests means for the specified variables and applies Post Hoc tests.
- **tukey**: Requests Tukey's Honestly Significant Difference test.
- **cldiff**: Requests confidence limits for differences.
- **lsmeans**: Requests least-squares means for specified variables.
- **slice**: Requests slicing of interactions for specific levels.
- **pdiff**: Requests p-values for differences.
- **adjust=tukey**: Applies Tukey's adjustment for multiple comparisons.
  
## Interpreting the Results

### One-Way ANOVA with Tukey Post Hoc Test

- **ANOVA Table**: Check if the p-value is less than 0.05 to confirm significant differences.
- **Tukey's HSD**: Look at the pairwise comparisons to see which groups differ significantly. The confidence intervals and adjusted p-values will indicate significant differences.

### Two-Way ANOVA with Post Hoc Tests

- **Interaction Plot**: Visualize the interaction between heating quality and season sold on sale prices.
- **Tukey's HSD**: Examine the pairwise comparisons for significant differences within and between groups.

### Example Results Interpretation
After running the One-Way ANOVA with Post Hoc tests, you might get results indicating that the sale prices for houses with "Excellent" heating quality are significantly higher than those with "Fair" heating quality, but not significantly different from those with "Good" or "Typical/Average" heating quality. These insights help in understanding the specific differences among the groups.



# Sample Results Interpretation

## One-Way ANOVA with Tukey Post Hoc Test

| Comparison          | Difference  | Confidence Interval           | p-value |
|---------------------|-------------|-------------------------------|---------|
| Excellent vs. Fair  | 57700.43    | [35000.12, 80400.74]          | <.0001  |
| Excellent vs. Good  | 24075.10    | [5000.89, 43149.31]           | 0.0150  |
| Excellent vs. Average | 24345.66  | [7500.78, 41190.54]           | 0.0078  |
| Good vs. Fair       | 33625.33    | [10000.50, 57250.16]          | 0.0015  |
| Average vs. Fair    | 33355.77    | [11500.12, 55211.42]          | 0.0012  |
| Good vs. Average    | 267.56      | [-10432.77, 10967.89]         | 0.9600  |

### Interpretation:

- Significant differences were found between the mean sale prices of houses with Excellent heating quality and those with Fair, Good, and Average heating quality.
- No significant difference was found between Good and Average heating quality levels.



## Conclusion

In this tutorial, we covered the importance and application of Post Hoc tests following ANOVA. By using the ameshousing3 dataset, we demonstrated how to identify significant differences in sale prices across different heating quality levels and the interaction between heating quality and season sold. Post Hoc tests are essential for pinpointing specific group differences after identifying overall significance with ANOVA.

