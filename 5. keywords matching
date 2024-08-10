# Keywords Matching English
completion <- data.frame(
  n = prompts_df$prompt_id,
  gpt_content = all_message_contents_flat
)

## Create keywords
categories <- data.frame(
  key_word = c("Soong Chu-yu", "James Soong", "People First Party", "Sandra Yu", "PFP", 
               "Han Kuo-yu", "Kuomintang", "Nationalist Party", "Chinese Nationalist Party", "KMT", "Chang San-cheng", 
               "Tsai Ing-wen", "Democratic Progressive Party", "DPP", "Lai Ching-te", "Centre to centre-left political party", 
               "invalid vote", "did not vote", "Unlikely", "did not vote", "didn't vote"),
  gpt_content = c("Soong Chu-yu", "Soong Chu-yu", "Soong Chu-yu", "Soong Chu-yu", "Soong Chu-yu", 
                  "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu",
                  "Tsai Ing-wen", "Tsai Ing-wen", "Tsai Ing-wen", "Tsai Ing-wen", "Tsai Ing-wen", 
                  NA, NA, NA, NA, NA)
)

## find out key words
find_category <- function(gpt_content, categories) {
  matches <- sapply(categories$key_word, function(keyword) grepl(keyword, gpt_content, fixed = TRUE))
  matched_categories <- categories$gpt_content[matches]
  if (sum(matches) >= 2 && length(unique(matched_categories)) > 1) {
    return(NA)
  } else if (length(matched_categories) >= 1) {
    return(matched_categories[1])
  } else {
    return(NA)
  }
}

## match every data
completion$category <- sapply(completion$gpt_content, find_category, categories = categories)

## result
print(completion)


# Keywords Matching Chinese in mainland
completion_cn <- data.frame(
  n_cn = mainland_prompts$prompt_id,
  gpt_content_cn = all_message_contents_flat_cn
)

## Create keywords
categories_cn <- data.frame(
  key_word_cn = c("宋楚瑜", "宋楚瑜/余湘", "宋余配", "亲民党",
                  "韩国瑜", "韩国瑜/张善政", "国政配", "国民党", "蓝营", "蓝军", "泛蓝", 
                  "蔡英文", "蔡英文/赖清德", "英德配", "民进党", "绿营", "绿军", "泛绿", "亲绿", "偏绿", 
                  "投废票", "没有投票权", "无资格投票", "无法投票", "不可能投票"),
  gpt_content_cn = c("宋楚瑜", "宋楚瑜", "宋楚瑜", "宋楚瑜", 
                     "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜",
                     "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", 
                     NA, NA, NA, NA, NA)
)

## find out key words
find_category_cn <- function(gpt_content_cn, categories_cn) {
  matches_cn <- sapply(categories_cn$key_word_cn, function(keyword_cn) grepl(keyword_cn, gpt_content_cn, fixed = TRUE))
  matched_categories_cn <- categories_cn$gpt_content_cn[matches_cn]
  if (sum(matches_cn) >= 2 && length(unique(matched_categories_cn)) > 1) {
    return(NA)
  } else if (length(matched_categories_cn) >= 1) {
    return(matched_categories_cn[1])
  } else {
    return(NA)
  }
}

## match every data
completion_cn$category_cn <- sapply(completion_cn$gpt_content_cn, find_category_cn, categories_cn = categories_cn)

## result
print(completion_cn)

# Keywords Matching Chinese in Taiwan with temperature 0,5
completion_tw_05 <- data.frame(
  n_tw_05 = taiwan_prompts$prompt_id,
  gpt_content_tw_05 = all_message_contents_flat_tw_05
)

## Create keywords
categories_tw_05 <- data.frame(
  key_word_tw_05 = c("宋楚瑜", "宋楚瑜/余湘", "宋餘配", "親民黨",
                  "韓國瑜", "韓國瑜/張善政", "國政配", "國民黨", "藍營", "藍軍", "泛藍", 
                  "蔡英文", "蔡英文/賴清德", "英德配", "民進黨", "綠營", "綠軍", "泛綠", "親綠", "偏綠", 
                  "投廢票", "沒有資格投票", "無法投票", "不可能投票", "沒有投票權"),
  gpt_content_tw_05 = c("宋楚瑜", "宋楚瑜", "宋楚瑜", "宋楚瑜", 
                        "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", 
                        "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", 
                     NA, NA, NA, NA, NA)
)

