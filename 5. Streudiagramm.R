# compare tscs with gpt in English

library(readxl)
data <- read_excel("H:/Bachelorarbeit/Data_for_creating_prompt_1472_final.xlsx")

original_result <- data[, c("id", "election")]

original_result$election[original_result$election == "1"] <- "Soong Chu-yu"
original_result$election[original_result$election == "2"] <- "Han Kuo-yu"
original_result$election[original_result$election == "3"] <- "Tsai Ing-wen"
original_result$election[original_result$election == "4"] <- "invalid vote"
original_result$election[original_result$election == "6"] <- "did not vote"

library(ggplot2)
library(dplyr)
library(patchwork)
library(cowplot)

election_counts <- original_result %>%
  count(election) %>%
  rename(value = election, count = n) %>%
  mutate(type = "TSCS")

category_counts <- completion %>%
  count(category) %>%
  rename(value = category, count = n) %>%
  mutate(type = "GPT-4")

combined_counts <- bind_rows(election_counts, category_counts)

ggplot(combined_counts, aes(x = value, y = count, fill = type)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.3, size = 5) +
  labs(
    title = "Distribution of reported vote choices according to TSCS and GPT in English (T = 0.5)",
    x = NULL,
    y = NULL,
    fill = NULL
  ) +
  scale_fill_manual(values = c("TSCS" = "green", "GPT-4" = "yellow")) +
  scale_x_discrete(limits = c("Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 15, face = "bold", color = "black", hjust = 0.5), 
    axis.title.x = element_text(size = 16, color = "black"),  
    axis.title.y = element_text(size = 16, color = "black"),  
    axis.text.x = element_text(size = 14, color = "black"),  
    axis.text.y = element_text(size = 14, color = "black"),  
    legend.title = element_text(size = 16, color = "black"),
    legend.text = element_text(size = 14, color = "black")
  )

# compare tscs with gpt in Chinese from mainland

category_counts_cn <- completion_cn %>%
  count(category_cn) %>%
  rename(value = category_cn, count = n) %>%
  mutate(type = "GPT-4")

category_counts_cn$value[category_counts_cn$value == "宋楚瑜"] <- "Soong Chu-yu"
category_counts_cn$value[category_counts_cn$value == "韩国瑜"] <- "Han Kuo-yu"
category_counts_cn$value[category_counts_cn$value == "蔡英文"] <- "Tsai Ing-wen"
category_counts_cn$value[category_counts_cn$value == "投废票"] <- "invalid vote"
category_counts_cn$value[category_counts_cn$value == "没投票"] <- "did not vote"

combined_counts_cn <- bind_rows(election_counts, category_counts_cn)

ggplot(combined_counts_cn, aes(x = value, y = count, fill = type)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.3, size = 5) +
  labs(
    title = "Distribution of reported vote choices according to TSCS and GPT in mainland Chinese (T = 0.5)",
    x = NULL,
    y = NULL,
    fill = NULL
  ) +
  scale_fill_manual(values = c("TSCS" = "green", "GPT-4" = "yellow")) +
  scale_x_discrete(limits = c("Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 15, face = "bold", color = "black", hjust = 0.5), 
    axis.title.x = element_text(size = 16, color = "black"),  
    axis.title.y = element_text(size = 16, color = "black"),  
    axis.text.x = element_text(size = 14, color = "black"),  
    axis.text.y = element_text(size = 14, color = "black"),  
    legend.title = element_text(size = 16, color = "black"),
    legend.text = element_text(size = 14, color = "black")
  )

# compare tscs with gpt in Chinese from Taiwan in different temperatures

category_counts_tw_05 <- completion_tw_05 %>%
  count(category_tw_05) %>%
  rename(value = category_tw_05, count = n) %>%
  mutate(type = "GPT-4 (T = 0.5)")

category_counts_tw_09 <- completion_tw_09 %>%
  count(category_tw_09) %>%
  rename(value = category_tw_09, count = n) %>%
  mutate(type = "GPT-4 (T = 0.9)")

category_counts_tw_10 <- completion_tw_10 %>%
  na.omit() %>%
  count(category_tw_10) %>%
  rename(value = category_tw_10, count = n) %>%
  mutate(type = "GPT-4 (T = 1)")

combined_counts_tw <- bind_rows(election_counts, category_counts_tw_05, category_counts_tw_09, category_counts_tw_10)

combined_counts_tw <- combined_counts_tw %>%
  mutate(value = recode(value,
                        "宋楚瑜" = "Soong Chu-yu",
                        "韓國瑜" = "Han Kuo-yu",
                        "蔡英文" = "Tsai Ing-wen",
                        "投廢票" = "invalid vote",
                        "沒投票" = "did not vote"))


ggplot(combined_counts_tw, aes(x = value, y = count, fill = type)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.3, size = 5) +
  labs(
    title = "Distribution of reported vote choices according to TSCS and GPT in Taiwan Chinese",
    x = NULL,
    y = NULL,
    fill = NULL
  ) +
  scale_fill_manual(values = c("TSCS" = "green", "GPT-4 (T = 0.5)" = "yellow", "GPT-4 (T = 0.9)" = "darkgoldenrod1", "GPT-4 (T = 1)" = "orangered")) +
  scale_x_discrete(limits = c("Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 15, face = "bold", color = "black", hjust = 0.5),
    axis.title.x = element_text(size = 16, color = "black"),
    axis.title.y = element_text(size = 16, color = "black"),
    axis.text.x = element_text(size = 14, color = "black"),
    axis.text.y = element_text(size = 14, color = "black"),
    legend.title = element_text(size = 16, color = "black"),
    legend.text = element_text(size = 14, color = "black")
  )
