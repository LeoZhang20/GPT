# Manipulate data

library(readxl)
data <- read_excel("H:/Bachelorarbeit/Data_for_creating_prompt_1472_final.xlsx")
View(data)

data$father[data$father == 97] <- NA
data$mother[data$mother == 97] <- NA
data$education[data$education == 22] <- NA
data$democracy[data$democracy %in% c(97, 98)] <- NA
data$identification[data$identification %in% c(97, 98)] <- NA
data$relationship[data$relationship %in% c(97, 98)] <- NA
data$party[data$party %in% c(97, 98)] <- NA
data$social[data$social %in% c(94, 95, 97, 98)] <- NA

# Multivariate imputation

library(mice)
library(tidyr)

imputed_data <- mice(data, method="pmm", m=1)
complete_data <- complete(imputed_data)


