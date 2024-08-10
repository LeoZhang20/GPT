# build data

library(readxl)
data <- read_excel("H:/Bachelorarbeit/Data_for_creating_prompt_1472_final.xlsx")

data$father[data$father == 97] <- NA
data$mother[data$mother == 97] <- NA
data$education[data$education == 22] <- NA
data$democracy[data$democracy %in% c(97, 98)] <- NA
data$identification[data$identification %in% c(97, 98)] <- NA
data$relationship[data$relationship %in% c(97, 98)] <- NA
data$party[data$party %in% c(97, 98)] <- NA
data$social[data$social %in% c(94, 95, 97, 98)] <- NA

library(mice)
library(tidyr)

imputed_data <- mice(data, method="pmm", m=1)
complete_data <- complete(imputed_data)

complete_dataE <- complete_data

complete_dataE$gender[complete_dataE$gender == "1"] <- "male."
complete_dataE$gender[complete_dataE$gender == "2"] <- "female."

complete_dataE$father[complete_dataE$father == "1"] <- "a Taiwanese from Fujian Minnan"
complete_dataE$father[complete_dataE$father == "2"] <- "a Taiwanese from Guangdong Hakka"
complete_dataE$father[complete_dataE$father == "3"] <- "a Taiwanese from Mainland"
complete_dataE$father[complete_dataE$father == "4"] <- "a Taiwan Aborigine"
complete_dataE$father[complete_dataE$father == "5"] <- "a resident of Chinese citizenship"
complete_dataE$father[complete_dataE$father == "6"] <- "a Southeast Asian"
complete_dataE$father[complete_dataE$father == "7"] <- "one from rare groups"

complete_dataE$mother[complete_dataE$mother == "1"] <- "a Taiwanese from Fujian Minnan."
complete_dataE$mother[complete_dataE$mother == "2"] <- "a Taiwanese from Guangdong Hakka."
complete_dataE$mother[complete_dataE$mother == "3"] <- "a Taiwanese from Mainland."
complete_dataE$mother[complete_dataE$mother == "4"] <- "a Taiwan Aborigine."
complete_dataE$mother[complete_dataE$mother == "5"] <- "a resident of Chinese citizenship."
complete_dataE$mother[complete_dataE$mother == "6"] <- "a Southeast Asian."
complete_dataE$mother[complete_dataE$mother == "7"] <- "one from rare groups."

complete_dataE$identification[complete_dataE$identification == "1"] <- "Taiwanese"
complete_dataE$identification[complete_dataE$identification == "2"] <- "Chinese"
complete_dataE$identification[complete_dataE$identification == "3"] <- "Taiwanese and Chinese"
complete_dataE$identification[complete_dataE$identification == "4"] <- "Chinese and Taiwanese"
complete_dataE$identification[complete_dataE$identification == "5"] <- "neither Taiwanese nor Chinese"

complete_dataE$relationship[complete_dataE$relationship == "1"] <- "suggest to unify with Mainland China."
complete_dataE$relationship[complete_dataE$relationship == "2"] <- "suggest to become independent."
complete_dataE$relationship[complete_dataE$relationship == "3"] <- "suggest to maintain the status quo."
complete_dataE$relationship[complete_dataE$relationship == "4"] <- "think it depends on the situation."
complete_dataE$relationship[complete_dataE$relationship == "93"] <- "have no comment."

complete_dataE$party[complete_dataE$party == "1"] <- "the Kuomintang / Chinese Nationalist Party."
complete_dataE$party[complete_dataE$party == "2"] <- "the Democratic Progressive Party."
complete_dataE$party[complete_dataE$party == "3"] <- "the People First Party."
complete_dataE$party[complete_dataE$party == "4"] <- "the Taiwan Solidarity Union."
complete_dataE$party[complete_dataE$party == "5"] <- "the New Party."
complete_dataE$party[complete_dataE$party == "6"] <- "the New Power Party."
complete_dataE$party[complete_dataE$party == "7"] <- "the Taiwan People's Party."
complete_dataE$party[complete_dataE$party == "8"] <- "the Green Party."
complete_dataE$party[complete_dataE$party == "9"] <- "the Taiwan Statebuilding Party."
complete_dataE$party[complete_dataE$party == "10"] <- "all."
complete_dataE$party[complete_dataE$party == "11"] <- "neither of them."

complete_dataE$employment[complete_dataE$employment %in% c(1)] <- "working"
complete_dataE$employment[complete_dataE$employment %in% c(2, 4, 5, 6)] <- "not working"
complete_dataE$employment[complete_dataE$employment %in% c(3)] <- "studying/training"

complete_dataE$social[complete_dataE$social %in% c(1, 2, 3)] <- "low."
complete_dataE$social[complete_dataE$social %in% c(4, 5, 6, 7)] <- "middle."
complete_dataE$social[complete_dataE$social %in% c(8, 9, 10)] <- "high."

