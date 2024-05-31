# robustness check

clean_data <- data

clean_data$gender[clean_data$gender == "1"] <- "male."
clean_data$gender[clean_data$gender == "2"] <- "female."

clean_data$residence[clean_data$residence == "1"] <- "Keelung."
clean_data$residence[clean_data$residence == "2"] <- "Taipei"
clean_data$residence[clean_data$residence == "3"] <- "New Taipei City."
clean_data$residence[clean_data$residence == "4"] <- "Taoyuan."
clean_data$residence[clean_data$residence == "5"] <- "Hsinchu."
clean_data$residence[clean_data$residence == "6"] <- "Hsinchu County."
clean_data$residence[clean_data$residence == "7"] <- "Miaoli County."
clean_data$residence[clean_data$residence == "8"] <- "Taichung."
clean_data$residence[clean_data$residence == "9"] <- "Changhua County."
clean_data$residence[clean_data$residence == "10"] <- "Nantou County."
clean_data$residence[clean_data$residence == "11"] <- "Yunlin County."
clean_data$residence[clean_data$residence == "12"] <- "Chiayi."
clean_data$residence[clean_data$residence == "13"] <- "Chiayi County."
clean_data$residence[clean_data$residence == "14"] <- "Tainan City."
clean_data$residence[clean_data$residence == "15"] <- "Kaohsiung."
clean_data$residence[clean_data$residence == "16"] <- "Pingtung County."
clean_data$residence[clean_data$residence == "17"] <- "Taitung County."
clean_data$residence[clean_data$residence == "18"] <- "Hualien County."
clean_data$residence[clean_data$residence == "19"] <- "Yilan County."
clean_data$residence[clean_data$residence == "20"] <- "Penghu County."
clean_data$residence[clean_data$residence == "21"] <- "Kinmen."
clean_data$residence[clean_data$residence == "96"] <- "a rare place."

clean_data$father[clean_data$father == "1"] <- "a Taiwanese from Fujian Minnan."
clean_data$father[clean_data$father == "2"] <- "a Taiwanese from Guangdong Hakka."
clean_data$father[clean_data$father == "3"] <- "a Taiwanese from Mainland."
clean_data$father[clean_data$father == "4"] <- "a Taiwan Aborigine."
clean_data$father[clean_data$father == "5"] <- "a resident of Chinese citizenship."
clean_data$father[clean_data$father == "6"] <- "a Southeast Asian."
clean_data$father[clean_data$father == "7"] <- "one from rare groups."

clean_data$mother[clean_data$mother == "1"] <- "a Taiwanese from Fujian Minnan."
clean_data$mother[clean_data$mother == "2"] <- "a Taiwanese from Guangdong Hakka."
clean_data$mother[clean_data$mother == "3"] <- "a Taiwanese from Mainland."
clean_data$mother[clean_data$mother == "4"] <- "a Taiwan Aborigine."
clean_data$mother[clean_data$mother == "5"] <- "a resident of Chinese citizenship."
clean_data$mother[clean_data$mother == "6"] <- "a Southeast Asian."
clean_data$mother[clean_data$mother == "7"] <- "one from rare groups."

clean_data$education[clean_data$education %in% c(1, 2, 3)] <- "primary school degree or lower."
clean_data$education[clean_data$education %in% c(4, 5)] <- "middle school degree."
clean_data$education[clean_data$education %in% c(6, 7, 8)] <- "high school degree."
clean_data$education[clean_data$education %in% c(9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21)] <- "college degree."

clean_data$religion[clean_data$religion %in% c(1, 2)] <- "very religious."
clean_data$religion[clean_data$religion %in% c(3, 4)] <- "somewhat religious."
clean_data$religion[clean_data$religion %in% c(5, 6)] <- "not very religious."
clean_data$religion[clean_data$religion %in% c(7, 8)] <- "not religious at all."

clean_data$democracy[clean_data$democracy %in% c(0, 1)] <- "think it’s very low."
clean_data$democracy[clean_data$democracy %in% c(2, 3)] <- "think it’s fairly low."
clean_data$democracy[clean_data$democracy %in% c(4, 5, 6)] <- "think it’s moderate."
clean_data$democracy[clean_data$democracy %in% c(7, 8)] <- "think it’s fairly high."
clean_data$democracy[clean_data$democracy %in% c(9, 10)] <- "think it’s very high."
clean_data$democracy[clean_data$democracy %in% c(93)] <- "have no opinion."

