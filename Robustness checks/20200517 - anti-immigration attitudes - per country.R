# Packages ----
library(tidyverse)
library(haven)
library(broom)
library(nnet)

# files ----
ess7 <- haven::read_sav("ESS7M.sav")
ess8 <- haven::read_sav("ESS8M.sav")

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

## model function ----

cntry_model <- function(df){
        
        multinom(yall ~ pincome + 
                         education +
                         unemployed +
                         inrdstrbtn +
                         autsen +
                         ethreat +
                         nat_ptrust +
                         glo_ptrust +
                         age +
                         gender +
                         ethreat, data = df)
}

## Asthetics function ----

no_zero <- function(x) {
        y <- sprintf('%.1f',x)
        
        y
}

# Run the model on every country seperatly ----

ess_all_nest <- ess_all%>%
        group_by(cntry, cntrytype) %>%
        nest() %>%
        mutate(model = map(data, possibly(cntry_model, NA)),
               Tidy = map(model, ~ .x %>% 
                                  broom::tidy(conf.int=TRUE))) %>%
        unnest(Tidy) %>%
        filter(term %in% c("nat_ptrust"))


# Make plot showcasing the differences of the effect of anti-immigration attitudes on voting ----

ess_all_nest %>%
        ungroup %>%
        mutate(
                y.level = as_factor(y.level),
                estimate = log(estimate),
                conf.low = log(conf.low),
                conf.high = log(conf.high),
                z = estimate / std.error,
                p = (1 - pnorm(abs(z), 0, 1)) * 2
        ) %>%
        ggplot(aes(x = reorder(cntry, estimate),
                   y = estimate)) +
        geom_point(size = 0.05) +
        scale_y_continuous(labels = no_zero) +
        geom_pointrange(aes(ymin = conf.low,
                            ymax = conf.high)) +
        coord_flip() +
        facet_grid(cntrytype ~ y.level, scales = "free") +
        theme_bw() +
        labs(x = "Country", y = "Estimate [??] / Confidence interval [95%]") +
        theme(
                text = element_text(size = 18,  family = "Times New Roman"),
                plot.title = element_text(hjust = 0.5)
        )

## save the image ----

ggsave("conf_nat.png", dpi = 500)
