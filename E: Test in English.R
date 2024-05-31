library(rgpt3)
library(haven)
library(dplyr)
library(forcats)
library(stringr)
library(mice)
library(checkmate)

# original result

complete_dataE$election[[1]] # "did not vote"
complete_dataE$election[[6]] # "Soong Chu-yu"
complete_dataE$election[[24]] # "Han Kuo-yu"
complete_dataE$election[[43]] # "invalid vote"
complete_dataE$election[[572]] # "invalid vote"
complete_dataE$election[[583]] # "Tsai Ing-wen"
complete_dataE$election[[1303]] # "Tsai Ing-wen"
complete_dataE$election[[1351]] # "Tsai Ing-wen"
complete_dataE$election[[1387]] # "did not vote"
complete_dataE$election[[1409]] # "Tsai Ing-wen"

# example

rgpt_authenticate("H:/Bachelorarbeit/access_key.txt")

zehn_prompts_Example <- data.frame(
  prompts_roles = rep("user", 10), 
  prompt_id = c(LETTERS[1:10]),
  prompt = c(result_list[[1]],
             result_list[[6]],
             result_list[[24]],
             result_list[[43]],
             result_list[[572]],
             result_list[[583]],
             result_list[[1303]],
             result_list[[1351]],
             result_list[[1387]],
             result_list[[1409]]
  )
)

zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                    , prompt_content_var = zehn_prompts_Example$prompt
                    , id_var = zehn_prompts_Example$prompt_id
                    , param_max_tokens = 50
                    , param_n = 1
                    , param_temperature = 0.5)

zehn_prompts[[1]]$gpt_content

#[1] "I likely voted, Tsai Ing-wen."   "Likely voted, James Soong"       "I likely voted, Tsai Ing-wen."  
#[4] "I likely voted, Tsai Ing-wen."   "I likely voted, Tsai Ing-wen"    "I likely voted, Tsai Ing-wen."  
#[7] "Very likely, Tsai Ing-wen"       "Highly likely, Tsai Ing-wen"     "Likely voted, Tsai Ing-wen"     
#[10] "Very likely voted, Tsai Ing-wen"


# temperature

## 0.7

temperature_0.7_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                                    , prompt_content_var = zehn_prompts_Example$prompt
                                    , id_var = zehn_prompts_Example$prompt_id
                                    , param_max_tokens = 50
                                    , param_n = 1
                                    , param_temperature = 0.7)

temperature_0.7_zehn_prompts[[1]]$gpt_content

#[1] "Likely voted, Tsai Ing-wen"    "Likely voted, James Soong"     "Likely voted, Tsai Ing-wen"    "Unlikely, None."              
#[5] "I likely voted, Tsai Ing-wen." "Likely voted, Tsai Ing-wen"    "Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"    
#[9] "I likely voted, Tsai Ing-wen." "Very likely, Tsai Ing-wen"  

## 0.9

temperature_0.9_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                                    , prompt_content_var = zehn_prompts_Example$prompt
                                    , id_var = zehn_prompts_Example$prompt_id
                                    , param_max_tokens = 50
                                    , param_n = 1
                                    , param_temperature = 0.9)

temperature_0.9_zehn_prompts[[1]]$gpt_content

#[1] "Likely voted, Tsai Ing-wen"      "Highly likely, James Soong"      "I likely voted, Tsai Ing-wen."  
#[4] "I likely voted, Tsai Ing-wen."   "I likely voted, Han Kuo-yu."     "You likely voted, Tsai Ing-wen."
#[7] "Very likely, Tsai Ing-wen"       "Highly likely, Tsai Ing-wen"     "Likely voted, Tsai Ing-wen"     
#[10] "Very likely voted, Tsai Ing-wen"

## 1

temperature_1_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                                    , prompt_content_var = zehn_prompts_Example$prompt
                                    , id_var = zehn_prompts_Example$prompt_id
                                    , param_max_tokens = 50
                                    , param_n = 1
                                    , param_temperature = 1)

temperature_1_zehn_prompts[[1]]$gpt_content

#[1] "Voted, Tsai Ing-wen likely."  "Likely voted, James Soong"    "Likely voted, Tsai Ing-wen"   "Unlikely, None"              
#[5] "Likely voted, Tsai Ing-wen"   "I likely voted, Tsai Ing-wen" "Likely voted, Tsai Ing-wen"   "Very likely, Tsai Ing-wen"   
#[9] "Likely voted, Tsai Ing-wen"   "Very likely, Tsai Ing-wen"   

## 0.95

temperature_0.95_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                                  , prompt_content_var = zehn_prompts_Example$prompt
                                  , id_var = zehn_prompts_Example$prompt_id
                                  , param_max_tokens = 50
                                  , param_n = 1
                                  , param_temperature = 0.95)

temperature_0.95_zehn_prompts[[1]]$gpt_content

