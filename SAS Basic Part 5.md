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
