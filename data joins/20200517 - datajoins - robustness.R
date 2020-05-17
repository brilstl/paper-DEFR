## pacakges ----
library(tidyverse)
library(haven)

# files ----
## these files are constructed in the branche 'variable selection'
ess7 <- haven::read_sav(<ESS7>)
ess8 <- haven::read_sav(<ESS8>)

# Rename Polisch voting variable ----
ess7 <- ess7 %>%
        rename(prtvtdpl  = prtvtcpl)

names(ess7) %in% names(ess8)

## join ess round 7 and 8 ----

ess_join <- function(region){
        
        ess7 %>%
                rbind(ess8) %>%
                mutate(
                        yall = as_factor(yall),
                        cntrytype = as_factor(cntrytype),
                        cntry = as_factor(cntry)
                ) %>%
                select(-prtvtdpl,
                       -prtvtehu) %>%
                filter(cntrytype %in% region) %>%
                zap_labels() %>%
                drop_na() %>%
                mutate_if(is.factor, 
                          fct_drop)
        
}

ESS78DESPRN_com <- ess_join("Post-communist democracies")

ESS78DESPRN_mat <- ess_join("Mature democracies")

## join the two ess rounds ----
ess_all <- ess7 %>%
        rbind(ess8) %>%
        mutate(yall = as_factor(yall),
               cntrytype = as_factor(cntrytype),
               cntry = as_factor(cntry)) %>%
        select(-prtvtdpl,
               -prtvtehu) %>%
        drop_na() %>%
        mutate_if(is.factor, fct_drop)

# Bind two waves for robustness check (post communist only) ----
ESS78DESPR_rob <- ## prtvtdpl = 6[PiS] yall = 2 | prtvtehu = 1 [Fidesz] yall =2
        ess7 %>%
        rbind(ess8) %>%
        mutate(yall = as_factor(yall),
               cntrytype = as_factor(cntrytype),
               cntry = as_factor(cntry)) %>%
        filter(cntrytype %in% c("Post-communist democracies")) %>%
        zap_labels() %>%
        mutate(
                yall = as_factor(case_when(
                        prtvtdpl == 6 | prtvtehu == 1 ~ "Centre right",
                        TRUE  ~ as.character(yall)))) %>%
        select(-prtvtdpl,
               -prtvtehu) %>%
        drop_na() %>%
        mutate_if(is.factor, fct_drop)

# Write dta documents ----
setwd("..")
dir.create("./datasets")
haven::write_dta(ESS78DESPRN_mat, "./new/ESS78DESPRN_mat.dta")
haven::write_dta(ESS78DESPRN_com, "./new/ESS78DESPRN_com.dta")
haven::write_dta(ESS78DESPR_rob, "./new/ESS78DESPR_rob.dta")