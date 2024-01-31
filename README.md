# SQL_Student-Dropout Data


## Introduction

This project aims to enhance the understanding of the dataset by providing column descriptions and categories through the use of SQL queries.

## Problem
The dataset poses a significant challenge as all categorical columns are encoded, leading to a lack of crucial information about the meaning behind each numerical label.

### Here is a sample of the dataset:
As you see, the number each column does not mean anything. For example, in the Marital Status, we do not know what 1 and 2 mean.

| Marital status | Application mode | Application order | Course | ... | Unemployment rate | Inflation rate | GDP | Target  |
|-----------------|-------------------|-------------------|--------|-----|-------------------|-----------------|-----|---------|
| 1               | 8                 | 2                 | 15     | ... | 9.4               | -0.8            | -3.12| Graduate|
| 2               | 12                | 1                 | 3      | ... | 13.9              | -0.3            | 0.79| Graduate|
| 2               | 12                | 1                 | 17     | ... | 16.2              | 0.3             | -0.92| Graduate|
| 1               | 1                 | 12                | 1      | ... | 15.5              | 2.8             | -4.06| Graduate|


### Methodology Approach
This project follows a systematic approach outlined in the following steps:

1. **Data Source:** Utilizing the [Kaggle dataset](https://www.kaggle.com/datasets/thedevastator/higher-education-predictors-of-student-retention).
2. **Code Description Integration:** Integrating Dataset Column Descriptions and Categories from Damiieibikun's GitHub repository, found [here](https://github.com/Damiieibikun/Student-s-Dropout-Prediction-using-Supervised-Machine-Learning-Classifiers). This repository provides the missing information regarding the categorical labels used in the dataset.
3. **SQL Integration:** Employing SQL queries to enhance interpretability and facilitate a more meaningful analysis. This involves merging datasets based on relevant columns and updating categorical values to their corresponding labels, ensuring a comprehensive and well-understood dataset for analysis.

 

### Results
The data has been organized more clearly after executing SQL queries on the data. This enhanced structure makes it much easier to understand the contents within each column. **Note:** The both the SQL Queries file used to generate this table and Excel files, illustrating the data before and after the application of the SQL Queries are included in this repository above. 


| Marital status | Application mode                   | Application order | Course                       | Daytime/evening attendance | Previous qualification                                      | Mother's qualification                                      | Father's qualification                                      | Mother's occupation                                         | Father's occupation                                         | Displaced | Educational special needs | Debtor | Tuition fees up to date | Gender | Scholarship holder | Age at enrollment | International | Curricular units 1st sem (credited) | Curricular units 1st sem (enrolled) | Curricular units 1st sem (evaluations) | Curricular units 1st sem (approved) | Curricular units 1st sem (grade) | Curricular units 1st sem (without evaluations) | Curricular units 2nd sem (credited) | Curricular units 2nd sem (enrolled) | Curricular units 2nd sem (evaluations) | Curricular units 2nd sem (approved) | Curricular units 2nd sem (grade) | Curricular units 2nd sem (without evaluations) | Unemployment rate | Inflation rate | GDP | Target    |
|-----------------|-------------------------------------|-------------------|------------------------------|-----------------------------|-------------------------------------------------------------|-------------------------------------------------------------|-------------------------------------------------------------|-------------------------------------------------------------|-------------------------------------------------------------|-----------|---------------------------|--------|------------------------|--------|----------------------|-------------------|-----------------|-------------------------------------|--------------------------------------|--------------------------------------------|---------------------------------------|-----------------------------------|----------------------------------------------|-------------------------------------|--------------------------------------|--------------------------------------------|---------------------------------------|-----------------------------------|----------------------------------------------|---------------------|-----------------|-----|-----------|

| Single          | 2nd phase - general contingent      | 2                 | Journalism and Communication  | Daytime                     | Secondary education                                         | Supplementary Accounting and Administration                 | Basic education 1st cycle (4th/5th year) or equivalent     | Personal Services, Security and Safety Workers and Sellers  | Intermediate Level Technicians and Professions               | Yes       | No                        | No     | Yes                    | Female | No                   | 20                | No            | 0                                   | 6                                    | 8                                          | 6                                     | 0                                 | 0                                            | 6                                   | 10                                   | 5                                          | 12.4          | 0            | 9.4          | -0.8        | -3.12     | Graduate  |
| Married         | Over 23 years old                  | 1                 | Social Service (evening attendance) | Evening                 | Secondary education                                         | General Course of Administration and Commerce               | Basic Education 2nd Cycle (6th/7th/8th Year) or equivalent | Unskilled Workers                                            | Unskilled Workers                                            | No        | No                        | No     | Yes                    | Female | No                   | 45                | No            | 0                                   | 6                                    | 9                                          | 5                                     | 0                                 | 0                                            | 6                                   | 6                                    | 6                                          | 13.9          | -0.3         | 0.79         | Graduate    |

 
