knitr::opts_chunk$set(echo = TRUE)

library(devtools)

devtools::install_github("ben-aaron188/rgpt3")
library(rgpt3)

library(haven)
library(dplyr)
library(forcats)
library(stringr)
library(mice)
library(checkmate)

complete_dataM <- complete_data

complete_dataM$gender[complete_dataM$gender == "1"] <- "男"
complete_dataM$gender[complete_dataM$gender == "2"] <- "女"

complete_dataM$residence[complete_dataM$residence == "1"] <- "基隆市。"
complete_dataM$residence[complete_dataM$residence == "2"] <- "台北市。"
complete_dataM$residence[complete_dataM$residence == "3"] <- "新北市。"
complete_dataM$residence[complete_dataM$residence == "4"] <- "桃园市。"
complete_dataM$residence[complete_dataM$residence == "5"] <- "新竹市。"
complete_dataM$residence[complete_dataM$residence == "6"] <- "新竹县。"
complete_dataM$residence[complete_dataM$residence == "7"] <- "苗栗县。"
complete_dataM$residence[complete_dataM$residence == "8"] <- "台中市。"
complete_dataM$residence[complete_dataM$residence == "9"] <- "彰化县。"
complete_dataM$residence[complete_dataM$residence == "10"] <- "南投县。"
complete_dataM$residence[complete_dataM$residence == "11"] <- "云林县。"
complete_dataM$residence[complete_dataM$residence == "12"] <- "嘉义市。"
complete_dataM$residence[complete_dataM$residence == "13"] <- "嘉义县。"
complete_dataM$residence[complete_dataM$residence == "14"] <- "台南市。"
complete_dataM$residence[complete_dataM$residence == "15"] <- "高雄市。"
complete_dataM$residence[complete_dataM$residence == "16"] <- "屏东县。"
complete_dataM$residence[complete_dataM$residence == "17"] <- "台东县"
complete_dataM$residence[complete_dataM$residence == "18"] <- "花莲县。"
complete_dataM$residence[complete_dataM$residence == "19"] <- "宜兰县。"
complete_dataM$residence[complete_dataM$residence == "20"] <- "澎湖县。"
complete_dataM$residence[complete_dataM$residence == "21"] <- "金门县。"
complete_dataM$residence[complete_dataM$residence == "96"] <- "其他偏僻的地方。"

complete_dataM$father[complete_dataM$father == "1"] <- "台湾闽南人，"
complete_dataM$father[complete_dataM$father == "2"] <- "台湾客家人，"
complete_dataM$father[complete_dataM$father == "3"] <- "大陆各省市（外省）人，"
complete_dataM$father[complete_dataM$father == "4"] <- "台湾原住民，"
complete_dataM$father[complete_dataM$father == "5"] <- "大陆籍，"
complete_dataM$father[complete_dataM$father == "6"] <- "东南亚籍，"
complete_dataM$father[complete_dataM$father == "7"] <- "非常见民族，"

complete_dataM$mother[complete_dataM$mother == "1"] <- "台湾闽南人。"
complete_dataM$mother[complete_dataM$mother == "2"] <- "台湾客家人。"
complete_dataM$mother[complete_dataM$mother == "3"] <- "大陆各省市（外省）人。"
complete_dataM$mother[complete_dataM$mother == "4"] <- "台湾原住民。"
complete_dataM$mother[complete_dataM$mother == "5"] <- "大陆籍。"
complete_dataM$mother[complete_dataM$mother == "6"] <- "东南亚籍。"
complete_dataM$mother[complete_dataM$mother == "7"] <- "非常见民族。"

complete_dataM$education[complete_dataM$education %in% c(1, 2, 3)] <- "小学毕业或以下，"
complete_dataM$education[complete_dataM$education %in% c(4, 5)] <- "初中毕业，"
complete_dataM$education[complete_dataM$education %in% c(6, 7, 8)] <- "高中毕业，"
complete_dataM$education[complete_dataM$education %in% c(9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21)] <- "高等教育，"

