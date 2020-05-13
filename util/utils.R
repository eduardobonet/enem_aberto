create.db.connection <- function(config_file = "config.json") {
  
  drv <- DBI::dbDriver("PostgreSQL")
  
  conf <- rjson::fromJSON(file=config_file)
  
  return(
    DBI::dbConnect(
      drv, 
      dbname = conf$DB_NAME,
      host = conf$DB_HOST, 
      port = conf$DB_PORT,
      user = conf$DB_USER, 
      password = { conf$DB_PASSWORD }
    )
  )
}

query.with.cache <- function(conn, query, file.name) {
  if (file.exists(file.name)) {
    return(read.csv2(file.name, sep=","))
  }
  
  result <- DBI::dbGetQuery(conn, query)
  
  write.csv2(result, sep=",", row.names = FALSE)
  
  return(result)
}


number.of.correct.questions <- function(data) {
  library(dplyr)
  return(
    data %>%
      mutate_each(data, ~strsplit(., ""), 
                  c(tx_respostas_cn,tx_respostas_ch,tx_respostas_lc,tx_respostas_mt, 
                    tx_gabarito_cn, tx_gabarito_ch, tx_gabarito_lc, tx_gabarito_mt)) %>%
      mutate(
        tx_corretas_cn = purrr::map2_chr(tx_respostas_cn, tx_gabarito_cn, ~paste0((.x == .y)*1, collapse = "")),
        tx_corretas_ch = purrr::map2_chr(tx_respostas_ch, tx_gabarito_ch, ~paste0((.x == .y)*1, collapse = "")),
        tx_corretas_lc = purrr::map2_chr(tx_respostas_lc, tx_gabarito_lc, ~paste0((.x == .y)*1, collapse = "")),
        tx_corretas_mt = purrr::map2_chr(tx_respostas_mt, tx_gabarito_mt, ~paste0((.x == .y)*1, collapse = "")),
        n_corretas_cn = purrr::map2_int(tx_respostas_cn, tx_gabarito_cn, ~sum((.x == .y))),
        n_corretas_ch = purrr::map2_int(tx_respostas_ch, tx_gabarito_ch, ~sum((.x == .y))),
        n_corretas_lc = purrr::map2_int(tx_respostas_lc, tx_gabarito_lc, ~sum((.x == .y))),
        n_corretas_mt = purrr::map2_int(tx_respostas_mt, tx_gabarito_mt, ~sum((.x == .y)))
      )
  )
}