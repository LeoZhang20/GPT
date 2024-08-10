library(ggplot2)
library(tidyr)
library(dplyr)

# recall and precision in English

categories <- rownames(conf_matrix_en$byClass)
recall_df <- data.frame(
  Category = categories,
  Match = recall_en,
  Different = 1 - recall_en
)

recall_df$Category[recall_df$Category == "Class: 1"] <- "Soong Chu-yu"
recall_df$Category[recall_df$Category == "Class: 2"] <- "Han Kuo-yu"
recall_df$Category[recall_df$Category == "Class: 3"] <- "Tsai Ing-wen"
recall_df$Category[recall_df$Category == "Class: 4"] <- "invalid vote"
recall_df$Category[recall_df$Category == "Class: 6"] <- "did not vote"

precision_df <- data.frame(
  Category = categories,
  Match = precision_en,
  Different = 1 - precision_en
)

precision_df$Category[precision_df$Category == "Class: 1"] <- "Soong Chu-yu"
precision_df$Category[precision_df$Category == "Class: 2"] <- "Han Kuo-yu"
precision_df$Category[precision_df$Category == "Class: 3"] <- "Tsai Ing-wen"
precision_df$Category[precision_df$Category == "Class: 4"] <- "invalid vote"
precision_df$Category[precision_df$Category == "Class: 6"] <- "did not vote"

recall_overall <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table)) / sum(colSums(conf_matrix_table)),
  Different = 1 - sum(diag(conf_matrix_table)) / sum(colSums(conf_matrix_table))
)

precision_overall <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table)) / sum(rowSums(conf_matrix_table)),
  Different = 1 - sum(diag(conf_matrix_table)) / sum(rowSums(conf_matrix_table))
)

recall_df <- bind_rows(recall_df, recall_overall)
precision_df <- bind_rows(precision_df, precision_overall)

recall_long <- recall_df %>%
  gather(key = "Type", value = "Percentage", -Category)

precision_long <- precision_df %>%
  gather(key = "Type", value = "Percentage", -Category)

no_percent_format <- function(x) {
  scales::percent(x, accuracy = 0.01) %>%
    gsub("%", "", .)
}

add_labels <- function(df, title, fill_label, x_label) {
  ggplot(data = df, aes(x = Category, y = Percentage, fill = Type)) +
    geom_bar(stat = "identity", position = "fill") +
    geom_text(aes(label = scales::percent(Percentage, accuracy = 0.01)), 
              position = position_fill(vjust = 0.5), size = 5, color = "white") +
    scale_y_continuous(labels = no_percent_format) +
    labs(
      title = title,
      x = x_label,
      y = "Percentage in %",
      fill = fill_label
    ) +
    scale_fill_manual(values = c("Match" = "darkgreen", "Different" = "darkblue")) +
    scale_x_discrete(limits = c("Overall", "Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
    theme_minimal() +
    theme(
      plot.title = element_text(size = 12, face = "bold", color = "black"),  
      axis.title.x = element_text(size = 13, color = "black"),  
      axis.title.y = element_text(size = 13, color = "black"), 
      axis.text.x = element_text(size = 13, color = "black"),  
      axis.text.y = element_text(size = 13, color = "black"),  
      legend.title = element_text(size = 13, color = "black"),
      legend.text = element_text(size = 13, color = "black"))
}

add_labels(recall_long, 
           title = "Share of candidate votes according to TSCS that GPT correctly predicted (recall) in English (T = 0.5)",
           fill_label = "GPT Prediction",
           x_label = "Vote Choice (TSCS)")

add_labels(precision_long, 
           title = "Share of GPT predictions that voted for the respective candidate (precision) in English (T = 0.5)",
           fill_label = "TSCS Vote",
           x_label = "Vote Choice (GPT)")

# recall and precision in Chinese from mainland

categories_cn <- rownames(conf_matrix_cn$byClass)
recall_df_cn <- data.frame(
  Category = categories_cn,
  Match = recall_cn,
  Different = 1 - recall_cn
)

recall_df_cn$Category[recall_df_cn$Category == "Class: 1"] <- "Soong Chu-yu"
recall_df_cn$Category[recall_df_cn$Category == "Class: 2"] <- "Han Kuo-yu"
recall_df_cn$Category[recall_df_cn$Category == "Class: 3"] <- "Tsai Ing-wen"
recall_df_cn$Category[recall_df_cn$Category == "Class: 4"] <- "invalid vote"
recall_df_cn$Category[recall_df_cn$Category == "Class: 6"] <- "did not vote"

precision_df_cn <- data.frame(
  Category = categories_cn,
  Match = precision_cn,
  Different = 1 - precision_cn
)

precision_df_cn$Category[precision_df_cn$Category == "Class: 1"] <- "Soong Chu-yu"
precision_df_cn$Category[precision_df_cn$Category == "Class: 2"] <- "Han Kuo-yu"
precision_df_cn$Category[precision_df_cn$Category == "Class: 3"] <- "Tsai Ing-wen"
precision_df_cn$Category[precision_df_cn$Category == "Class: 4"] <- "invalid vote"
precision_df_cn$Category[precision_df_cn$Category == "Class: 6"] <- "did not vote"

recall_overall_cn <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_cn)) / sum(colSums(conf_matrix_table_cn)),
  Different = 1 - sum(diag(conf_matrix_table_cn)) / sum(colSums(conf_matrix_table_cn))
)

