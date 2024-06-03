# gpt in Chinese (Taiwan)

rgpt_authenticate("H:/Bachelorarbeit/access_key1.txt")

taiwan_prompts <- data.frame(
  prompts_roles = rep("user", 1472), 
  prompt_id = complete_dataT$id,
  prompt = taiwan_result_clean)

gpt_taiwan = rgpt(prompt_role_var = taiwan_prompts$prompts_roles
                    , prompt_content_var = taiwan_prompts$prompt
                    , id_var = taiwan_prompts$prompt_id
                    , param_max_tokens = 30
                    , param_n = 5
                    , param_temperature = 0.99)
