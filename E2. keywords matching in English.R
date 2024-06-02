# Keywords Matching
completion <- data.frame(
  n = gpt_english[[1]]$n,
  gpt_content = gpt_english[[1]]$gpt_content
)

# Create keywords
categories <- data.frame(
  key_word = c("Soong Chu-yu", "James Soong", "People First Party", "Sandra Yu", "PFP", 
               "Han Kuo-yu", "Kuomintang", "Nationalist Party", "Chinese Nationalist Party", "KMT", "Chang San-cheng", 
               "Tsai Ing-wen", "Democratic Progressive Party", "DPP", "Lai Ching-te", "Centre to centre-left political party", 
               "invalid vote", "did not vote", "Unlikely", "did not vote", "didn't vote"),
  gpt_content = c("Soong Chu-yu", "Soong Chu-yu", "Soong Chu-yu", "Soong Chu-yu", "Soong Chu-yu", 
                  "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu",
                  "Tsai Ing-wen", "Tsai Ing-wen", "Tsai Ing-wen", "Tsai Ing-wen", "Tsai Ing-wen", 
                  "<NA>", "<NA>", "<NA>", "<NA>", "<NA>")
)

# find out key words
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

# match every data
completion$category <- sapply(completion$gpt_content, find_category, categories = categories)

# result
print(completion)
