# gpt in English

rgpt_authenticate("H:/Bachelorarbeit/access_key1.txt")

prompts_df <- data.frame(
  prompts_roles = rep("user", 1472), 
  prompt_id = complete_dataE$id,
  prompt = question)

gpt_english = rgpt(prompt_role_var = prompts_df$prompts_roles
                   , prompt_content_var = prompts_df$prompt
                   , id_var = prompts_df$prompt_id
                   , param_max_tokens = 30
                   , param_n = 5
                   , param_temperature = 0.99)
