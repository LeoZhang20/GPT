# gpt example

taiwan_prompts <- data.frame(
  prompts_roles = rep("user", 10), 
  prompt_id = c(LETTERS[1:10]),
  prompt = c(taiwan_clean_list[[1]], taiwan_clean_list[[6]], taiwan_clean_list[[24]], taiwan_clean_list[[43]], 
             taiwan_clean_list[[572]], taiwan_clean_list[[583]], taiwan_clean_list[[1303]],
             taiwan_clean_list[[1351]], taiwan_clean_list[[1387]], taiwan_clean_list[[1409]])
)

example_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                      , prompt_content_var = taiwan_prompts$prompt
                      , id_var = taiwan_prompts$prompt_id
                      , param_max_tokens = 50
                      , param_n = 1
                      , param_temperatur = 0.5)

example_taiwan[[1]]$gpt_content


#[1] "可能投票，蔡英文"   "宋楚瑜"             "蔡英文"             "有可能投票，蔡英文" "是，無法確定。"     "蔡英文"            
#[7] "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"  

# temperature = 0.9

prompts_0.9_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                            , prompt_content_var = taiwan_prompts$prompt
                            , id_var = taiwan_prompts$prompt_id
                            , param_max_tokens = 50
                            , param_n = 1
                            , param_temperatur = 0.9)

prompts_0.9_taiwan[[1]]$gpt_content

#[1] "是，蔡英文"               "宋楚瑜"                   "蔡英文"                   "不適用"                  
#[5] "不可能投票给特定候选人。" "蔡英文"                   "蔡英文"                   "蔡英文"                  
#[9] "蔡英文"                   "蔡英文"   

# temperature = 1

prompts_1_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                          , prompt_content_var = taiwan_prompts$prompt
                          , id_var = taiwan_prompts$prompt_id
                          , param_max_tokens = 50
                          , param_n = 1
                          , param_temperatur = 1)

prompts_1_taiwan[[1]]$gpt_content

#[1] "是，無法確定" "宋楚瑜"       "蔡英文"       "無法投票"     "無法投票"     "蔡英文"       "蔡英文"       "蔡英文"      
#[9] "蔡英文"       "蔡英文"

# temperature = 0.95

prompts_0.95_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                        , prompt_content_var = taiwan_prompts$prompt
                        , id_var = taiwan_prompts$prompt_id
                        , param_max_tokens = 50
                        , param_n = 1
                        , param_temperatur = 0.95)

prompts_0.95_taiwan[[1]]$gpt_content

# [1] "有可能，蔡英文" "宋楚瑜"         "蔡英文"         "無法投票"       "無法投票"       "蔡英文"         "蔡英文"        
# [8] "蔡英文"         "蔡英文"         "蔡英文"        

# temperature = 0.99

prompts_0.99_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                           , prompt_content_var = taiwan_prompts$prompt
                           , id_var = taiwan_prompts$prompt_id
                           , param_max_tokens = 50
                           , param_n = 1
                           , param_temperatur = 0.99)

prompts_0.99_taiwan[[1]]$gpt_content

#[1] "是，無法確定"                   "宋楚瑜"                         "蔡英文"                        
#[4] "無法投票"                       "不可能回答您投给了哪个候选人。" "蔡英文"                        
#[7] "蔡英文"                         "蔡英文"                         "蔡英文"                        
#[10] "蔡英文"      

# temperature = 0.7

prompts_0.7_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                          , prompt_content_var = taiwan_prompts$prompt
                          , id_var = taiwan_prompts$prompt_id
                          , param_max_tokens = 50
                          , param_n = 1
                          , param_temperatur = 0.7)

prompts_0.7_taiwan[[1]]$gpt_content

#[1] "蔡英文"                     "是，宋楚瑜"                 "蔡英文"                     "無法投票"                  
#[5] "是，沒有投票给特定候选人。" "蔡英文"                     "蔡英文"                     "蔡英文"                    
#[9] "蔡英文"                     "蔡英文"             

# Multiple completions with temperature = 0.9

multiple_prompts_0.9_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                                     , prompt_content_var = taiwan_prompts$prompt
                                     , id_var = taiwan_prompts$prompt_id
                                     , param_max_tokens = 50
                                     , param_n = 5
                                     , param_temperatur = 0.9)

multiple_prompts_0.9_taiwan[[1]]$gpt_content

#"蔡英文"                     "蔡英文"                     "有可能，蔡英文"             "無法投票"                   "有可能投票。答案無法確定。" 
#"可能投票給宋楚瑜"           "宋楚瑜"                     "是，宋楚瑜"                 "宋楚瑜"                     "是，宋楚瑜"                 
#"蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"                     
#"可能投票，候選人無法確定。" "有可能，蔡英文"             "是，無法確定候選人"         "有可能，蔡英文。"           "是，蔡英文"                
#"無法投票給特定候選人"       "有可能，韓國瑜"             "不可能投票"                 "是，無法確定候選人"         "無法投票給特定候選人"       
#"是，蔡英文"                 "蔡英文"                     "蔡英文"                     "可能投票給蔡英文"           "有可能投票，蔡英文"         
#"蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"                     
#"蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"                    
#"蔡英文"                     "蔡英文"                     "蔡英文"                     "可能投票給蔡英文。"         "蔡英文"                     
#"蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"                     "蔡英文"  