precision_overall_cn <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_cn)) / sum(rowSums(conf_matrix_table_cn)),
  Different = 1 - sum(diag(conf_matrix_table_cn)) / sum(rowSums(conf_matrix_table_cn))
)

recall_df_cn <- bind_rows(recall_df_cn, recall_overall_cn)
precision_df_cn <- bind_rows(precision_df_cn, precision_overall_cn)


recall_long_cn <- recall_df_cn %>%
  gather(key = "Type", value = "Percentage", -Category)

precision_long_cn <- precision_df_cn %>%
  gather(key = "Type", value = "Percentage", -Category)

no_percent_format <- function(x) {
  scales::percent(x, accuracy = 0.01) %>%
    gsub("%", "", .)
}

add_labels <- function(df, title, fill_label, x_label) {
  ggplot(data = df, aes(x = Category, y = Percentage, fill = Type)) +
    geom_bar(stat = "identity", position = "fill") +
    geom_text(aes(label = scales::percent(Percentage, accuracy = 0.01)), 
              position = position_fill(vjust = 0.5), size = 5, color = "white") +
    scale_y_continuous(labels = no_percent_format) +
    labs(
      title = title,
      x = x_label,
      y = "Percentage in %",
      fill = fill_label
    ) +
    scale_fill_manual(values = c("Match" = "darkgreen", "Different" = "darkblue")) +
    scale_x_discrete(limits = c("Overall", "Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
    theme_minimal() +
    theme(
      plot.title = element_text(size = 12, face = "bold", color = "black"),  
      axis.title.x = element_text(size = 13, color = "black"),  
      axis.title.y = element_text(size = 13, color = "black"), 
      axis.text.x = element_text(size = 13, color = "black"),  
      axis.text.y = element_text(size = 13, color = "black"),  
      legend.title = element_text(size = 13, color = "black"),
      legend.text = element_text(size = 13, color = "black"))
}

add_labels(recall_long_cn, 
           title = "Share of candidate votes according to TSCS that GPT correctly predicted (recall) in mainland Chinese (T = 0.5)",
           fill_label = "GPT Prediction",
           x_label = "Vote Choice (TSCS)")

add_labels(precision_long_cn, 
           title = "Share of GPT predictions that voted for the respective candidate (precision) in mainland Chinese (T = 0.5)",
           fill_label = "TSCS Vote",
           x_label = "Vote Choice (GPT)")

# recall and precision in Chinese from Taiwan

## T = 0,5

categories_tw_05 <- rownames(conf_matrix_tw_05$byClass)
recall_df_tw_05 <- data.frame(
  Category = categories_tw_05,
  Match = recall_tw_05,
  Different = 1 - recall_tw_05
)

recall_df_tw_05$Category[recall_df_tw_05$Category == "Class: 1"] <- "Soong Chu-yu"
recall_df_tw_05$Category[recall_df_tw_05$Category == "Class: 2"] <- "Han Kuo-yu"
recall_df_tw_05$Category[recall_df_tw_05$Category == "Class: 3"] <- "Tsai Ing-wen"
recall_df_tw_05$Category[recall_df_tw_05$Category == "Class: 4"] <- "invalid vote"
recall_df_tw_05$Category[recall_df_tw_05$Category == "Class: 6"] <- "did not vote"

precision_df_tw_05 <- data.frame(
  Category = categories_tw_05,
  Match = precision_tw_05,
  Different = 1 - precision_tw_05
)

precision_df_tw_05$Category[precision_df_tw_05$Category == "Class: 1"] <- "Soong Chu-yu"
precision_df_tw_05$Category[precision_df_tw_05$Category == "Class: 2"] <- "Han Kuo-yu"
precision_df_tw_05$Category[precision_df_tw_05$Category == "Class: 3"] <- "Tsai Ing-wen"
precision_df_tw_05$Category[precision_df_tw_05$Category == "Class: 4"] <- "invalid vote"
precision_df_tw_05$Category[precision_df_tw_05$Category == "Class: 6"] <- "did not vote"

recall_overall_tw_05 <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_tw_05)) / sum(colSums(conf_matrix_table_tw_05)),
  Different = 1 - sum(diag(conf_matrix_table_tw_05)) / sum(colSums(conf_matrix_table_tw_05))
)