complete_dataE$vote[complete_dataE$election == "1"] <- "Soong Chu-yu"
complete_dataE$vote[complete_dataE$election == "2"] <- "Han Kuo-yu"
complete_dataE$vote[complete_dataE$election == "3"] <- "Tsai Ing-wen"
complete_dataE$vote[complete_dataE$election == "4"] <- "invalid vote"
complete_dataE$vote[complete_dataE$election == "6"] <- "did not vote"

# combined data in English

names(completion)[names(completion) == "n"] <- "id"
GPT_EN <- merge(complete_dataE, completion, by = "id", all = TRUE)
GPT_EN <- subset(GPT_EN, select = -c(gpt_content))

GPT_EN$category[GPT_EN$category == "Soong Chu-yu"] <- "1"
GPT_EN$category[GPT_EN$category == "Han Kuo-yu"] <- "2"
GPT_EN$category[GPT_EN$category == "Tsai Ing-wen"] <- "3"
GPT_EN$category[GPT_EN$category == "invalid vote"] <- "4"
GPT_EN$category[GPT_EN$category == "did not vote"] <- "6"

library(caret)
GPT_EN$category <- factor(GPT_EN$category)
GPT_EN$election <- factor(GPT_EN$election)

conf_matrix_en <- confusionMatrix(GPT_EN$category, GPT_EN$election)
precision_en <- conf_matrix_en$byClass[,"Pos Pred Value"]
recall_en <- conf_matrix_en$byClass[,"Sensitivity"]
f1_scores_en <- 2 * (precision_en * recall_en) / (precision_en + recall_en)
f1_scores_en[is.na(f1_scores_en)] <- 0

conf_matrix_table <- conf_matrix_en$table
overall_precision <- sum(diag(conf_matrix_table)) / sum(rowSums(conf_matrix_table))
overall_recall <- sum(diag(conf_matrix_table)) / sum(colSums(conf_matrix_table))
overall_f1 <- 2 * (overall_precision * overall_recall) / (overall_precision + overall_recall)

# combined data in Chinese from mainland

names(completion_cn)[names(completion_cn) == "n_cn"] <- "id"
GPT_CN <- merge(complete_dataE, completion_cn, by = "id", all = TRUE)
GPT_CN <- subset(GPT_CN, select = -c(gpt_content_cn))

GPT_CN$category_cn[GPT_CN$category_cn == "宋楚瑜"] <- "1"
GPT_CN$category_cn[GPT_CN$category_cn == "韩国瑜"] <- "2"
GPT_CN$category_cn[GPT_CN$category_cn == "蔡英文"] <- "3"
GPT_CN$category_cn[GPT_CN$category_cn == "投废票"] <- "4"
GPT_CN$category_cn[GPT_CN$category_cn == "没投票"] <- "6"

GPT_CN$category_cn <- factor(GPT_CN$category_cn)
GPT_CN$election <- factor(GPT_CN$election)

conf_matrix_cn <- confusionMatrix(GPT_CN$category_cn, GPT_CN$election)
precision_cn <- conf_matrix_cn$byClass[,"Pos Pred Value"]
recall_cn <- conf_matrix_cn$byClass[,"Sensitivity"]
f1_scores_cn <- 2 * (precision_cn * recall_cn) / (precision_cn + recall_cn)
f1_scores_cn[is.na(f1_scores_cn)] <- 0

conf_matrix_table_cn <- conf_matrix_cn$table
overall_precision_cn <- sum(diag(conf_matrix_table_cn)) / sum(rowSums(conf_matrix_table_cn))
overall_recall_cn <- sum(diag(conf_matrix_table_cn)) / sum(colSums(conf_matrix_table_cn))
overall_f1_cn <- 2 * (overall_precision_cn * overall_recall_cn) / (overall_precision_cn + overall_recall_cn)

# combined data in Chinese from Taiwan

## temperature 0,5

names(completion_tw_05)[names(completion_tw_05) == "n_tw_05"] <- "id"
GPT_TW_05 <- merge(complete_dataE, completion_tw_05, by = "id", all = TRUE)
GPT_TW_05 <- subset(GPT_TW_05, select = -c(gpt_content_tw_05))

GPT_TW_05$category_tw_05[GPT_TW_05$category_tw_05 == "宋楚瑜"] <- "1"
GPT_TW_05$category_tw_05[GPT_TW_05$category_tw_05 == "韓國瑜"] <- "2"
GPT_TW_05$category_tw_05[GPT_TW_05$category_tw_05 == "蔡英文"] <- "3"
GPT_TW_05$category_tw_05[GPT_TW_05$category_tw_05 == "投廢票"] <- "4"
GPT_TW_05$category_tw_05[GPT_TW_05$category_tw_05 == "沒投票"] <- "6"

GPT_TW_05$category_tw_05 <- factor(GPT_TW_05$category_tw_05)
GPT_TW_05$election <- factor(GPT_TW_05$election)

conf_matrix_tw_05 <- confusionMatrix(GPT_TW_05$category_tw_05, GPT_TW_05$election)
precision_tw_05 <- conf_matrix_tw_05$byClass[,"Pos Pred Value"]
recall_tw_05 <- conf_matrix_tw_05$byClass[,"Sensitivity"]
f1_scores_tw_05 <- 2 * (precision_tw_05 * recall_tw_05) / (precision_tw_05 + recall_tw_05)
f1_scores_tw_05[is.na(f1_scores_tw_05)] <- 0

