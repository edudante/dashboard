###############################################################################
#                         LOAD PACKAGES AND MODULES                          #
###############################################################################
options(rsconnect.locale.cache = FALSE, rsconnect.locale = "pt_BR.UTF-8")
Sys.setlocale(category = "LC_ALL", locale = "Portuguese")


library(shiny)
library(shinydashboard)
library(dplyr)
library(leaflet)
library(ggplot2)
library(tidyverse)
library(DT)
library(plotly)
library(purrr)
library(glue)
library(rhandsontable)
library(tidyr)
library(shinyalert)
library(shinyjs)
library(supercaliheatmapwidget)
library(lubridate)
library(vistime)
library(timevis)
library(rmarkdown)
library(REDCapR)



###############################################################################
#                               LOAD DATA                                     #
###############################################################################


# raw_data_time$day <- dmy(raw_data_time$day)
uri='https://redcap.idpc.org.br/redcap/api/'
token = '097E528DEBEA174EDBDAE6B149638441'
  
#saveRDS(raw_data_projects,"Projects.rds")


set <- redcap_read_oneshot(redcap_uri = uri, token = token, raw_or_label = 'label')$data


raw <- readRDS("Projects.rds")
raw_data_projects <-redcap_read_oneshot(redcap_uri = uri, token = token, raw_or_label = 'raw')$data


raw_data_projects <- raw_data_projects %>% 
  rename(PROJECT.NAME = acron_projeto) %>% 
  rename(PAF_PCR_NUMBER = pi_name) %>% 
  rename(PROJECT.NUMBER = protocolo) %>% 
  rename(PROJECT.STARTE.DATE = incl_date) %>% 
  rename(PROJECT.END.DATE = inc_last_pt) %>% 
  rename(BUDGET = valor_est_orc) %>% 
  rename(PROJECT.TYPE = redcap_event_name) %>% 
  rename(PROJECT.STATUS = fase_pesqclin) %>% 
  rename(COMPLEXITY = centro_tipo) %>% 
  rename(AUDIT = setor)


#raw_data_projects <- raw_data_projects %>% 
  #filter(is.na(redcap_repeat_instrument) & redcap_event_name == "Submissão Regulatória")

#Encoding(raw_data_projects) <- "UTF-8"

raw_data_tasks <- readRDS("Tasks.rds")
   
