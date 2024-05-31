# prompts in Chinese (Taiwan)

taiwan_result_list <- list()

taiwan_question <- paste("2020年我", complete_dataT$age, "歲，", complete_dataT$gender, "性。我住在", complete_dataT$residence, "我的父親是", complete_dataT$father, "我的母親是", complete_dataT$mother, "我的教育水準是", complete_dataT$education, "我", complete_dataT$religion, "信教。關於目前我們施行民主情況的滿意程度，我", complete_dataT$democracy, "我認為自己", complete_dataT$identification, "就臺灣與中國大陸的未來關係，我", complete_dataT$relationship, "對於臺灣的政黨，我", complete_dataT$party, "我", complete_dataT$employment, "社會地位處於", complete_dataT$social, "我在2020年臺灣總統選舉中是否有可能投票？如果是，我最有可能投票給了哪個候選人？（答案只要幾個字,不要句子）我[插入]")

taiwan_result_list <- c(taiwan_result_list, taiwan_question)

# clean version

taiwan_result_clean <- gsub(" ", "", taiwan_result_list)

taiwan_clean_list <- list()

taiwan_clean_list <- c(taiwan_clean_list, taiwan_result_clean)
