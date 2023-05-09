# BUSINESS SCIENCE UNIVERSITY
# DS4B 203-R: ADVANCED TIME SERIES FORECASTING FOR BUSINESS
# MODULE: TIME SERIES JUMPSTART 

# GOAL: Forecast Daily Email Users - Next 8-WEEKS

# OBJECTIVES ----
# - Dive into a time-series analysis project
# - Experience Frameworks: modeltime
# - Experience 2 Algorithms:
#   1. Prophet
#   2. LM w/ Engineered Features

# LIBRARIES ----

# Timeseries and Machine Learning
library(tidymodels)
library(modeltime)

# EDA
library(DataExplorer)

# Core
library(tidyverse)
library(timetk)
library(lubridate)

# DATA -----
mailchimp_users_tbl <- read_rds("00_data/mailchimp_users.rds")

mailchimp_users_tbl |> view()

# 1.0 EDA & DATA PREP ----
# * DAILY SUBSCRIBERS INCREASES

mailchimp_users_tbl |> glimpse()

# * Count of opt-ins by Day ----

optins_day_tbl <- mailchimp_users_tbl |> 
    summarize_by_time(
        .date_var = optin_time, 
        .by = "day",
        optins = n()
    )

# * Summary Diagnostics ----

optins_day_tbl |> tk_summary_diagnostics(.date_var = optin_time)

# address gaps in time series, so standardize
# padding the time series ----

optins_day_prepared_tbl <- optins_day_tbl |> 
    pad_by_time(
      .date_var = optin_time,
      .pad_value = 0,
      .by = "day"
    )

# Visualization ----

optins_day_prepared_tbl |> 
    plot_time_series(.date_var = optin_time, .value = optins)

# 2.0 EVALUATION PERIOD ----

# * Filtering ----

evaluation_tbl <- optins_day_prepared_tbl |> 
    filter_by_time(
      .date_var = optin_time,
      .start_date = "2018-11-20",
      .end_date = "end"
    )

evaluation_tbl |> 
    plot_time_series(.date_var = optin_time, .value = optins)

# 3.0 PROPHET FORECASTING ----




# 4.0 FORECASTING WITH FEATURE ENGINEERING ----





# 5.0 SUMMARY & NEXT STEPS ----

# * What you've learned ----
# - You've been exposed to:
#   - Tidymodels / Modeltime Framework
# - You've seen 2 modeling approaches:
#   - Prophet - Univariate, Automatic
#   - Linear Regression Model - Many recipe steps
# - You've experienced Feature Engineering
#   - Visualizations: ACF, Seasonality
#   - Feature Engineering from Date Variables
#
# * Where you are going! ----
# - You still need to learn:
#   - New algorithms
#   - Machine Learning - How to tune parameters
#   - Feature Engineering Strategies
#   - Ensembling - Competition winning strategy
#   - and a lot more!

