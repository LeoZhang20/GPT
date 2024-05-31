knitr::opts_chunk$set(echo = TRUE)

install.packages("devtools")
library(devtools)

devtools::install_github("ben-aaron188/rgpt3")
library(rgpt3)

library(haven)
library(dplyr)
library(forcats)
library(stringr)
library(mice)
library(checkmate)

rgpt_authenticate("H:/Bachelorarbeit/access_key.txt")

mainland_prompts <- data.frame(
  prompts_roles = rep("user", 1472), 
  prompt_id = complete_dataM$id,
  prompt = questionM)

gpt_mainland = rgpt(prompt_role_var = mainland_prompts$prompts_roles
                   , prompt_content_var = mainland_prompts$prompt
                   , id_var = mainland_prompts$prompt_id
                   , param_max_tokens = 30
                   , param_n = 5
                   , param_temperature = 0.99)
