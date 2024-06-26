# Keywords Matching
completionM <- data.frame(
  nM = gpt_mainland[[1]]$n,
  gpt_contentM = gpt_mainland[[1]]$gpt_content
)

# Create keywords
categoriesM <- data.frame(
  key_wordM = c("宋楚瑜", "宋楚瑜/余湘", "宋余配", "亲民党", 
                "韩国瑜", "韩国瑜/张善政", "国政配", "国民党","蓝营","蓝军","泛蓝", 
                "蔡英文", "蔡英文/赖清德","英德配","民进党","绿营","绿军","泛绿","亲绿","偏绿", 
                "投废票", "没有投票权", "无资格投票", "无法投票", "不可能投票"),
  gpt_contentM = c("宋楚瑜", "宋楚瑜", "宋楚瑜", "宋楚瑜",  
                   "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜", "韩国瑜", 
                   "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", "蔡英文", 
                   NA, NA, NA, NA, NA)
)

# find out key words
find_categoryM <- function(gpt_contentM, categoriesM) {
  matchesM <- sapply(categoriesM$key_wordM, function(keyword) grepl(keyword, gpt_contentM, fixed = TRUE))
  matched_categoriesM <- categoriesM$gpt_contentM[matchesM]
  if (sum(matchesM) >= 2 && length(unique(matched_categoriesM)) > 1) {
    return(NA)
  } else if (length(matched_categoriesM) >= 1) {
    return(matched_categoriesM[1])
  } else {
    return(NA)
  }
}

# match every data
completionM$categoryM <- sapply(completionM$gpt_contentM, find_categoryM, categoriesM = categoriesM)

# result
print(completionM)