conf_matrix_table_tw_05 <- conf_matrix_tw_05$table
overall_precision_tw_05 <- sum(diag(conf_matrix_table_tw_05)) / sum(rowSums(conf_matrix_table_tw_05))
overall_recall_tw_05 <- sum(diag(conf_matrix_table_tw_05)) / sum(colSums(conf_matrix_table_tw_05))
overall_f1_tw_05 <- 2 * (overall_precision_tw_05 * overall_recall_tw_05) / (overall_precision_tw_05 + overall_recall_tw_05)

## temperature 0,9

names(completion_tw_09)[names(completion_tw_09) == "n_tw_09"] <- "id"
GPT_TW_09 <- merge(complete_dataE, completion_tw_09, by = "id", all = TRUE)
GPT_TW_09 <- subset(GPT_TW_09, select = -c(gpt_content_tw_09))

GPT_TW_09$category_tw_09[GPT_TW_09$category_tw_09 == "宋楚瑜"] <- "1"
GPT_TW_09$category_tw_09[GPT_TW_09$category_tw_09 == "韓國瑜"] <- "2"
GPT_TW_09$category_tw_09[GPT_TW_09$category_tw_09 == "蔡英文"] <- "3"
GPT_TW_09$category_tw_09[GPT_TW_09$category_tw_09 == "投廢票"] <- "4"
GPT_TW_09$category_tw_09[GPT_TW_09$category_tw_09 == "沒投票"] <- "6"

GPT_TW_09$category_tw_09 <- factor(GPT_TW_09$category_tw_09)
GPT_TW_09$election <- factor(GPT_TW_09$election)

conf_matrix_tw_09 <- confusionMatrix(GPT_TW_09$category_tw_09, GPT_TW_09$election)
precision_tw_09 <- conf_matrix_tw_09$byClass[,"Pos Pred Value"]
recall_tw_09 <- conf_matrix_tw_09$byClass[,"Sensitivity"]
f1_scores_tw_09 <- 2 * (precision_tw_09 * recall_tw_09) / (precision_tw_09 + recall_tw_09)
f1_scores_tw_09[is.na(f1_scores_tw_09)] <- 0

conf_matrix_table_tw_09 <- conf_matrix_tw_09$table
overall_precision_tw_09 <- sum(diag(conf_matrix_table_tw_09)) / sum(rowSums(conf_matrix_table_tw_09))
overall_recall_tw_09 <- sum(diag(conf_matrix_table_tw_09)) / sum(colSums(conf_matrix_table_tw_09))
overall_f1_tw_09 <- 2 * (overall_precision_tw_09 * overall_recall_tw_09) / (overall_precision_tw_09 + overall_recall_tw_09)

## temperature 1

names(completion_tw_10)[names(completion_tw_10) == "n_tw_10"] <- "id"
GPT_TW_10 <- merge(complete_dataE, na.omit(completion_tw_10), by = "id", all = TRUE)
GPT_TW_10 <- subset(GPT_TW_10, select = -c(gpt_content_tw_10))

GPT_TW_10$category_tw_10[GPT_TW_10$category_tw_10 == "宋楚瑜"] <- "1"
GPT_TW_10$category_tw_10[GPT_TW_10$category_tw_10 == "韓國瑜"] <- "2"
GPT_TW_10$category_tw_10[GPT_TW_10$category_tw_10 == "蔡英文"] <- "3"
GPT_TW_10$category_tw_10[GPT_TW_10$category_tw_10 == "投廢票"] <- "4"
GPT_TW_10$category_tw_10[GPT_TW_10$category_tw_10 == "沒投票"] <- "6"

GPT_TW_10$category_tw_10 <- factor(GPT_TW_10$category_tw_10)
GPT_TW_10$election <- factor(GPT_TW_10$election)

GPT_TW_10 <- na.omit(GPT_TW_10)

conf_matrix_tw_10 <- confusionMatrix(GPT_TW_10$category_tw_10, GPT_TW_10$election)
precision_tw_10 <- conf_matrix_tw_10$byClass[,"Pos Pred Value"]
recall_tw_10 <- conf_matrix_tw_10$byClass[,"Sensitivity"]
f1_scores_tw_10 <- 2 * (precision_tw_10 * recall_tw_10) / (precision_tw_10 + recall_tw_10)
f1_scores_tw_10[is.na(f1_scores_tw_10)] <- 0

conf_matrix_table_tw_10 <- conf_matrix_tw_10$table
overall_precision_tw_10 <- sum(diag(conf_matrix_table_tw_10)) / sum(rowSums(conf_matrix_table_tw_10))
overall_recall_tw_10 <- sum(diag(conf_matrix_table_tw_10)) / sum(colSums(conf_matrix_table_tw_10))
overall_f1_tw_10 <- 2 * (overall_precision_tw_10 * overall_recall_tw_10) / (overall_precision_tw_10 + overall_recall_tw_10)
