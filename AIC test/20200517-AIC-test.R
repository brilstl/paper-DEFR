## Load set up ----
source("setup.R")
## Load data ----
## the merge of ESS dataset wave 7 and 8 are used for this analysis (see the branches 'variable selection' and 'data joins')

ess <- haven::read_sav(<filename>)
## Check data ----
#glimpse(ess)
## subset ----
source("subset.R") ### Prepare data for multiple logistic regressions
## Nest Data ----
ess_nest <- ess_double %>%
        group_by(subsets) %>% ### the susbets contain far right and all other groups per area
        nest() %>%
        mutate(data = map(data, ~  ### the dv is set into a factor here
                                  .x %>% 
                                  mutate(yall = as_factor(yall),
                                         yall = fct_drop(yall))))

ess_recipe <- ess %>%
        drop_na() %>%
        recipe(yall ~ ethreat + autsen + pincome + education + unemployed + inrdstrbtn + nat_ptrust + glo_ptrust) %>%
        step_corr(all_predictors(), threshold = .6) %>%
        prep()

ess_recipe

##Testing ----

source("models.R") ### the models for the different theories are stored here

models_tidy <- ess_nest %>%
        mutate(test= map(data, test_model), ## test model
               cultural = map(data, cultural_model), ## Cultural blacklash model
               economic = map(data, economic_model), ## Economic grievance model
               politic = map(data, political_model), ## Protest vote model
               total = map(data, total_model) ## Total model
        ) %>%
        mutate(test_tidy = map(test, broom.mixed::tidy), ## tidy stores it in an data frame
               cultural_tidy = map(cultural, broom.mixed::tidy),
               economic_tidy = map(economic, broom.mixed::tidy),
               politic_tidy = map(politic, broom.mixed::tidy),
               total_tidy = map(total, broom.mixed::tidy)) %>%
        mutate(test_glance = map(test, broom.mixed::glance),
               cultural_glance = map(cultural, broom.mixed::glance), ## glance stores the AIC in a data frame
               economic_glance = map(economic, broom.mixed::glance),
               politic_glance = map(politic, broom.mixed::glance),
               total_glance = map(total, broom.mixed::glance))

AIC_check <- models_tidy %>% ## this unnests the AIC to do a check
        select(ends_with("glance")) %>%
        filter(!subsets %in% grepl("total", subsets)) %>%
        mutate(AIC_test = map_dbl(test_glance, ~.$AIC),
               AIC_cultural = map_dbl(cultural_glance, ~.$AIC),
               AIC_economic = map_dbl(economic_glance, ~.$AIC),
               AIC_politic = map_dbl(politic_glance, ~.$AIC),
               AIC_total = map_dbl(total_glance, ~.$AIC))

AIC <- AIC_check %>% ## here the check is visualised
        select(starts_with("AIC")) %>%
        ungroup %>%
        mutate(region = replace(subsets, grepl("_w", subsets), "Western European"),
               region = replace(region, grepl("_cee", subsets), "Post-communist europe"),
               family = replace(subsets, grepl("ab_", subsets), "abstainers"),
               family = replace(family, grepl("left_", subsets), "left-wing"),
               family = replace(family, grepl("right_", subsets), "centre-right")) %>%
        ungroup %>%
        pivot_longer(
                cols = AIC_test:AIC_total,
                values_to = "count"
        ) %>%
        ggplot(aes(x = fct_reorder(name, -count), y = count, label = format(count, big.mark = ",", digits=2))) +
        geom_bar(stat = 'identity') +
        geom_text(position = position_stack(vjust = 0.5),
                  size = 3.5) +
        scale_y_continuous(labels = scales::number_format(big.mark = ",")) +
        facet_grid(family~region, scales = "free_x") +
        coord_flip() +
        theme_bw() +
        scale_x_discrete(labels = rev(c("Total model", "Cultural backlash", "Protest vote", "Economic grievance", "Constant model"))) +
        labs(x = "Theory comparison", y = "Akaike$B!G(Bs information criterion (AIC)") +
        theme(text = element_text(family = "Times", color = "Grey20"))

AIC