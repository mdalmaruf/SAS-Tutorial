# Post Hoc Tests on AmesHousing3 Dataset

## Introduction

Post Hoc tests are statistical analyses that are conducted after an ANOVA test when the null hypothesis is rejected. They are used to determine exactly which means are significantly different from each other. This blog post will guide you through a scenario using the `ameshousing3` dataset, explaining when and why Post Hoc tests are necessary, and providing detailed steps and SAS code for conducting these tests.

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

## Interpreting the Results

### One-Way ANOVA with Tukey Post Hoc Test

- **ANOVA Table**: Check if the p-value is less than 0.05 to confirm significant differences.
- **Tukey's HSD**: Look at the pairwise comparisons to see which groups differ significantly. The confidence intervals and adjusted p-values will indicate significant differences.

### Two-Way ANOVA with Post Hoc Tests

- **Interaction Plot**: Visualize the interaction between heating quality and season sold on sale prices.
- **Tukey's HSD**: Examine the pairwise comparisons for significant differences within and between groups.

## Conclusion

In this tutorial, we covered the importance and application of Post Hoc tests following ANOVA. By using the ameshousing3 dataset, we demonstrated how to identify significant differences in sale prices across different heating quality levels and the interaction between heating quality and season sold. Post Hoc tests are essential for pinpointing specific group differences after identifying overall significance with ANOVA.

