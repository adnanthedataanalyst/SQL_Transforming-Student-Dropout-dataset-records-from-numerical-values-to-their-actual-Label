
  /*
Checking the data
*/

SELECT  *
  FROM [StuDrop].[dbo].[dataset]


 
 
  /*
  
Problem:
After checking the datase, a significant issue has appeared – all the categorical columns are encoded, and there is a lack of crucial information about what each numerical label represents.  

Here is a sample of the dataset: 
As you see, the number each colum does not mean anything. For example, in the Marital Status, we do not know what 1 and 2 means

| Marital status | Application mode | Application order | Course | ... | Unemployment rate | Inflation rate | GDP | Target  |
|-----------------|-------------------|-------------------|--------|-----|-------------------|-----------------|-----|---------|
| 1               | 8                 | 5                 | 2      | ... | 10.8              | 1.4             | 1.74| Dropout |
| 1               | 6                 | 1                 | 11     | ... | 13.9              | -0.3            | 0.79| Graduate|
| 1               | 1                 | 5                 | 5      | ... | 10.8              | 1.4             | 1.74| Dropout |
| 1               | 8                 | 2                 | 15     | ... | 9.4               | -0.8            | -3.12| Graduate|
| 2               | 12                | 1                 | 3      | ... | 13.9              | -0.3            | 0.79| Graduate|
| 2               | 12                | 1                 | 17     | ... | 16.2              | 0.3             | -0.92| Graduate|
| 1               | 1                 | 12                | 1      | ... | 15.5              | 2.8             | -4.06| Graduate|
| 1               | 9                 | 4                 | 11     | ... | 15.5              | 2.8             | -4.06| Dropout |
| 1               | 1                 | 3                 | 10     | ... | 16.2              | 0.3             | -0.92| Graduate|

Solution:

To address this problem, a potential solution is to refer to the coding scheme of the dataset that provides information for the categorical values. 
The [dataset available at this link](https://archive.ics.uci.edu/dataset/697/predict+students+dropout+and+academic+success) can be used for this purpose. It likely contains the missing information about the categorical labels used in the provided dataset.
*/
 
 --1. Marital status

--This external dataset can be utilized to decode the categorical columns in the original dataset, providing the necessary context for a more accurate interpretation of the model's findings.


-- Alter the data type of the "Marital status" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Marital status] VARCHAR(50); -- Adjust the size accordingly

-- Update the "Marital status" column with the corresponding words
UPDATE [StuDrop].[dbo].[dataset]
SET [Marital status] = 
    CASE 
        WHEN [Marital status] = 1 THEN 'Single'
        WHEN [Marital status] = 2 THEN 'Married'
        WHEN [Marital status] = 3 THEN 'Widower'
        WHEN [Marital status] = 4 THEN 'Divorced'
        WHEN [Marital status] = 5 THEN 'Facto Union'
        WHEN [Marital status] = 6 THEN 'Legally Separated'
        WHEN [Marital status] IS NULL THEN 'Unknown' -- Handle NULL values
        WHEN ISNUMERIC([Marital status]) = 1 THEN 'Unknown' -- Handle FLOAT values
        ELSE 'Unknown'
    END
WHERE [Marital status] IS NOT NULL; -- Add a condition to update only non-null values

 

 --2. Application mod

-- Alter the data type of the "Application mode" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Application mode] VARCHAR(100); -- Adjust the size accordingly