## find out key words
find_category_tw_05 <- function(gpt_content_tw_05, categories_tw_05) {
  matches_tw_05 <- sapply(categories_tw_05$key_word_tw_05, function(keyword_tw_05) grepl(keyword_tw_05, gpt_content_tw_05, fixed = TRUE))
  matched_categories_tw_05 <- categories_tw_05$gpt_content_tw_05[matches_tw_05]
  if (sum(matches_tw_05) >= 2 && length(unique(matched_categories_tw_05)) > 1) {
    return(NA)
  } else if (length(matched_categories_tw_05) >= 1) {
    return(matched_categories_tw_05[1])
  } else {
    return(NA)
  }
}

## match every data
completion_tw_05$category_tw_05 <- sapply(completion_tw_05$gpt_content_tw_05, find_category_tw_05, categories_tw_05 = categories_tw_05)

## result
print(completion_tw_05)

# Keywords Matching Chinese in Taiwan with temperature 0,9
completion_tw_09 <- data.frame(
  n_tw_09 = taiwan_prompts$prompt_id,
  gpt_content_tw_09 = all_message_contents_flat_tw_09
)

## Create keywords
categories_tw_09 <- data.frame(
  key_word_tw_09 = c("宋楚瑜", "宋楚瑜/余湘", "宋餘配", "親民黨",
                     "韓國瑜", "韓國瑜/張善政", "國政配", "國民黨", "藍營", "藍軍", "泛藍", 
                     "蔡英文", "蔡英文/賴清德", "英德配", "民進黨", "綠營", "綠軍", "泛綠", "親綠", "偏綠", 
                     "投廢票", "沒有資格投票", "無法投票", "不可能投票", "沒有投票權"),
  gpt_content_tw_09 = c("宋楚瑜", "宋楚瑜", "宋楚瑜", "宋楚瑜", 
                        "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", 
                        "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", 
                        NA, NA, NA, NA, NA)
)

## find out key words
find_category_tw_09 <- function(gpt_content_tw_09, categories_tw_09) {
  matches_tw_09 <- sapply(categories_tw_09$key_word_tw_09, function(keyword_tw_09) grepl(keyword_tw_09, gpt_content_tw_09, fixed = TRUE))
  matched_categories_tw_09 <- categories_tw_09$gpt_content_tw_09[matches_tw_09]
  if (sum(matches_tw_09) >= 2 && length(unique(matched_categories_tw_09)) > 1) {
    return(NA)
  } else if (length(matched_categories_tw_09) >= 1) {
    return(matched_categories_tw_09[1])
  } else {
    return(NA)
  }
}

## match every data
completion_tw_09$category_tw_09 <- sapply(completion_tw_09$gpt_content_tw_09, find_category_tw_09, categories_tw_09 = categories_tw_09)

## result
print(completion_tw_09)

# Keywords Matching Chinese in Taiwan with temperature 1
completion_tw_10 <- data.frame(
  n_tw_10 = taiwan_prompts$prompt_id,
  gpt_content_tw_10 = all_message_contents_flat_tw_10
)

## Create keywords
categories_tw_10 <- data.frame(
  key_word_tw_10 = c("宋楚瑜", "宋楚瑜/余湘", "宋餘配", "親民黨",
                     "韓國瑜", "韓國瑜/張善政", "國政配", "國民黨", "藍營", "藍軍", "泛藍", 
                     "蔡英文", "蔡英文/賴清德", "英德配", "民進黨", "綠營", "綠軍", "泛綠", "親綠", "偏綠", 
                     "投廢票", "沒有資格投票", "無法投票", "不可能投票", "沒有投票權"),
  gpt_content_tw_10 = c("宋楚瑜", "宋楚瑜", "宋楚瑜", "宋楚瑜", 
                        "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", 
                        "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", 
                        NA, NA, NA, NA, NA)
)

## find out key words
find_category_tw_10 <- function(gpt_content_tw_10, categories_tw_10) {
  matches_tw_10 <- sapply(categories_tw_10$key_word_tw_10, function(keyword_tw_10) grepl(keyword_tw_10, gpt_content_tw_10, fixed = TRUE))
  matched_categories_tw_10 <- categories_tw_10$gpt_content_tw_10[matches_tw_10]
  if (sum(matches_tw_10) >= 2 && length(unique(matched_categories_tw_10)) > 1) {
    return(NA)
  } else if (length(matched_categories_tw_10) >= 1) {
    return(matched_categories_tw_10[1])
  } else {
    return(NA)
  }
}

## match every data
completion_tw_10$category_tw_10 <- sapply(completion_tw_10$gpt_content_tw_10, find_category_tw_10, categories_tw_10 = categories_tw_10)

## result
print(completion_tw_10)
