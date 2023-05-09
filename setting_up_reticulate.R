# Load Packages ----
library(tidyverse)
library(reticulate)
library(tensorflow)


# Install Tensorflow ----
install_tensorflow(
    method               = "conda", 
    #version              = "default", # Installs TF 2.0.0 (as of May 15, 2020)
    envname              = "tensorflow_test", 
    conda_python_version = "3.10",
    extra_packages       = c("matplotlib", "numpy", "pandas", "scikit-learn")
)

conda_list()

use_condaenv("tensorflow_test", required = TRUE)

py_config()

