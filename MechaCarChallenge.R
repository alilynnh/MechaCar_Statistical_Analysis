# DELIVERABLE 1

# load in dplyr
library(dplyr)

# import and read data
mecha_table <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)

# create linear regression
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_table)

# evaluate linear regression
summary(model)


# DELIVERABLE 2

# import and read data
sus_table <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors = F)

# total summary dataframe
total_summary <- sus_table %>% summarize(Mean=mean(PSI),
                                         Median=median(PSI),
                                         Variance=var(PSI),
                                         SD=sd(PSI),
                                         .groups = 'keep')

# lot summary
lot_summary <- sus_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),
                                                                       Median=median(PSI),
                                                                       Variance=var(PSI),
                                                                       SD=sd(PSI),
                                                                       .groups = 'keep')


# DELIVERABLE 3

# t-test across lots
t.test(sus_table$PSI, mu = 1500)

# individual lots
t.test(subset(sus_table, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)
t.test(subset(sus_table, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)
t.test(subset(sus_table, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)