precision_overall_tw_05 <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_tw_05)) / sum(rowSums(conf_matrix_table_tw_05)),
  Different = 1 - sum(diag(conf_matrix_table_tw_05)) / sum(rowSums(conf_matrix_table_tw_05))
)

recall_df_tw_05 <- bind_rows(recall_df_tw_05, recall_overall_tw_05)
precision_df_tw_05 <- bind_rows(precision_df_tw_05, precision_overall_tw_05)

recall_long_tw_05 <- recall_df_tw_05 %>%
  gather(key = "Type", value = "Percentage", -Category)

precision_long_tw_05 <- precision_df_tw_05 %>%
  gather(key = "Type", value = "Percentage", -Category)

add_labels <- function(df, title, fill_label, x_label) {
  ggplot(data = df, aes(x = Category, y = Percentage, fill = Type)) +
    geom_bar(stat = "identity", position = "fill") +
    geom_text(aes(label = scales::percent(Percentage, accuracy = 0.01)), 
              position = position_fill(vjust = 0.5), size = 5, color = "white") +
    scale_y_continuous(labels = no_percent_format) +
    labs(
      title = title,
      x = x_label,
      y = "Percentage in %",
      fill = fill_label
    ) +
    scale_fill_manual(values = c("Match" = "darkgreen", "Different" = "darkblue")) +
    scale_x_discrete(limits = c("Overall", "Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
    theme_minimal() +
    theme(
      plot.title = element_text(size = 12, face = "bold", color = "black"),  
      axis.title.x = element_text(size = 13, color = "black"),  
      axis.title.y = element_text(size = 13, color = "black"), 
      axis.text.x = element_text(size = 13, color = "black"),  
      axis.text.y = element_text(size = 13, color = "black"),  
      legend.title = element_text(size = 13, color = "black"),
      legend.text = element_text(size = 13, color = "black"))
}

add_labels(recall_long_tw_05, 
           title = "Share of candidate votes according to TSCS that GPT correctly predicted (recall) in Taiwan Chinese (T = 0.5)",
           fill_label = "GPT Prediction",
           x_label = "Vote Choice (TSCS)")

add_labels(precision_long_tw_05, 
           title = "Share of GPT predictions that voted for the respective candidate (precision) in Taiwan Chinese (T = 0.5)",
           fill_label = "TSCS Vote",
           x_label = "Vote Choice (GPT)")

## T = 0,9

categories_tw_09 <- rownames(conf_matrix_tw_09$byClass)
recall_df_tw_09 <- data.frame(
  Category = categories_tw_09,
  Match = recall_tw_09,
  Different = 1 - recall_tw_09
)

recall_df_tw_09$Category[recall_df_tw_09$Category == "Class: 1"] <- "Soong Chu-yu"
recall_df_tw_09$Category[recall_df_tw_09$Category == "Class: 2"] <- "Han Kuo-yu"
recall_df_tw_09$Category[recall_df_tw_09$Category == "Class: 3"] <- "Tsai Ing-wen"
recall_df_tw_09$Category[recall_df_tw_09$Category == "Class: 4"] <- "invalid vote"
recall_df_tw_09$Category[recall_df_tw_09$Category == "Class: 6"] <- "did not vote"

precision_df_tw_09 <- data.frame(
  Category = categories_tw_09,
  Match = precision_tw_09,
  Different = 1 - precision_tw_09
)

precision_df_tw_09$Category[precision_df_tw_09$Category == "Class: 1"] <- "Soong Chu-yu"
precision_df_tw_09$Category[precision_df_tw_09$Category == "Class: 2"] <- "Han Kuo-yu"
precision_df_tw_09$Category[precision_df_tw_09$Category == "Class: 3"] <- "Tsai Ing-wen"
precision_df_tw_09$Category[precision_df_tw_09$Category == "Class: 4"] <- "invalid vote"
precision_df_tw_09$Category[precision_df_tw_09$Category == "Class: 6"] <- "did not vote"

recall_overall_tw_09 <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_tw_09)) / sum(colSums(conf_matrix_table_tw_09)),
  Different = 1 - sum(diag(conf_matrix_table_tw_09)) / sum(colSums(conf_matrix_table_tw_09))
)

