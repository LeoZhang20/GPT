# create prompts from words

result_list <- list()

question <- paste("I was", complete_dataE$age, "years old in 2020 and I am", complete_dataE$gender, "I live in", complete_dataE$residence, "My father is", complete_dataE$father, "and my mother is", complete_dataE$mother, "My level of education is", complete_dataE$education, "and I am", complete_dataE$religion, "In terms of satisfaction with the current implementation of our democracy, I", complete_dataE$democracy, "I identify myself as", complete_dataE$identification, "and in terms of the future relationship between Taiwan and Mainland China, I", complete_dataE$relationship, "Among the parties in Taiwan, I support", complete_dataE$party, "I am", complete_dataE$employment, "and my social status is", complete_dataE$social, "How likely was I to vote in the 2020 Taiwanese presidential election? If I voted, which candidate did I most likely to vote for? (I would like the answer in a few words, not sentence) I [INSERT]")

result_list <- c(result_list, question)
