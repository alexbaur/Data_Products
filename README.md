# Esophageal Cancer Risk Evaluator
##### By Alex Baur

## Introduction
Esophageal cancer risk has been directly correlated to the behavioral risk factors of alcohol and tobacco consumption as well as age. This app is designed to evaulate the general risk level based on these factors and the extent to which an individual ingests these substances at a given age bracket. It in no way should be considered conclusive or all-encompassing but instead should serve as an exploratory guideline to promote moderation and a greater understanding of the risks of such hobbies and how one can enjoy them responsibly.

## Data
This app uses the "esoph" dataset from the dataset package in R. It details the reported cancer rate for a case-control study of esophageal cancer in Ille-et-Vilaine, France. It contains the following features:

- agegp: Age group, a factor variable with 6 levels (25-34, 35-44, 45-54, 55-64, 65-74, 75+ years of age)
- alcgp: Alcohol consumption: a factor variable wth 4 levels (0-3, 4-6, 7-8, 9+ drinks per day)
- tobgp: Tobacco consumption: a factor variable with 4 levels (0-9 (0-4 Pipe Bowls), 10-19 (1 Cigar/5-8 Pipe Bowls), 20-29 (2 Cigars/9-12 Pipe Bowls), 30+ (3+ Cigars/13+ Pipe Bowls) cigarettes per day)
- ncases: Number of esophageal cancer incidents recorded (numeric)
- ncontrols: Number of patients who did not have an esophageal cancer incident (numeric)

The alcgp and tobgp variables were altered from their base values to be better intrepreted by those using the app. The alcoholic drink intake was estimated based on the 14g/drink ethanol standard laid out by the [CDC](http://www.cdc.gov/alcohol/faqs.htm). The average tobacco per cigarette (1g) was estimated from [here](http://www.answers.com/Q/How_many_grams_of_tobacco_are_there_in_one_cigarette) which correlated with a number of other websites; the cigar average tobacco (13g)was found at this [puff.com user-submitted average](http://www.puff.com/forums/vb/cigar-questions/150032-how-many-grams-tobacco-robusto.html); the average tobacco in a pipe (2.5g) was extrapolated from a [pipesmagazine.com forum post](http://pipesmagazine.com/forums/topic/how-long-does-1-oz-of-tobacco-last-you).

It is important to note that there were 1175 reported cases and controls in the dataset which is far from a statistically ideal population set. The risk probability in this app is therefore in no way conclusive or definitive, but should serve as a guideline for potential health pitfalls. Please consult a doctor if you believe you are exhibiting esophageal cancer symptoms.

## App Usage
The user begins by inputting their information or the information that they would like to test in the "Indicators" side panel. First the age is input based on the brackets outlined in the agegp feature. Next, alcohol intake is input based on drinks per day based o the alcgp feature. Finally, tobacco consumption is input following the lines of tobgp. Once all the information has been selected, the "Assess" button is clicked to evaluate.

Age, alcohol usage, and tobacco consumption are returned and esophageal cancer probability is returned based on the input.

Note: Some combinations are unavailable (have no data) and return a character(0) when evaluated.

## App Mechanics
The App initially loads the "esoph" dataset and assigns it to a new object, "cancer." This object is then cleaned so that the columns match the input choices for easy searching. Then the data frame is subset based on user input until only one column is remaining. The app first narrows by age, then the alcohol consumption level within that age bracket, and finally the tobacco consumption level within that alcohol intake level. Then the ncases for that row are divided by the ncontrols to give an estimate of the probability of esophageal cancer.