precision_overall_tw_09 <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_tw_09)) / sum(rowSums(conf_matrix_table_tw_09)),
  Different = 1 - sum(diag(conf_matrix_table_tw_09)) / sum(rowSums(conf_matrix_table_tw_09))
)

recall_df_tw_09 <- bind_rows(recall_df_tw_09, recall_overall_tw_09)
precision_df_tw_09 <- bind_rows(precision_df_tw_09, precision_overall_tw_09)

recall_long_tw_09 <- recall_df_tw_09 %>%
  gather(key = "Type", value = "Percentage", -Category)

precision_long_tw_09 <- precision_df_tw_09 %>%
  gather(key = "Type", value = "Percentage", -Category)

add_labels <- function(df, title, fill_label, x_label) {
  ggplot(data = df, aes(x = Category, y = Percentage, fill = Type)) +
    geom_bar(stat = "identity", position = "fill") +
    geom_text(aes(label = scales::percent(Percentage, accuracy = 0.01)), 
              position = position_fill(vjust = 0.5), size = 5, color = "white") +
    scale_y_continuous(labels = no_percent_format) +
    labs(
      title = title,
      x = x_label,
      y = "Percentage in %",
      fill = fill_label
    ) +
    scale_fill_manual(values = c("Match" = "darkgreen", "Different" = "darkblue")) +
    scale_x_discrete(limits = c("Overall", "Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
    theme_minimal() +
    theme(
      plot.title = element_text(size = 12, face = "bold", color = "black"),  
      axis.title.x = element_text(size = 13, color = "black"),  
      axis.title.y = element_text(size = 13, color = "black"), 
      axis.text.x = element_text(size = 13, color = "black"),  
      axis.text.y = element_text(size = 13, color = "black"),  
      legend.title = element_text(size = 13, color = "black"),
      legend.text = element_text(size = 13, color = "black"))
}

add_labels(recall_long_tw_09, 
           title = "Share of candidate votes according to TSCS that GPT correctly predicted (recall) in Taiwan Chinese (T = 0.9)",
           fill_label = "GPT Prediction",
           x_label = "Vote Choice (TSCS)")

add_labels(precision_long_tw_09, 
           title = "Share of GPT predictions that voted for the respective candidate (precision) in Taiwan Chinese (T = 0.9)",
           fill_label = "TSCS Vote",
           x_label = "Vote Choice (GPT)")

## T = 1

categories_tw_10 <- rownames(conf_matrix_tw_10$byClass)
recall_df_tw_10 <- data.frame(
  Category = categories_tw_10,
  Match = recall_tw_10,
  Different = 1 - recall_tw_10
)

recall_df_tw_10$Category[recall_df_tw_10$Category == "Class: 1"] <- "Soong Chu-yu"
recall_df_tw_10$Category[recall_df_tw_10$Category == "Class: 2"] <- "Han Kuo-yu"
recall_df_tw_10$Category[recall_df_tw_10$Category == "Class: 3"] <- "Tsai Ing-wen"
recall_df_tw_10$Category[recall_df_tw_10$Category == "Class: 4"] <- "invalid vote"
recall_df_tw_10$Category[recall_df_tw_10$Category == "Class: 6"] <- "did not vote"

precision_df_tw_10 <- data.frame(
  Category = categories_tw_10,
  Match = precision_tw_10,
  Different = 1 - precision_tw_10
)

precision_df_tw_10$Category[precision_df_tw_10$Category == "Class: 1"] <- "Soong Chu-yu"
precision_df_tw_10$Category[precision_df_tw_10$Category == "Class: 2"] <- "Han Kuo-yu"
precision_df_tw_10$Category[precision_df_tw_10$Category == "Class: 3"] <- "Tsai Ing-wen"
precision_df_tw_10$Category[precision_df_tw_10$Category == "Class: 4"] <- "invalid vote"
precision_df_tw_10$Category[precision_df_tw_10$Category == "Class: 6"] <- "did not vote"

recall_overall_tw_10 <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_tw_10)) / sum(colSums(conf_matrix_table_tw_10)),
  Different = 1 - sum(diag(conf_matrix_table_tw_10)) / sum(colSums(conf_matrix_table_tw_10))
)