#[1] "Likely voted, Tsai Ing-wen"                   "Likely voted, James Soong"                   
#[3] "I likely voted, Tsai Ing-wen."                "Unlikely; [Vote choice cannot be determined]"
#[5] "Unlikely to vote; if voted, Tsai Ing-wen."    "You likely voted, Tsai Ing-wen."             
#[7] "Highly likely, Tsai Ing-wen"                  "Highly likely, Tsai Ing-wen"                 
#[9] "Likely voted, Tsai Ing-wen"                   "Very likely, Tsai Ing-wen"   


# Multiple completions

completion_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                               , prompt_content_var = zehn_prompts_Example$prompt
                               , id_var = zehn_prompts_Example$prompt_id
                               , param_max_tokens = 50
                               , param_n = 5
                               , param_temperature = 0.5)

completion_zehn_prompts[[1]]$gpt_content

#"I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "Likely voted, Tsai Ing-wen"  "I likely voted, Tsai Ing-wen." 
#"Highly likely, James Soong"    "I likely voted, James Soong."  "I likely voted, Han Kuo-yu."  "Highly likely, James Soong"    "I likely voted, James Soong."  
#"I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." 
#"I likely voted, Tsai Ing-wen." "Unlikely, None"                "Unlikely, None"                "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen."
#"I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." 
#"I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "Likely voted, Tsai Ing-wen"   "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." 
#"Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"    "Very likely, Tsai Ing-wen"     "Highly likely, Tsai Ing-wen"   "Very likely, Tsai Ing-wen"     
#"Very likely, Tsai Ing-wen"    "Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"    
#"I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." "Likely voted, Tsai Ing-wen"    "I likely voted, Tsai Ing-wen." "I likely voted, Tsai Ing-wen." 
#"Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"    "Very likely, Tsai Ing-wen"     "Very likely, Tsai Ing-wen"   

## with temperature 0.9

completion_0.9_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                                   , prompt_content_var = zehn_prompts_Example$prompt
                                   , id_var = zehn_prompts_Example$prompt_id
                                   , param_max_tokens = 50
                                   , param_n = 5
                                   , param_temperature = 0.9)

completion_0.9_zehn_prompts[[1]]$gpt_content

# "Likely voted, Tsai Ing-wen"           "Likely voted, Tsai Ing-wen likely."   "Likely, Tsai Ing-wen"              "Likely voted, Tsai Ing-wen"           "Likely voted, Tsai Ing-wen"           
# "Likely voted, James Soong"            "Likely voted, James Soong"            "Likely voted, James Soong"            "Highly likely, James Soong"           "Likely voted, James Soong"            
# "Likely voted, Tsai Ing-wen"           "Likely voted, Tsai Ing-wen"           "Likely to vote, Tsai Ing-wen"         "Likely voted, Tsai Ing-wen"           "Likely voted, Tsai Ing-wen"          
# "I likely voted, Tsai Ing-wen."        "Unlikely, Han Kuo-yu"                 "Unlikely, Tsai Ing-wen"               "Unlikely, None"                       "I likely voted, Tsai Ing-wen likely." 
# "Likely voted, Tsai Ing-wen"           "Likely voted, Tsai Ing-wen"           "I likely voted, Tsai Ing-wen."        "I likely voted, Tsai Ing-wen."        "I likely voted, Tsai Ing-wen."        
# "Likely voted, Tsai Ing-wen"           "Likely to vote; Tsai Ing-wen"         "Likely voted, Tsai Ing-wen"           "Likely voted, Tsai Ing-wen"           "You likely voted, Tsai Ing-wen."     
# "I likely voted, Tsai Ing-wen."        "Likely voted, Tsai Ing-wen."          "Very likely, Tsai Ing-wen"            "Highly likely, Tsai Ing-wen"          "I likely voted, Tsai Ing-wen."        
# "Very likely, Tsai Ing-wen"            "Highly likely, Tsai Ing-wen"          "Highly likely, Tsai Ing-wen"          "Very likely, Tsai Ing-wen"            "Very likely, Tsai Ing-wen"            
# "Likely voted, Tsai Ing-wen"           "Likely voted, Tsai Ing-wen"           "Highly likely, Tsai Ing-wen"          "I likely voted, Tsai Ing-wen."        "I likely voted, Tsai Ing-wen"        
# "Very likely, Tsai Ing-wen"            "Likely voted, Tsai Ing-wen"           "Very likely, Tsai Ing-wen"            "Very likely, Tsai Ing-wen"            "Very likely voted, 

## with temperature 1

completion_1_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                                   , prompt_content_var = zehn_prompts_Example$prompt
                                   , id_var = zehn_prompts_Example$prompt_id
                                   , param_max_tokens = 50
                                   , param_n = 5
                                   , param_temperature = 1)

completion_1_zehn_prompts[[1]]$gpt_content

