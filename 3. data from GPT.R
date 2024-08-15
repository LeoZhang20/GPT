# English

load("~/prompts_df.Rdata")

nested_tables <- prompts_df[[4]]

extract_message_content <- function(nested_table) {
  return(nested_table$message.content)
}

all_message_contents <- lapply(nested_tables, extract_message_content)

all_message_contents_flat <- unlist(all_message_contents)

print(all_message_contents_flat)

# Chinese in mainland

load("~/mainland_prompts.Rdata")

nested_tables_cn <- mainland_prompts[[4]]

extract_message_content_cn <- function(nested_table_cn) {
  return(nested_table_cn$message.content)
}

all_message_contents_cn <- lapply(nested_tables_cn, extract_message_content_cn)

all_message_contents_flat_cn <- unlist(all_message_contents_cn)

print(all_message_contents_flat_cn)

# Chinese in Taiwan

## Temperature 0,5

load("~/taiwan_prompts_05.Rdata")

nested_tables_tw_05 <- taiwan_prompts$json_temp_05

extract_message_content_tw_05 <- function(nested_table_tw_05) {
  return(nested_table_tw_05$message.content)
}

all_message_contents_tw_05 <- lapply(nested_tables_tw_05, extract_message_content_tw_05)

all_message_contents_flat_tw_05 <- unlist(all_message_contents_tw_05)

print(all_message_contents_flat_tw_05)

## Temperature 0,9

load("~/taiwan_prompts_09.Rdata")

nested_tables_tw_09 <- taiwan_prompts$json_temp_09

extract_message_content_tw_09 <- function(nested_table_tw_09) {
  return(nested_table_tw_09$message.content)
}

all_message_contents_tw_09 <- lapply(nested_tables_tw_05, extract_message_content_tw_09)

all_message_contents_flat_tw_09 <- unlist(all_message_contents_tw_09)

print(all_message_contents_flat_tw_09)

## Temperature 1

load("~/taiwan_prompts_10.Rdata")

nested_tables_tw_10 <- taiwan_prompts$json_temp_10

extract_message_content_tw_10 <- function(nested_table_tw_10) {
  return(nested_table_tw_10$message.content)
}

all_message_contents_tw_10 <- lapply(nested_tables_tw_10, extract_message_content_tw_10)

all_message_contents_flat_tw_10 <- unlist(all_message_contents_tw_10)

print(all_message_contents_flat_tw_10)