-- Update the "Application mode" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Application mode] = 
    CASE 
        WHEN [Application mode] = 1 THEN '1st phase - general contingent'
        WHEN [Application mode] = 2 THEN 'Ordinance No. 612/93'
        WHEN [Application mode] = 3 THEN '1st phase - special contingent (Azores Island)'
        WHEN [Application mode] = 4 THEN 'Holders of other higher courses'
        WHEN [Application mode] = 5 THEN 'Ordinance No. 854-B/99'
        WHEN [Application mode] = 6 THEN 'International student (bachelor)'
        WHEN [Application mode] = 7 THEN '1st phase - special contingent (Madeira Island)'
        WHEN [Application mode] = 8 THEN '2nd phase - general contingent'
        WHEN [Application mode] = 9 THEN '3rd phase - general contingent'
        WHEN [Application mode] = 10 THEN 'Ordinance No. 533-A/99, item b2) (Different Plan)'
        WHEN [Application mode] = 11 THEN 'Ordinance No. 533-A/99, item b3 (Other Institution)'
        WHEN [Application mode] = 12 THEN 'Over 23 years old'
        WHEN [Application mode] = 13 THEN 'Transfer'
        WHEN [Application mode] = 14 THEN 'Change in course'
        WHEN [Application mode] = 15 THEN 'Technological specialization diploma holders'
        WHEN [Application mode] = 16 THEN 'Change in institution/course'
        WHEN [Application mode] = 17 THEN 'Short cycle diploma holders'
        WHEN [Application mode] = 18 THEN 'Change in institution/course (International)'
        ELSE [Application mode] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Application mode] IS NOT NULL; -- Add a condition to update only non-null values




--3. Course

-- Alter the column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Course] VARCHAR(50); -- Adjust the size accordingly

-- Update the "Course" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Course] = 
    CASE 
        WHEN TRY_CAST([Course] AS INT) = 1 THEN 'Biofuel Production Technologies'
        WHEN TRY_CAST([Course] AS INT) = 2 THEN 'Animation and Multimedia Design'
        WHEN TRY_CAST([Course] AS INT) = 3 THEN 'Social Service (evening attendance)'
        WHEN TRY_CAST([Course] AS INT) = 4 THEN 'Agronomy'
        WHEN TRY_CAST([Course] AS INT) = 5 THEN 'Communication Design'
        WHEN TRY_CAST([Course] AS INT) = 6 THEN 'Veterinary Nursing'
        WHEN TRY_CAST([Course] AS INT) = 7 THEN 'Informatics Engineering'
        WHEN TRY_CAST([Course] AS INT) = 8 THEN 'Equiniculture'
        WHEN TRY_CAST([Course] AS INT) = 9 THEN 'Management'
        WHEN TRY_CAST([Course] AS INT) = 10 THEN 'Social Service'
        WHEN TRY_CAST([Course] AS INT) = 11 THEN 'Tourism'
        WHEN TRY_CAST([Course] AS INT) = 12 THEN 'Nursing'
        WHEN TRY_CAST([Course] AS INT) = 13 THEN 'Oral Hygiene'
        WHEN TRY_CAST([Course] AS INT) = 14 THEN 'Advertising and Marketing Management'
        WHEN TRY_CAST([Course] AS INT) = 15 THEN 'Journalism and Communication'
        WHEN TRY_CAST([Course] AS INT) = 16 THEN 'Basic Education'
        WHEN TRY_CAST([Course] AS INT) = 17 THEN 'Management (evening attendance)'
        ELSE [Course] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Course] IS NOT NULL; -- Add a condition to update only non-null values

 

--4. Daytime/evening attendance

-- Alter the data type of the "Daytime/evening attendance" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Daytime/evening attendance] VARCHAR(50); -- Adjust the size accordingly

-- Update the "Daytime/evening attendance" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Daytime/evening attendance] = 
    CASE 
        WHEN [Daytime/evening attendance] = 1 THEN 'Daytime'
        WHEN [Daytime/evening attendance] = 0 THEN 'Evening'
        ELSE [Daytime/evening attendance] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Daytime/evening attendance] IS NOT NULL; -- Add a condition to update only non-null values


--5. Previous qualification

 -- Step 1: Alter the data type of the "Previous qualification" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Previous qualification] VARCHAR(100); -- Adjust the size accordingly