# Multiple completions with temperature = 0.5

multiple_prompts_0.5_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                                     , prompt_content_var = taiwan_prompts$prompt
                                     , id_var = taiwan_prompts$prompt_id
                                     , param_max_tokens = 50
                                     , param_n = 5
                                     , param_temperatur = 0.5)

multiple_prompts_0.5_taiwan[[1]]$gpt_content

#[1] "有可能，蔡英文"       "有可能，蔡英文"       "有可能，蔡英文"       "有可能，蔡英文"       "有可能，蔡英文"      
#[6] "是，宋楚瑜"           "是，宋楚瑜"           "是，宋楚瑜"           "宋楚瑜"               "是，宋楚瑜"          
#[11] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[16] "有可能，蔡英文"       "有可能投票，蔡英文"   "有可能，蔡英文"       "有可能，宋楚瑜"       "有可能投票，蔡英文。"
#[21] "是，韓國瑜"           "是，韓國瑜"           "是，韓國瑜。"         "是，無法確定候選人。" "是，韓國瑜"          
#[26] "是，蔡英文"           "是，蔡英文"           "是，蔡英文"           "蔡英文"               "蔡英文"              
#[31] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[36] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[41] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[46] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"  

# Multiple completions with temperature = 1

multiple_prompts_1_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                                   , prompt_content_var = taiwan_prompts$prompt
                                   , id_var = taiwan_prompts$prompt_id
                                   , param_max_tokens = 50
                                   , param_n = 5
                                   , param_temperatur = 1)

multiple_prompts_1_taiwan[[1]]$gpt_content

# "可能投票，但不能確定給誰。"       "可能投票给蔡英文"                 "蔡英文"                           "蔡英文"                           "有可能，無法確定"                
# "親民黨候選人"                     "可能投票給宋楚瑜"                 "蔡英文"                           "宋楚瑜"                           "宋楚瑜"                          
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                          
# "沒有資格投票"                     "是，宋楚瑜"                       "有可能投票，候選人難以判定。"     "是，無法確定"                     "有可能投票，答案無法確定。"     
# "無法投票给特定候选人"             "有可能投票，但無法確定投票給誰。" "可能投票，候選人無法判斷。"       "無法投票"                         "可能投票，但具體候選人無法確定。" 
# "是，蔡英文"                       "可能投票，蔡英文"                 "蔡英文"                           "蔡英文"                           "蔡英文"                          
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                          
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                          
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                          

# Multiple completions with temperature = 0.95

multiple_prompts_0.95_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                                 , prompt_content_var = taiwan_prompts$prompt
                                 , id_var = taiwan_prompts$prompt_id
                                 , param_max_tokens = 50
                                 , param_n = 5
                                 , param_temperatur = 0.95)

multiple_prompts_0.95_taiwan[[1]]$gpt_content

# "是，蔡英文"                       "是，蔡英文"                        "可能投票給蔡英文"                  "有可能，蔡英文"                   "有可能，蔡英文"                   
# "對不起，我無法預測你的投票選擇。"   "是，宋楚瑜"                        "是，宋楚瑜"                       "是，宋楚瑜"                       "宋楚瑜"                           
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                          
# "不可能投票"                        "可能投票，無法確定候選人。"        "不可能投票"                        "是，蔡英文"                       "不可能投票"                       
# "無法投票候选人"                    "無法投票"                         "無法投票"                         "無法投票"                         "無法投票"                         
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                          
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                          
# "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"                           "蔡英文"      

# Multiple completions with temperature = 0.99

multiple_prompts_0.99_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                                    , prompt_content_var = taiwan_prompts$prompt
                                    , id_var = taiwan_prompts$prompt_id
                                    , param_max_tokens = 50
                                    , param_n = 5
                                    , param_temperatur = 0.99)

multiple_prompts_0.99_taiwan[[1]]$gpt_content

# "無法投票"                     "可能投票，候選人無法確定。"   "可能投票給蔡英文"             "蔡英文"                       "有可能，無法判斷"             
# "宋楚瑜"                       "宋楚瑜"                       "宋楚瑜"                       "是，宋楚瑜"                   "宋楚瑜"                       
# "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       
# "有可能投票，候選人無法預測。" "是，無法判斷"                 "有可能投票，無法判斷候選人。" "是，無法確定候選人。"         "有可能投票，候選人無法確定。"
# "是，韓國瑜。"                 "韓國瑜或蔡英文"               "是，韓國瑜"                   "有可能投票，答案無法確定。"   "是，蔡英文。"                 
# "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       
# "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       
# "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                      
# "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       
# "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                      
