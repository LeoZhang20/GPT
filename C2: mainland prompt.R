# prompts in Chinese (Mainland)

result_listM <- list()

questionM <- paste("2020年我", complete_dataM$age, "岁，", complete_dataM$gender, "性。我住在", complete_dataM$residence, "我的父亲是", complete_dataM$father, "我的母亲是", complete_dataM$mother, "我的教育水平是", complete_dataM$education, "我", complete_dataM$religion, "信教。关于目前我们施行民主情况的满意程度，我", complete_dataM$democracy, "我认为自己", complete_dataM$identification, "就台湾与中国大陆的未来关系，我", complete_dataM$relationship, "对于台湾的政党，我", complete_dataM$party, "我", complete_dataM$employment, "社会地位处于", complete_dataM$social, "我在2020年台湾总统选举中是否有可能投票？如果是，我最有可能投票给了哪个候选人？（答案只要几个字，不要句子）我[插入]")

result_listM <- c(result_listM, questionM)

# clean version

result_clean <- gsub(" ", "", result_listM)

clean_list <- list()

clean_list <- c(clean_list, result_clean)