-- Step 2: Update the "Previous qualification" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Previous qualification] = 
    CASE 
        WHEN [Previous qualification] = 1 THEN 'Secondary education'
        WHEN [Previous qualification] = 2 THEN 'Higher education - bachelor''s degree'
        WHEN [Previous qualification] = 3 THEN 'Higher education - degree'
        WHEN [Previous qualification] = 4 THEN 'Higher education - master''s'
        WHEN [Previous qualification] = 5 THEN 'Higher education - doctorate'
        WHEN [Previous qualification] = 6 THEN 'Frequency of higher education'
        WHEN [Previous qualification] = 7 THEN '12th year of schooling - not completed'
        WHEN [Previous qualification] = 8 THEN '11th year of schooling - not completed'
        WHEN [Previous qualification] = 9 THEN 'Other - 11th year of schooling'
        WHEN [Previous qualification] = 10 THEN '10th year of schooling'
        WHEN [Previous qualification] = 11 THEN '10th year of schooling - not completed'
        WHEN [Previous qualification] = 12 THEN 'Basic education 3rd cycle (9th/10th/11th year) or equiv.'
        WHEN [Previous qualification] = 13 THEN 'Basic education 2nd cycle (6th/7th/8th year) or equiv.'
        WHEN [Previous qualification] = 14 THEN 'Technological specialization course'
        WHEN [Previous qualification] = 15 THEN 'Higher education - degree (1st cycle)'
        WHEN [Previous qualification] = 16 THEN 'Professional higher technical course'
        WHEN [Previous qualification] = 17 THEN 'Higher education - master (2nd cycle)'
        ELSE [Previous qualification] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Previous qualification] IS NOT NULL; -- Add a condition to update only non-null values



 
 -- 6. Creating a new column for analysis
-- Since I am preparing this data for analysis and my focus is on Dropout cases,
-- I am creating a new column "Dropout" to indicate whether a student is a dropout ('Yes') or not ('No').

-- Step 1: Add a new column "IsDropout" to the existing table and update it with the result of the SELECT query
ALTER TABLE [StuDrop].[dbo].[dataset]
ADD DropoutCode VARCHAR(3); -- Adjust the size accordingly

-- Step 2: Update the new column with the result of the SELECT query
UPDATE [StuDrop].[dbo].[dataset]
SET DropoutCode = CASE WHEN [Target] = 'Dropout' THEN 'Yes' ELSE 'No' END;

--Step 3: Checking Target and Dropout columns
-- In this step, I am inspecting the "Target" column and the newly created "Dropout" column.
-- If the results are correct, the "Dropout" column should show 'Yes' when the record indicates 'Dropout' in the "Target" column, and 'No' otherwise.
SELECT [Target], [DropoutCode]
FROM [StuDrop].[dbo].[dataset]

--Step 4: For analysis purposes, I need to create new column named Dropout where Yes changes to 1 and No changes to 0.  
ALTER TABLE [StuDrop].[dbo].[dataset]
ADD Dropout VARCHAR(3); -- Adjust the size accordingly
 

UPDATE [StuDrop].[dbo].[dataset]
SET Dropout = CASE WHEN [Target] = 'Dropout' THEN 1 ELSE 0 END;

SELECT [Target], [DropoutCode], [Dropout]
FROM [StuDrop].[dbo].[dataset]

-- 7. Mother's qualification  
-- Alter the data type of the "Mother's qualification" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Mother's qualification] VARCHAR(255); -- Adjust the size accordingly