precision_overall_tw_10 <- data.frame(
  Category = "Overall",
  Match = sum(diag(conf_matrix_table_tw_10)) / sum(rowSums(conf_matrix_table_tw_10)),
  Different = 1 - sum(diag(conf_matrix_table_tw_10)) / sum(rowSums(conf_matrix_table_tw_10))
)

recall_df_tw_10 <- bind_rows(recall_df_tw_10, recall_overall_tw_10)
precision_df_tw_10 <- bind_rows(precision_df_tw_10, precision_overall_tw_10)

recall_long_tw_10 <- recall_df_tw_10 %>%
  gather(key = "Type", value = "Percentage", -Category)

precision_long_tw_10 <- precision_df_tw_10 %>%
  gather(key = "Type", value = "Percentage", -Category)

add_labels <- function(df, title, fill_label, x_label) {
  ggplot(data = df, aes(x = Category, y = Percentage, fill = Type)) +
    geom_bar(stat = "identity", position = "fill") +
    geom_text(aes(label = scales::percent(Percentage, accuracy = 0.01)), 
              position = position_fill(vjust = 0.5), size = 5, color = "white") +
    scale_y_continuous(labels = no_percent_format) +
    labs(
      title = title,
      x = x_label,
      y = "Percentage in %",
      fill = fill_label
    ) +
    scale_fill_manual(values = c("Match" = "darkgreen", "Different" = "darkblue")) +
    scale_x_discrete(limits = c("Overall", "Soong Chu-yu", "Han Kuo-yu", "Tsai Ing-wen", "invalid vote", "did not vote")) +
    theme_minimal() +
    theme(
      plot.title = element_text(size = 12, face = "bold", color = "black"),  
      axis.title.x = element_text(size = 13, color = "black"),  
      axis.title.y = element_text(size = 13, color = "black"), 
      axis.text.x = element_text(size = 13, color = "black"),  
      axis.text.y = element_text(size = 13, color = "black"),  
      legend.title = element_text(size = 13, color = "black"),
      legend.text = element_text(size = 13, color = "black"))
}

add_labels(recall_long_tw_10, 
           title = "Share of candidate votes according to TSCS that GPT correctly predicted (recall) in Taiwan Chinese (T = 1)",
           fill_label = "GPT Prediction",
           x_label = "Vote Choice (TSCS)")

add_labels(precision_long_tw_10, 
           title = "Share of GPT predictions that voted for the respective candidate (precision) in Taiwan Chinese (T = 1)",
           fill_label = "TSCS Vote",
           x_label = "Vote Choice (GPT)")
