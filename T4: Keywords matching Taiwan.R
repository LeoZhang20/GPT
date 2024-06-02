completionT <- data.frame(
  nT = multiple_prompts_0.9_taiwan[[1]]$n,
  gpt_contentT = multiple_prompts_0.9_taiwan[[1]]$gpt_content
)

# Create keywords
categoriesT <- data.frame(
  key_wordT = c("宋楚瑜", "宋楚瑜/余湘", "宋餘配", "親民黨", 
               "韓國瑜", "韓國瑜/張善政", "國政配", "國民黨", "藍營", "藍軍", "泛藍", 
               "蔡英文", "蔡英文/賴清德", "英德配", "民進黨", "綠營", "綠軍", "泛綠", "親綠", "偏綠", 
               "投廢票", "沒有投票權", "沒有資格投票", "無法投票", "不可能投票"),
  gpt_contentT = c("宋楚瑜", "宋楚瑜", "宋楚瑜", "宋楚瑜", 
                  "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", "韓國瑜", 
                  "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", 
                  "<NA>", "<NA>", "<NA>", "<NA>", "<NA>")
)

# find out key words
find_categoryT <- function(gpt_contentT, categoriesT) {
  matchesT <- sapply(categoriesT$key_wordT, function(keyword) grepl(keyword, gpt_contentT, fixed = TRUE))
  matched_categoriesT <- categoriesT$gpt_contentT[matchesT]
  if (sum(matchesT) >= 2 && length(unique(matched_categoriesT)) > 1) {
    return(NA)
  } else if (length(matched_categoriesT) >= 1) {
    return(matched_categoriesT[1])
  } else {
    return(NA)
  }
}

# match every data
completionT$categoryT <- sapply(completionT$gpt_contentT, find_categoryT, categoriesT = categoriesT)

# result
print(completionT)