clean_data$identification[clean_data$identification == "1"] <- "Taiwanese."
clean_data$identification[clean_data$identification == "2"] <- "Chinese."
clean_data$identification[clean_data$identification == "3"] <- "Taiwanese and Chinese."
clean_data$identification[clean_data$identification == "4"] <- "Chinese and Taiwanese."
clean_data$identification[clean_data$identification == "5"] <- "neither Taiwanese nor Chinese."

clean_data$relationship[clean_data$relationship == "1"] <- "suggest to unify with Mainland China."
clean_data$relationship[clean_data$relationship == "2"] <- "suggest to become independent."
clean_data$relationship[clean_data$relationship == "3"] <- "suggest to maintain the status quo."
clean_data$relationship[clean_data$relationship == "4"] <- "think it depends on the situation."
clean_data$relationship[clean_data$relationship == "93"] <- "have no comment."

clean_data$party[clean_data$party == "1"] <- "the Kuomintang / Chinese Nationalist Party."
clean_data$party[clean_data$party == "2"] <- "the Democratic Progressive Party."
clean_data$party[clean_data$party == "3"] <- "the People First Party."
clean_data$party[clean_data$party == "4"] <- "the Taiwan Solidarity Union."
clean_data$party[clean_data$party == "5"] <- "the New Party."
clean_data$party[clean_data$party == "6"] <- "the New Power Party."
clean_data$party[clean_data$party == "7"] <- "the Taiwan People's Party."
clean_data$party[clean_data$party == "8"] <- "the Green Party."
clean_data$party[clean_data$party == "9"] <- "the Taiwan Statebuilding Party."
clean_data$party[clean_data$party == "10"] <- "all."
clean_data$party[clean_data$party == "11"] <- "neither of them."

clean_data$employment[clean_data$employment %in% c(1)] <- "working."
clean_data$employment[clean_data$employment %in% c(2, 4, 5, 6)] <- "not working."
clean_data$employment[clean_data$employment %in% c(3)] <- "studying/training."

clean_data$social[clean_data$social %in% c(1, 2, 3)] <- "low."
clean_data$social[clean_data$social %in% c(4, 5, 6, 7)] <- "middle."
clean_data$social[clean_data$social %in% c(8, 9, 10)] <- "high."

clean_data$election[clean_data$election == "1"] <- "Soong Chu-yu"
clean_data$election[clean_data$election == "2"] <- "Han Kuo-yu"
clean_data$election[clean_data$election == "3"] <- "Tsai Ing-wen"
clean_data$election[clean_data$election == "4"] <- "invalid vote"
clean_data$election[clean_data$election == "6"] <- "did not vote"


gender = ifelse(is.na(clean_data$gender) == FALSE,  paste("I am", clean_data$gender), "")
age = ifelse(is.na(clean_data$age) == FALSE,  paste("I am", clean_data$age, "years old."), "")
residence = ifelse(is.na(clean_data$residence) == FALSE,  paste("I live in", clean_data$residence), "")
father = ifelse(is.na(clean_data$father) == FALSE,  paste("My father is", clean_data$father), "")
mother = ifelse(is.na(clean_data$mother) == FALSE,  paste("My mother is", clean_data$mother), "")
education = ifelse(is.na(clean_data$education) == FALSE,  paste("My level of education is", clean_data$education), "")
religion = ifelse(is.na(clean_data$religion) == FALSE,  paste("I am", clean_data$religion), "")
democracy = ifelse(is.na(clean_data$democracy) == FALSE,  paste("In terms of satisfaction with the current implementation of our democracy, I", clean_data$democracy), "")
identification = ifelse(is.na(clean_data$identification) == FALSE,  paste("I identify myself as", clean_data$identification), "")
relationship = ifelse(is.na(clean_data$relationship) == FALSE,  paste("In terms of the future relationship between Taiwan and mainland China, I", clean_data$relationship), "")
party = ifelse(is.na(clean_data$party) == FALSE,  paste("Among the parties in Taiwan, I support", clean_data$party), "")
employment = ifelse(is.na(clean_data$employment) == FALSE,  paste("I am", clean_data$employment), "")
social = ifelse(is.na(clean_data$social) == FALSE,  paste("My social status is", clean_data$social), "")

# prompts

Prompt_RB = paste(gender,age,residence,father,mother,education,religion,democracy,identification,relationship,party,employment,social,
                  "Did I vote in the 2020 Taiwanese presidential election and if so, which candidate did I vote for? I [INSERT]"
                  )

robu_list <- list()
result_robu <- c(robu_list, Prompt_RB)

# clean version

trimmed_robu <- trimws(result_robu)
cleaned_robu <- gsub("\\s+", " ", trimmed_robu)
robu_final <- list()
result_robu_final <- c(robu_final, cleaned_robu)
