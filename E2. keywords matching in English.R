# Keywords Matching
completion <- data.frame(
  n = gpt_english[[1]]$n,
  gpt_content = gpt_english[[1]]$gpt_content
)

# Create keywords
categories <- data.frame(
  key_word = c("Soong Chu-yu", "James Soong", "People First Party", 
               "Han Kuo-yu", "Kuomintang", "Nationalist Party", "Chinese Nationalist Party", "KMT", 
               "Tsai Ing-wen", "Democratic Progressive Party", "DPP",
               "invalid vote", 
               "did not vote", "Unlikely"),
  gpt_content = c("Soong Chu-yu", "Soong Chu-yu", "Soong Chu-yu", 
                  "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu", "Han Kuo-yu",
                  "Tsai Ing-wen", "Tsai Ing-wen", "Tsai Ing-wen",
                  "invalid vote", 
                  "did not vote", "did not vote")
)

# find out key words
find_category <- function(gpt_content, categories) {
  for (i in 1:nrow(categories)) {
    if (grepl(categories$key_word[i], gpt_content, fixed = TRUE)) {
      return(categories$gpt_content[i])
    }
  }
  return(NA)
}

# match every data
completion$category <- sapply(completion$gpt_content, find_category, categories = categories)

# result
print(completion)