complete_dataM$religion[complete_dataM$religion %in% c(1, 2)] <- "非常虔诚"
complete_dataM$religion[complete_dataM$religion %in% c(3, 4)] <- "比较虔诚"
complete_dataM$religion[complete_dataM$religion %in% c(5, 6)] <- "不太虔诚"
complete_dataM$religion[complete_dataM$religion %in% c(7, 8)] <- "不"

complete_dataM$democracy[complete_dataM$democracy %in% c(0, 1)] <- "认为非常低。"
complete_dataM$democracy[complete_dataM$democracy %in% c(2, 3)] <- "认为比较低。"
complete_dataM$democracy[complete_dataM$democracy %in% c(4, 5, 6)] <- "认为一般。"
complete_dataM$democracy[complete_dataM$democracy %in% c(7, 8)] <- "认为比较高。"
complete_dataM$democracy[complete_dataM$democracy %in% c(9, 10)] <- "认为非常高。"
complete_dataM$democracy[complete_dataM$democracy %in% c(93)] <- "无意见。"

complete_dataM$identification[complete_dataM$identification == "1"] <- "是台湾人，"
complete_dataM$identification[complete_dataM$identification == "2"] <- "是中国人，"
complete_dataM$identification[complete_dataM$identification == "3"] <- "是台湾人和中国人，"
complete_dataM$identification[complete_dataM$identification == "4"] <- "是中国人和台湾人，"
complete_dataM$identification[complete_dataM$identification == "5"] <- "既不是台湾人也不是中国人，"

complete_dataM$relationship[complete_dataM$relationship == "1"] <- "支持统一。"
complete_dataM$relationship[complete_dataM$relationship == "2"] <- "支持独立。"
complete_dataM$relationship[complete_dataM$relationship == "3"] <- "支持维持现状。"
complete_dataM$relationship[complete_dataM$relationship == "4"] <- "认为要看情形。"
complete_dataM$relationship[complete_dataM$relationship == "93"] <- "无意见。"

complete_dataM$party[complete_dataM$party == "1"] <- "支持国民党。"
complete_dataM$party[complete_dataM$party == "2"] <- "支持民进党。"
complete_dataM$party[complete_dataM$party == "3"] <- "支持亲民党。"
complete_dataM$party[complete_dataM$party == "4"] <- "支持台联。"
complete_dataM$party[complete_dataM$party == "5"] <- "支持新党。"
complete_dataM$party[complete_dataM$party == "6"] <- "支持时代力量。"
complete_dataM$party[complete_dataM$party == "7"] <- "支持台湾民众党。"
complete_dataM$party[complete_dataM$party == "8"] <- "支持绿党。"
complete_dataM$party[complete_dataM$party == "9"] <- "支持台湾激进。"
complete_dataM$party[complete_dataM$party == "10"] <- "都支持。"
complete_dataM$party[complete_dataM$party == "11"] <- "都不支持。"

complete_dataM$employment[complete_dataM$employment %in% c(1)] <- "工作，"
complete_dataM$employment[complete_dataM$employment %in% c(2, 4, 5, 6)] <- "不工作，"
complete_dataM$employment[complete_dataM$employment %in% c(3)] <- "因上學而不工作，"

complete_dataM$social[complete_dataM$social %in% c(1, 2, 3)] <- "底层。"
complete_dataM$social[complete_dataM$social %in% c(4, 5, 6, 7)] <- "中层。"
complete_dataM$social[complete_dataM$social %in% c(8, 9, 10)] <- "高层。"

complete_dataM$election[complete_dataM$election == "1"] <- "宋楚瑜"
complete_dataM$election[complete_dataM$election == "2"] <- "韩国瑜"
complete_dataM$election[complete_dataM$election == "3"] <- "蔡英文"
complete_dataM$election[complete_dataM$election == "4"] <- "投废票"
complete_dataM$election[complete_dataM$election == "6"] <- "没有投票"