# "likely voted, candidate indeterminable."         "Likely voted; Tsai Ing-wen"                      "Likely voted, Tsai Ing-wen"                      "Likely voted, Tsai Ing-wen"                      "Likely voted, Tsai Ing-wen"                      
# "Likely voted, James Soong"                       "I likely voted, most likely for James Soong."    "likely voted, Han Kuo-yu"                        "Likely voted, James Soong"                       "Likely voted, James Soong"                      
# "You likely voted, Tsai Ing-wen."                 "You likely voted, most likely for Tsai Ing-wen." "Likely to vote, Tsai Ing-wen"                    "Highly likely; Tsai Ing-wen"                     "Likely voted, Tsai Ing-wen"                      
# "Likely didn't vote."                             "Unlikely, None"                                  "unlikely, Tsai Ing-wen"                          "I likely voted, Han Kuo-yu."                     "Unlikely, None"                                 
# "I likely voted, Tsai Ing-wen."                   "Likely voted, Tsai Ing-wen"                      "You likely voted, Tsai Ing-wen."                 "Likely voted, Tsai Ing-wen"                      "I likely voted, Tsai Ing-wen."                   
# "Likely voted, Tsai Ing-wen"                      "I likely voted, Tsai Ing-wen."                   "I likely voted, Tsai Ing-wen."                   "I likely voted, Tsai Ing-wen."                   "Likely voted, Tsai Ing-wen"                     
# "Very likely, Tsai Ing-wen"                       "Very likely, Tsai Ing-wen"                       "Highly likely, Tsai Ing-wen"                     "Very likely to vote, Tsai Ing-wen"               "Highly likely, Tsai Ing-wen"                     
# "Very likely voted, Tsai Ing-wen"                 "Very likely, Tsai Ing-wen"                       "Very likely, Tsai Ing-wen"                       "Very likely, Tsai Ing-wen"                       "Highly likely, Tsai Ing-wen."                   
# "I likely voted, Tsai Ing-wen."                   "I likely voted, Tsai Ing-wen."                   "I likely voted, Tsai Ing-wen"                    "I likely voted, Tsai Ing-wen."                   "I likely voted, Tsai Ing-wen."                   
# "Very likely, Tsai Ing-wen"                       "Very likely, Tsai Ing-wen"                       "Very likely, Tsai Ing-wen"                       "Very likely, Tsai Ing-wen"                       "Very likely, Tsai Ing-wen" 

## with temperature 0.95

completion_0.95_zehn_prompts = rgpt(prompt_role_var = zehn_prompts_Example$prompts_roles
                                 , prompt_content_var = zehn_prompts_Example$prompt
                                 , id_var = zehn_prompts_Example$prompt_id
                                 , param_max_tokens = 50
                                 , param_n = 5
                                 , param_temperature = 0.95)

completion_0.95_zehn_prompts[[1]]$gpt_content

# "I likely voted, candidate unclear."                  "Likely voted, Tsai Ing-wen"                          "I likely voted, Tsai Ing-wen."                       "Likely voted, Tsai Ing-wen."                         "I likely voted, Tsai Ing-wen."                       
# "Likely voted, James Soong"                           "Likely voted, James Soong"                           "You likely voted, most likely for James Soong."      "Likely voted, James Soong"                           "Likely voted, James Soong"                          
# "You likely voted, Tsai Ing-wen."                     "Likely voted, Tsai Ing-wen"                          "I likely voted, Tsai Ing-wen."                       "Likely voted, Tsai Ing-wen."                         "Likely voted, Tsai Ing-wen"                          
# "I likely voted, Han Kuo-yu."                         "I probably did not vote."                            "I likely did not vote."                              "Unlikely, none."                                     "I likely voted, Han Kuo-yu."                        
# "I likely voted. Most likely voted for Tsai Ing-wen." "Likely voted, Tsai Ing-wen"                          "unlikely voted, but if voted, Tsai Ing-wen."         "I likely voted, Tsai Ing-wen."                       "I likely voted, Tsai Ing-wen."                       
# "Highly likely, Tsai Ing-wen"                         "Likely voted; Tsai Ing-wen"                          "Likely voted, Tsai Ing-wen"                          "Likely voted, Tsai Ing-wen"                          "Likely voted, Tsai Ing-wen"                         
# "I likely voted, Tsai Ing-wen."                       "Very likely, Tsai Ing-wen"                           "Likely voted, Tsai Ing-wen"                          "Highly likely, Tsai Ing-wen"                         "I likely voted, Tsai Ing-wen."                       
# "Very likely, Tsai Ing-wen"                           "Very likely, Tsai Ing-wen"                           "Highly likely, Tsai Ing-wen"                         "Very likely, Tsai Ing-wen"                           "Very likely, Tsai Ing-wen"                          
# "I likely voted for Tsai Ing-wen."                    "Very likely, Tsai Ing-wen"                           "Likely voted, Tsai Ing-wen"                          "Likely voted, Tsai Ing-wen"                          "I likely voted; Tsai Ing-wen."                       
# "Very likely, Tsai Ing-wen"                           "Highly likely, Tsai Ing-wen"                         "Very likely, Tsai Ing-wen"                           "Highly likely, Tsai Ing-wen"                         "Very likely, Tsai Ing-wen"                          
