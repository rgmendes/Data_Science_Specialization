---
title: "Getting and Cleaning Data | Course Project"
author: "Roberto Mendes"
date: "31 de julho de 2016"
output: html_document
---

## Getting and Cleaning Data | Course Project

This is the document that describes the steps to the final exercise of the course "Getting and Cleaning Date". 

  1 - Check if the directory exists and downloads the project dataset
  2 - Load the required libraries for the project
  3 - Assignment of identifiers
  4- Assignment of test data for the field "test"
  5 - Assignment of train data for the field "train"
  6 - Merge the data fields "test" and "train" a new field "merge"
  7 - Add dataset name tags descriptive variables in the "features"
  8 - Filter only the columns containing "mean" and "std" and cleaning values column
  9 - Uses descriptive activity names to name the activities in the data set
  10 - Create a new dataset with the average of each variable for each unique values of "Subject" and "Activity". The result is saved in the file "tidy_data.txt"