-- Update the "Mother's qualification" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Mother's qualification] = 
    CASE 
        WHEN [Mother's qualification] = 1 THEN 'Secondary Education—12th Year of Schooling or Equivalent'
        WHEN [Mother's qualification] = 2 THEN 'Higher Education—bachelor’s degree'
        WHEN [Mother's qualification] = 3 THEN 'Higher Education—degree'
        WHEN [Mother's qualification] = 4 THEN 'Higher Education—master’s degree'
        WHEN [Mother's qualification] = 5 THEN 'Higher Education—doctorate'
        WHEN [Mother's qualification] = 6 THEN 'Frequency of Higher Education'
        WHEN [Mother's qualification] = 7 THEN '12th Year of Schooling—not completed'
        WHEN [Mother's qualification] = 8 THEN '11th Year of Schooling—not completed'
        WHEN [Mother's qualification] = 9 THEN '7th Year (Old)'
        WHEN [Mother's qualification] = 10 THEN 'Other—11th Year of Schooling'
        WHEN [Mother's qualification] = 11 THEN '2nd year complementary high school course'
        WHEN [Mother's qualification] = 12 THEN '10th Year of Schooling'
        WHEN [Mother's qualification] = 13 THEN 'General commerce course'
        WHEN [Mother's qualification] = 14 THEN 'Basic Education 3rd Cycle (9th/10th/11th Year) or Equivalent'
        WHEN [Mother's qualification] = 15 THEN 'Complementary High School Course'
        WHEN [Mother's qualification] = 16 THEN 'Technical-professional course'
        WHEN [Mother's qualification] = 17 THEN 'Complementary High School Course—not concluded'
        WHEN [Mother's qualification] = 18 THEN '7th year of schooling'
        WHEN [Mother's qualification] = 19 THEN '2nd cycle of the general high school course'
        WHEN [Mother's qualification] = 20 THEN '9th Year of Schooling—not completed'
        WHEN [Mother's qualification] = 21 THEN '8th year of schooling'
        WHEN [Mother's qualification] = 22 THEN 'General Course of Administration and Commerce'
        WHEN [Mother's qualification] = 23 THEN 'Supplementary Accounting and Administration'
        WHEN [Mother's qualification] = 24 THEN 'Unknown'
        WHEN [Mother's qualification] = 25 THEN 'Cannot read or write'
        WHEN [Mother's qualification] = 26 THEN 'Can read without having a 4th year of schooling'
        WHEN [Mother's qualification] = 27 THEN 'Basic education 1st cycle (4th/5th year) or equivalent'
        WHEN [Mother's qualification] = 28 THEN 'Basic Education 2nd Cycle (6th/7th/8th Year) or equivalent'
        WHEN [Mother's qualification] = 29 THEN 'Technological specialization course'
        WHEN [Mother's qualification] = 30 THEN 'Higher education—degree (1st cycle)'
        WHEN [Mother's qualification] = 31 THEN 'Specialized higher studies course'
        WHEN [Mother's qualification] = 32 THEN 'Professional higher technical course'
        WHEN [Mother's qualification] = 33 THEN 'Higher Education—master’s degree (2nd cycle)'
        WHEN [Mother's qualification] = 34 THEN 'Higher Education—doctorate (3rd cycle)'
        ELSE [Mother's qualification] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Mother's qualification] IS NOT NULL; -- Add a condition to update only non-null values

-- 8. Father's qualification

-- Alter the data type of the "Father's qualification" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Father's qualification] VARCHAR(255); -- Adjust the size accordingly

-- Update the "Father's qualification" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Father's qualification] = 
    CASE 
        WHEN [Father's qualification] = 1 THEN 'Secondary Education—12th Year of Schooling or Equivalent'
        WHEN [Father's qualification] = 2 THEN 'Higher Education—bachelor’s degree'
        WHEN [Father's qualification] = 3 THEN 'Higher Education—degree'
        WHEN [Father's qualification] = 4 THEN 'Higher Education—master’s degree'
        WHEN [Father's qualification] = 5 THEN 'Higher Education—doctorate'
        WHEN [Father's qualification] = 6 THEN 'Frequency of Higher Education'
        WHEN [Father's qualification] = 7 THEN '12th Year of Schooling—not completed'
        WHEN [Father's qualification] = 8 THEN '11th Year of Schooling—not completed'
        WHEN [Father's qualification] = 9 THEN '7th Year (Old)'
        WHEN [Father's qualification] = 10 THEN 'Other—11th Year of Schooling'
        WHEN [Father's qualification] = 11 THEN '2nd year complementary high school course'
        WHEN [Father's qualification] = 12 THEN '10th Year of Schooling'
        WHEN [Father's qualification] = 13 THEN 'General commerce course'
        WHEN [Father's qualification] = 14 THEN 'Basic Education 3rd Cycle (9th/10th/11th Year) or Equivalent'
        WHEN [Father's qualification] = 15 THEN 'Complementary High School Course'
        WHEN [Father's qualification] = 16 THEN 'Technical-professional course'
        WHEN [Father's qualification] = 17 THEN 'Complementary High School Course—not concluded'
        WHEN [Father's qualification] = 18 THEN '7th year of schooling'
        WHEN [Father's qualification] = 19 THEN '2nd cycle of the general high school course'
        WHEN [Father's qualification] = 20 THEN '9th Year of Schooling—not completed'
        WHEN [Father's qualification] = 21 THEN '8th year of schooling'
        WHEN [Father's qualification] = 22 THEN 'General Course of Administration and Commerce'
        WHEN [Father's qualification] = 23 THEN 'Supplementary Accounting and Administration'
        WHEN [Father's qualification] = 24 THEN 'Unknown'
        WHEN [Father's qualification] = 25 THEN 'Cannot read or write'
        WHEN [Father's qualification] = 26 THEN 'Can read without having a 4th year of schooling'
        WHEN [Father's qualification] = 27 THEN 'Basic education 1st cycle (4th/5th year) or equivalent'
        WHEN [Father's qualification] = 28 THEN 'Basic Education 2nd Cycle (6th/7th/8th Year) or equivalent'
        WHEN [Father's qualification] = 29 THEN 'Technological specialization course'
        WHEN [Father's qualification] = 30 THEN 'Higher education—degree (1st cycle)'
        WHEN [Father's qualification] = 31 THEN 'Specialized higher studies course'
        WHEN [Father's qualification] = 32 THEN 'Professional higher technical course'
        WHEN [Father's qualification] = 33 THEN 'Higher Education—master’s degree (2nd cycle)'
        WHEN [Father's qualification] = 34 THEN 'Higher Education—doctorate (3rd cycle)'
        ELSE [Father's qualification] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Father's qualification] IS NOT NULL; -- Add a condition to update only non-null values

 
--9. Mother's occupation 

-- Alter the data type of the "Mother's occupation" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Mother's occupation] VARCHAR(500); -- Adjust the size accordingly

-- Update the "Mother's occupation" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Mother's occupation] = 
    CASE 
        WHEN [Mother's occupation] = 1 THEN 'Student'
        WHEN [Mother's occupation] = 2 THEN 'Representatives of the Legislative Power and Executive Bodies, Directors, Directors and Executive Managers'
        WHEN [Mother's occupation] = 3 THEN 'Specialists in Intellectual and Scientific Activities'
        WHEN [Mother's occupation] = 4 THEN 'Intermediate Level Technicians and Professions'
        WHEN [Mother's occupation] = 5 THEN 'Administrative Staff'
        WHEN [Mother's occupation] = 6 THEN 'Personal Services, Security and Safety Workers and Sellers'
        WHEN [Mother's occupation] = 7 THEN 'Farmers and Skilled Workers in Agriculture, Fisheries and Forestry'
        WHEN [Mother's occupation] = 8 THEN 'Skilled Workers in Industry, Construction and Craftsmen'
        WHEN [Mother's occupation] = 9 THEN 'Installation and Machine Operators and Assembly Workers'
        WHEN [Mother's occupation] = 10 THEN 'Unskilled Workers'
        WHEN [Mother's occupation] = 11 THEN 'Armed Forces Professions'
        WHEN [Mother's occupation] = 12 THEN 'Other Situation'
        WHEN [Mother's occupation] = 13 THEN '(blank)'
        WHEN [Mother's occupation] = 14 THEN 'Health Professionals'
        WHEN [Mother's occupation] = 15 THEN 'Teachers'
        WHEN [Mother's occupation] = 16 THEN 'Specialists in Information and Communication Technologies (ICT)'
        WHEN [Mother's occupation] = 17 THEN 'Intermediate Level Science and Engineering Technicians and Professions'
        WHEN [Mother's occupation] = 18 THEN 'Technicians and Professionals, of Intermediate Level of Health'
        WHEN [Mother's occupation] = 19 THEN 'Intermediate Level Technicians from Legal, Social, Sports, Cultural and Similar Services'
        WHEN [Mother's occupation] = 20 THEN 'Office Workers, Secretaries in General and Data Processing Operators'
        WHEN [Mother's occupation] = 21 THEN 'Data, Accounting, Statistical, Financial Services and Registry-Related Operators'
        WHEN [Mother's occupation] = 22 THEN 'Other Administrative Support Staff'
        WHEN [Mother's occupation] = 23 THEN 'Personal Service Workers'
        WHEN [Mother's occupation] = 24 THEN 'Sellers'
        WHEN [Mother's occupation] = 25 THEN 'Personal Care Workers and the Like'
        WHEN [Mother's occupation] = 26 THEN 'Skilled Construction Workers and the Like, Except Electricians'
        WHEN [Mother's occupation] = 27 THEN 'Skilled Workers in Printing, Precision Instrument Manufacturing, Jewelers, Artisans and the Like'
        WHEN [Mother's occupation] = 28 THEN 'Workers in Food Processing, Woodworking, Clothing and Other Industries and Crafts'
        WHEN [Mother's occupation] = 29 THEN 'Cleaning Workers'
        WHEN [Mother's occupation] = 30 THEN 'Unskilled Workers in Agriculture, Animal Production, Fisheries and Forestry'
        WHEN [Mother's occupation] = 31 THEN 'Unskilled Workers in Extractive Industry, Construction, Manufacturing and Transport'
        WHEN [Mother's occupation] = 32 THEN 'Meal Preparation Assistants'
        ELSE [Mother's occupation] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Mother's occupation] IS NOT NULL; -- Add a condition to update only non-null values




-- 10.Father's occupation

--- Alter the data type of the "Father's occupation" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Father's occupation] VARCHAR(500); -- Adjust the size accordingly

-- Update the "Father's occupation" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Father's occupation] = 
    CASE 
        WHEN [Father's occupation] = 1 THEN 'Student'
        WHEN [Father's occupation] = 2 THEN 'Representatives of the Legislative Power and Executive Bodies, Directors, Directors and Executive Managers'
        WHEN [Father's occupation] = 3 THEN 'Specialists in Intellectual and Scientific Activities'
        WHEN [Father's occupation] = 4 THEN 'Intermediate Level Technicians and Professions'
        WHEN [Father's occupation] = 5 THEN 'Administrative Staff'
        WHEN [Father's occupation] = 6 THEN 'Personal Services, Security and Safety Workers and Sellers'
        WHEN [Father's occupation] = 7 THEN 'Farmers and Skilled Workers in Agriculture, Fisheries and Forestry'
        WHEN [Father's occupation] = 8 THEN 'Skilled Workers in Industry, Construction and Craftsmen'
        WHEN [Father's occupation] = 9 THEN 'Installation and Machine Operators and Assembly Workers'
        WHEN [Father's occupation] = 10 THEN 'Unskilled Workers'
        WHEN [Father's occupation] = 11 THEN 'Armed Forces Professions'
        WHEN [Father's occupation] = 12 THEN 'Other Situation'
        WHEN [Father's occupation] = 13 THEN '(blank)'
        WHEN [Father's occupation] = 14 THEN 'Armed Forces Officers'
        WHEN [Father's occupation] = 15 THEN 'Armed Forces Sergeants'
        WHEN [Father's occupation] = 16 THEN 'Other Armed Forces Personnel'
        WHEN [Father's occupation] = 17 THEN 'Directors of Administrative and Commercial Services'
        WHEN [Father's occupation] = 18 THEN 'Hotel, Catering, Trade and Other Services Directors'
        WHEN [Father's occupation] = 19 THEN 'Specialists in the Physical Sciences, Mathematics, Engineering and Related Techniques'
        WHEN [Father's occupation] = 20 THEN 'Health Professionals'
        WHEN [Father's occupation] = 21 THEN 'Teachers'
        WHEN [Father's occupation] = 22 THEN 'Specialists in Finance, Accounting, Administrative Organization, Public and Commercial Relations'
        WHEN [Father's occupation] = 23 THEN 'Intermediate Level Science and Engineering Technicians and Professions'
        WHEN [Father's occupation] = 24 THEN 'Technicians and Professionals, of Intermediate Level of Health'
        WHEN [Father's occupation] = 25 THEN 'Intermediate Level Technicians from Legal, Social, Sports, Cultural and Similar Services'
        WHEN [Father's occupation] = 26 THEN 'Information and Communication Technology Technicians'
        WHEN [Father's occupation] = 27 THEN 'Office Workers, Secretaries in General and Data Processing Operators'
        WHEN [Father's occupation] = 28 THEN 'Data, Accounting, Statistical, Financial Services and Registry-Related Operators'
        WHEN [Father's occupation] = 29 THEN 'Other Administrative Support Staff'
        WHEN [Father's occupation] = 30 THEN 'Personal Service Workers'
        WHEN [Father's occupation] = 31 THEN 'Sellers'
        WHEN [Father's occupation] = 32 THEN 'Personal Care Workers and the Like'
        WHEN [Father's occupation] = 33 THEN 'Protection and Security Services Personnel'
        WHEN [Father's occupation] = 34 THEN 'Market-Oriented Farmers and Skilled Agricultural and Animal Production Workers'
        WHEN [Father's occupation] = 35 THEN 'Farmers, Livestock Keepers, Fishermen, Hunters and Gatherers, Subsistence'
        WHEN [Father's occupation] = 36 THEN 'Skilled Construction Workers and the Like, Except Electricians'
        WHEN [Father's occupation] = 37 THEN 'Skilled Workers in Metallurgy, Metalworking and Similar'
        WHEN [Father's occupation] = 38 THEN 'Skilled Workers in Electricity and Electronics'
        WHEN [Father's occupation] = 39 THEN 'Workers in Food Processing, Woodworking, Clothing and Other Industries and Crafts'
        WHEN [Father's occupation] = 40 THEN 'Fixed Plant and Machine Operators'
        WHEN [Father's occupation] = 41 THEN 'Assembly Workers'
        WHEN [Father's occupation] = 42 THEN 'Vehicle Drivers and Mobile Equipment Operators'
        WHEN [Father's occupation] = 43 THEN 'Unskilled Workers in Agriculture, Animal Production, Fisheries and Forestry'
        WHEN [Father's occupation] = 44 THEN 'Unskilled Workers in Extractive Industry, Construction, Manufacturing and Transport'
        WHEN [Father's occupation] = 45 THEN 'Meal Preparation Assistants'
        WHEN [Father's occupation] = 46 THEN 'Street Vendors (Except Food) and Street Service Providers'
        ELSE [Father's occupation] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Father's occupation] IS NOT NULL; -- Add a condition to update only non-null values





--11. Displaced

-- Alter the data type of the "Displaced" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Displaced] VARCHAR(3); -- Adjust the size accordingly

-- Update the "Displaced" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Displaced] = 
    CASE 
        WHEN [Displaced] = 1 THEN 'Yes'
        WHEN [Displaced] = 0 THEN 'No'
        ELSE [Displaced] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Displaced] IS NOT NULL; -- Add a condition to update only non-null values





--12. Educational special needs

-- Alter the data type of the "Educational special needs" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Educational special needs] VARCHAR(3); -- Adjust the size accordingly

-- Update the "Educational special needs" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Educational special needs] = 
    CASE 
        WHEN [Educational special needs] = 1 THEN 'Yes'
        WHEN [Educational special needs] = 0 THEN 'No'
        ELSE [Educational special needs] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Educational special needs] IS NOT NULL; -- Add a condition to update only non-null values


SELECT *
FROM [StuDrop].[dbo].[dataset]

--13. Debtor

-- Alter the data type of the "Debtor" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Debtor] VARCHAR(3); -- Adjust the size accordingly

-- Update the "Debtor" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Debtor] = 
    CASE 
        WHEN [Debtor] = 1 THEN 'Yes'
        WHEN [Debtor] = 0 THEN 'No'
        ELSE [Debtor] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Debtor] IS NOT NULL; -- Add a condition to update only non-null values





--14. Tuition fees up to date

-- Alter the data type of the "Tuition fees up to date" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Tuition fees up to date] VARCHAR(3); -- Adjust the size accordingly

-- Update the "Tuition fees up to date" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Tuition fees up to date] = 
    CASE 
        WHEN [Tuition fees up to date] = 1 THEN 'Yes'
        WHEN [Tuition fees up to date] = 0 THEN 'No'
        ELSE [Tuition fees up to date] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Tuition fees up to date] IS NOT NULL; -- Add a condition to update only non-null values




--15. Gender

-- Alter the data type of the "Gender" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Gender] VARCHAR(6); -- Adjust the size accordingly

-- Update the "Gender" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Gender] = 
    CASE 
        WHEN [Gender] = 1 THEN 'Male'
        WHEN [Gender] = 0 THEN 'Female'
        ELSE [Gender] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Gender] IS NOT NULL; -- Add a condition to update only non-null values




--16. Scholarship holder

-- Alter the data type of the "Scholarship holder" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Scholarship holder] VARCHAR(3); -- Adjust the size accordingly

-- Update the "Scholarship holder" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Scholarship holder] = 
    CASE 
        WHEN [Scholarship holder] = 1 THEN 'Yes'
        WHEN [Scholarship holder] = 0 THEN 'No'
        ELSE [Scholarship holder] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Scholarship holder] IS NOT NULL; -- Add a condition to update only non-null values


--18. International

-- Alter the data type of the "International" column to VARCHAR
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [International] VARCHAR(3); -- Adjust the size accordingly

-- Update the "International" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [International] = 
    CASE 
        WHEN [International] = 1 THEN 'Yes'
        WHEN [International] = 0 THEN 'No'
        ELSE [International] -- Preserve the original value if it doesn't match any condition
    END
WHERE [International] IS NOT NULL; -- Add a condition to update only non-null values
 

-- 19.Round up the number in "Curricular units 1st sem (grade)" colmn
UPDATE [StuDrop].[dbo].[dataset]
SET [Curricular units 1st sem (grade)] = 
    CASE 
        WHEN [Curricular units 1st sem (grade)] IS NOT NULL THEN ROUND([Curricular units 1st sem (grade)], 2)
    END;
 SELECT *
FROM [StuDrop].[dbo].[dataset]

-- 20.Round up the number in "Curricular units 2nd sem (grade)" colmn
UPDATE [StuDrop].[dbo].[dataset]
SET [Curricular units 2nd sem (grade)] = 
    CASE 
        WHEN [Curricular units 2nd sem (grade)] IS NOT NULL THEN ROUND([Curricular units 2nd sem (grade)], 2)
    END;
 SELECT *
FROM [StuDrop].[dbo].[dataset]


--21. Nacionality

-- Step 1: Change the column name from Nacionality to Nationality by adding a new column with the desired name
ALTER TABLE [StuDrop].[dbo].[dataset]
ADD [Nationality] VARCHAR(50);

-- Step 2: Update the new column with the values from the old column
UPDATE [StuDrop].[dbo].[dataset]
SET [Nationality] = [Nacionality];

-- Step 3: Alter the column Nationality and adjust the size accordingly
ALTER TABLE [StuDrop].[dbo].[dataset]
ALTER COLUMN [Nationality] VARCHAR(50); -- Adjust the size accordingly


-- Step 4: Update the "Nationality" column with the corresponding descriptions
UPDATE [StuDrop].[dbo].[dataset]
SET [Nationality] = 
    CASE 
        WHEN [Nationality] = 1 THEN 'Portuguese'
        WHEN [Nationality] = 2 THEN 'German'
        WHEN [Nationality] = 3 THEN 'Spanish'
        WHEN [Nationality] = 4 THEN 'Italian'
        WHEN [Nationality] = 5 THEN 'Dutch'
        WHEN [Nationality] = 6 THEN 'English'
        WHEN [Nationality] = 7 THEN 'Lithuanian'
        WHEN [Nationality] = 8 THEN 'Angolan'
        WHEN [Nationality] = 9 THEN 'Cape Verdean'
        WHEN [Nationality] = 10 THEN 'Guinean'
        WHEN [Nationality] = 11 THEN 'Mozambican'
        WHEN [Nationality] = 12 THEN 'Santomean'
        WHEN [Nationality] = 13 THEN 'Turkish'
        WHEN [Nationality] = 14 THEN 'Brazilian'
        WHEN [Nationality] = 15 THEN 'Romanian'
        WHEN [Nationality] = 16 THEN 'Moldova (Republic of)'
        WHEN [Nationality] = 17 THEN 'Mexican'
        WHEN [Nationality] = 18 THEN 'Ukrainian'
        WHEN [Nationality] = 19 THEN 'Russian'
        WHEN [Nationality] = 20 THEN 'Cuban'
        WHEN [Nationality] = 21 THEN 'Colombian'
        ELSE [Nationality] -- Preserve the original value if it doesn't match any condition
    END
WHERE [Nationality] IS NOT NULL; -- Add a condition to update only non-null values


-- Drop the column "Nacionality" from the dataset table
ALTER TABLE [StuDrop].[dbo].[dataset]
DROP COLUMN [Nacionality];

SELECT *
FROM [StuDrop].[dbo].[dataset]
 

----End


 