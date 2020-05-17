# packages ----
library(tidyverse)
library(nnet)

# files ----

ess_all <-  haven::read_sav(ess_all.sav)

# prepoces ----

ess_all <- ess_all %>% 
        mutate_if(haven::is.labelled, as_factor) %>% 
        mutate(pincome = as.numeric(pincome),
               unemployed = as.numeric(unemployed),
               unemployed = case_when(
                       unemployed == 1 ~ 0,
                       unemployed == 2 ~ 1)) %>% 
        na.omit()

# model

test1 <- multinom(yall ~ cntrytype*(pincome + 
                          education +
                          unemployed +
                          inrdstrbtn +
                          autsen +
                          ethreat +
                          nat_ptrust +
                          glo_ptrust +
                          exefficacy +
                          age +
                          gender), data = ess_all)

## Predict tibble ----

dethreat <- data.frame(cntrytype = rep(c("Mature democracies", "Post-communist democracies")),
                       pincome = mean(MP$pincome),
                       education = mean(MP$education),
                       unemployed = mean(MP$unemployed),
                       inrdstrbtn = mean(MP$inrdstrbtn),
                       autsen = mean(MP$autsen),
                       nat_ptrust = mean(MP$nat_ptrust),
                       glo_ptrust = mean(MP$glo_ptrust),
                       exefficacy = mean(MP$exefficacy),
                       age = mean(MP$age),
                       gender = mean(MP$gender),
                       cntry = factor("", levels=c("Austria",
                                                   "Belgium",
                                                   "Switzerland",
                                                   "Czech Republic",
                                                   "Germany",
                                                   "Denmark",
                                                   "Estonia",
                                                   "Finland",
                                                   "France",
                                                   "United Kingdom",
                                                   "Hungary",
                                                   "Lithuania",
                                                   "Netherlands",
                                                   "Norway",
                                                   "Poland",
                                                   "Sweden",
                                                   "Slovenia")),
                       ethreat = rep(c(0:10),4))

# Predict probabilities ----

pre_prob <- predict(test1, newdata = dethreat, type = "probs", se = TRUE)

ppethreat <- dethreat %>% 
        bind_cols(pre_prob %>% 
                          as_tibble()) %>% 
        pivot_longer(`Populist right`:Abstainers)


# Plot prob ----

no_per <- function(x) {
        y <- sprintf('%.1f',x*100)
        
        glue::glue("{y}%")
}

ppethreat %>%
        mutate(name = fct_recode(name, 
                                     "Far right" = "Populist right",
                                     "Moderate right" = "Centre right",
                                     "Left-wing" = "Left-wing",
                                     "Abstainers" = "Abstainers")) %>%
        mutate(name = factor(name, levels = c("Far right", "Moderate right", "Left-wing", "Abstainers"), ordered =T)) %>% 
        ggplot(aes(x = ethreat, y = value, group = cntrytype)) +
        geom_line(aes(linetype =cntrytype)) + 
        theme_bw() +
        facet_wrap(name ~ ., scales = "free_y", ncol = 2) +
        scale_y_continuous(labels= no_per) +
        scale_linetype_manual(values=c("twodash", "dotted")) +
        theme(text = element_text(size = 15,  family = "Times New Roman"),
              legend.position = "bottom") +
        labs(linetype = "", 
             x = NULL,
             y = "Probability")

ggsave("interaction.png", dpi = 500)

