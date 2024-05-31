# gpt example 

rgpt_authenticate("H:/Bachelorarbeit/access_key1.txt")

mainland_prompts_df <- data.frame(
  prompts_roles = rep("user", 10), 
  prompt_id = c(LETTERS[1:10]),
  prompt = c(clean_list[[1]], clean_list[[6]], clean_list[[24]], clean_list[[43]], 
             clean_list[[572]], clean_list[[583]], clean_list[[1303]],
             clean_list[[1351]], clean_list[[1387]], clean_list[[1409]])
)

prompts_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                 , prompt_content_var = mainland_prompts_df$prompt
                 , id_var = mainland_prompts_df$prompt_id
                 , param_max_tokens = 50
                 , param_n = 1
                 , param_temperatur = 0.5)

prompts_mainland[[1]]$gpt_content

# [1] "有可能，蔡英文"   "可能投票给宋楚瑜" "蔡英文"           "蔡英文"           "是，韩国瑜"       "蔡英文"          
# [7] "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"  

# temperature = 0.9

prompts_0.9_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                        , prompt_content_var = mainland_prompts_df$prompt
                        , id_var = mainland_prompts_df$prompt_id
                        , param_max_tokens = 50
                        , param_n = 1
                        , param_temperatur = 0.9)

prompts_0.9_mainland[[1]]$gpt_content

#[1] "有可能投票。蔡英文。" "有可能，宋楚瑜"       "蔡英文"               "蔡英文"               "蔡英文"              
#[6] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"  

# temperature = 1

prompts_1_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                            , prompt_content_var = mainland_prompts_df$prompt
                            , id_var = mainland_prompts_df$prompt_id
                            , param_max_tokens = 50
                            , param_n = 1
                            , param_temperatur = 1)

prompts_1_mainland[[1]]$gpt_content

#[1] "有可能投票，蔡英文。" "宋楚瑜"               "蔡英文"               "蔡英文"               "蔡英文"              
#[6] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"    

# temperature = 0.95

prompts_0.95_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                          , prompt_content_var = mainland_prompts_df$prompt
                          , id_var = mainland_prompts_df$prompt_id
                          , param_max_tokens = 50
                          , param_n = 1
                          , param_temperatur = 0.95)

prompts_0.95_mainland[[1]]$gpt_content

# [1] "蔡英文"             "可能，宋楚瑜"       "蔡英文"             "有可能，蔡英文"     "蔡英文"             "可能投票给蔡英文。"
# [7] "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"   

# temperature = 0.99

prompts_0.99_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                             , prompt_content_var = mainland_prompts_df$prompt
                             , id_var = mainland_prompts_df$prompt_id
                             , param_max_tokens = 50
                             , param_n = 1
                             , param_temperatur = 0.99)

prompts_0.99_mainland[[1]]$gpt_content

# [1] "有可能，蔡英文。" "韩国瑜"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# [7] "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"  

# temperature = 0.7

prompts_0.7_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                            , prompt_content_var = mainland_prompts_df$prompt
                            , id_var = mainland_prompts_df$prompt_id
                            , param_max_tokens = 50
                            , param_n = 1
                            , param_temperatur = 0.7)

prompts_0.7_mainland[[1]]$gpt_content

#[1] "蔡英文"                       "宋楚瑜"                       "蔡英文"                       "可能投票，但无法确定投给谁。"
#[5] "蔡英文"                       "蔡英文"                       "蔡英文"                       "蔡英文"                      
#[9] "蔡英文"                       "蔡英文"      

# Multiple completions with temperature = 0.9

multiple_prompts_0.9_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                            , prompt_content_var = mainland_prompts_df$prompt
                            , id_var = mainland_prompts_df$prompt_id
                            , param_max_tokens = 50
                            , param_n = 5
                            , param_temperatur = 0.9)

multiple_prompts_0.9_mainland[[1]]$gpt_content

#[1] "是，蔡英文"           "有可能投票，蔡英文。"  "有可能，蔡英文。"     "有可能，蔡英文"       "有可能投票，蔡英文。"
#[6] "是，宋楚瑜"           "宋楚瑜"                "有可能，宋楚瑜"       "是，宋楚瑜"           "可能投票，宋楚瑜。"  
#[11] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[16] "蔡英文"               "蔡英文"               "蔡英文"               "是，蔡英文"           "蔡英文"              
#[21] "是，韩国瑜。"         "蔡英文"               "蔡英文"               "蔡英文"               "可能投票，韩国瑜"    
#[26] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[31] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[36] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[41] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              
#[46] "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"               "蔡英文"              

# Multiple completions with temperature = 0.5

multiple_prompts_0.5_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                                     , prompt_content_var = mainland_prompts_df$prompt
                                     , id_var = mainland_prompts_df$prompt_id
                                     , param_max_tokens = 50
                                     , param_n = 5
                                     , param_temperatur = 0.5)

multiple_prompts_0.5_mainland[[1]]$gpt_content

#"有可能，蔡英文"     "有可能，蔡英文"     "有可能，蔡英文"     "有可能投票，蔡英文" "有可能，蔡英文"     
#"有可能，宋楚瑜"     "有可能，宋楚瑜"     "可能投票给宋楚瑜"   "有可能，宋楚瑜"     "有可能，宋楚瑜"     
#"蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
#"蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
#"韩国瑜"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
#"蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"            
#"蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
#"蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
#"蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
#"蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"   

# Multiple completions with temperature = 1

multiple_prompts_1_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                                     , prompt_content_var = mainland_prompts_df$prompt
                                     , id_var = mainland_prompts_df$prompt_id
                                     , param_max_tokens = 50
                                     , param_n = 5
                                     , param_temperatur = 1)

multiple_prompts_1_mainland[[1]]$gpt_content

# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           
# "可能投票，宋楚瑜" "蔡英文"           "可能，宋楚瑜"     "可能投票，韩国瑜" "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"          
# "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"           "蔡英文"    

# Multiple completions with temperature = 0.99

multiple_prompts_0.99_mainland = rgpt(prompt_role_var = mainland_prompts_df$prompts_roles
                                     , prompt_content_var = mainland_prompts_df$prompt
                                     , id_var = mainland_prompts_df$prompt_id
                                     , param_max_tokens = 50
                                     , param_n = 5
                                     , param_temperatur = 0.99)

multiple_prompts_0.99_mainland[[1]]$gpt_content

# "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
# "宋楚瑜"             "韩国瑜"             "韩国瑜"             "蔡英文"             "宋楚瑜"             
# "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
# "蔡英文"             "蔡英文"             "可能投给韩国瑜。"   "蔡英文"             "可能投票，蔡英文"   
# "没有投票权"         "蔡英文"             "韩国瑜"             "韩国瑜"             "蔡英文"             
# "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"            
# "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
# "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
# "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             "蔡英文"             
# "蔡英文"             "可能投票给蔡英文。" "蔡英文"             "蔡英文"             "蔡英文"  
