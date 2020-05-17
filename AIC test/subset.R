

subset <- function(x,y, i){
        
        ess %>%
                filter(yall == x & cntrytype == y) %>%
                mutate(subsets = i)
        
}

right_w <- subset(c(1:2), 1, "right_w")
left_w <- subset(c(1,3),1,"left_w")
ab_w <- subset(c(1,4),1,"ab_w")
right_cee <- subset(c(1:2), 2, "right_cee")
left_cee <- subset(c(1,3),2,"left_cee")
ab_cee <- subset(c(1,4),2,"ab_cee")

ess_double <- right_w %>%
        rbind(left_w,ab_w,right_cee,left_cee,ab_cee)

ess_double <- ess_double %>% drop_na()

rm(right_w,left_w,ab_w,right_cee,left_cee,ab_cee)