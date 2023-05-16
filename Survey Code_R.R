library(ggplot2)
library(scales)
library(tidyr)
library(dplyr)


data <- read.csv("Survey Responses.csv", encoding = "UTF-8")
head(data)

## DESCRIPTIVE STATISTICS GRAPHS
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
gender_age_income_education_status <- data.frame("Gender"= data$Gender, "Age"= data$Age, "Income"= data$Income, "Education_Level"= data$Education.status, "Relationship"= data$Relationship, "Work_Status"= data$Work.status, "Accomodation_Type"= data$Accommodation)
gender_age_income_education_status$facet <- paste(gender_age_income_education_status$Gender)

age_by_gender_graph <- ggplot(gender_age_income_education_status, aes(x= Age,  group=Gender)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(title= "Age Variety by Gender", x= "Age", y = "Percentage", fill="Age") +
  facet_wrap( ~ facet, scales = 'free_y') +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_discrete(labels = c("20 - 24", "25 - 30", "Over 30", "Under 19")) +
  theme_minimal() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        text = element_text(size = 20))

income_by_gender_graph <- ggplot(gender_age_income_education_status, aes(x= Income,  group=Gender)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(title= "Income Variety by Gender", x= "Income", y = "Percentage", fill="Income") +
  facet_wrap( ~ facet, scales = 'free_y') +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_discrete(labels = c("1001 TL - 2500 TL", "2501 TL - 4000 TL", "4001 TL - 5500 TL", "Less than 1000 TL","More than 5500 TL")) +
  theme_minimal() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        text = element_text(size = 15))

education_status_by_gender_graph <- ggplot(gender_age_income_education_status, aes(x= Education_Level,  group=Gender)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(title= "Education Status Variety by Gender", x= "Status", y = "Percentage", fill="Status") +
  facet_wrap( ~ facet, scales = 'free_y') +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_discrete(labels = c("Bachelor's Degree", "Master's Degree", "Preparation School")) +
  theme_minimal() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        text = element_text(size = 20))

relationship_status_by_gender_graph <- ggplot(gender_age_income_education_status, aes(x= Relationship,  group=Gender)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(title= "Relationship Status Variety by Gender", x= "Status", y = "Percentage", fill="Status") +
  facet_wrap( ~ facet, scales = 'free_y') +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_discrete(labels = c("In a relationship", "Married", "Single")) +
  theme_minimal() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        text = element_text(size = 20))

work_status_by_gender_graph <- ggplot(gender_age_income_education_status, aes(x= Work_Status,  group=Gender)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(title= "Work Status Variety by Gender", x= "Status", y = "Percentage", fill="Status") +
  facet_wrap( ~ facet, scales = 'free_y') +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_discrete(labels = c("Full-time", "Intern", "Not working", "Part-time")) +
  theme_minimal() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        text = element_text(size = 20))

accomodation_type_by_gender_graph <- ggplot(gender_age_income_education_status, aes(x= Accomodation_Type,  group=Gender)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(round(..prop..,3)),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(title= "Accommodation Type Variety by Gender", x= "Type", y = "Percentage", fill="Type") +
  facet_wrap( ~ facet, scales = 'free_y') +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_discrete(labels = c("College Dorm", "Family House", "House - Own", "House - Rent","Private Dorm","Student House")) +
  theme_minimal() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        text = element_text(size = 20))

## ONLINE PURCHASE BAR GRAPH
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
gender_online_purchase <- data.frame("gender"= data$Gender, "online_purchase"= data$Online.purchase)
gender_online_purchase$facet <- paste(gender_online_purchase$gender)

online_purchase_by_gender_graph <- ggplot(gender_online_purchase, aes(x= online_purchase,  group=gender)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(title= "Online Shopping Preferences by Gender", x= "Preference", y = "Percentage", fill="Do you purchase online?") +
  facet_wrap( ~ facet, scales = 'free_y') +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_discrete(labels = c("No", "Yes")) +
  theme_minimal() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        text = element_text(size = 20))

## MOSTLY PREFERRED AND NOT PREFERRED PRODUCTS
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

prefer_list <- strsplit(data$Mostly.prefered, split = ",")
not_prefer_list <- strsplit(data$Most.not.to.prefer, split = ",")

prefer <- as.data.frame(table(unlist(prefer_list)))
not_prefer <- as.data.frame(table(unlist(not_prefer_list)))


prefer_product_graph <- ggplot(prefer, aes(x = Var1, y = Freq)) + 
  geom_bar(stat = "identity", fill= "steelblue2") + 
  geom_text(aes(label = signif(Freq, digits = 3)), nudge_y = 6) +
  labs(title = "Preferred Products", x= "Product Type", y= "Frequency") + 
  theme_minimal() +
  coord_flip() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        text = element_text(size = 20))

not_prefer_products <- ggplot(not_prefer, aes(x = Var1, y = Freq)) + 
  geom_bar(stat = "identity", fill= "mediumpurple2") + 
  geom_text(aes(label = signif(Freq, digits = 3)), nudge_y = 4) +
  labs(title = "Not Preferred Products", x= "Product Type", y= "Frequency") + 
  theme_minimal() +
  coord_flip() +
  theme(title= element_text(face = "bold"),
        axis.title = element_text(face="bold"), 
        axis.text = element_text(face="bold"),
        text = element_text(size = 20))


## ANALYSIS PART
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#t-test  (Big/Small city)

city <- read.csv("city and freq.csv")

ftable(xtabs(~ city + freq, data = city))

#Is big city frequency mean is bigger than small city frequency mean?


group <- group_by(city, city) %>%
  summarise(
    count = n(),
    mean = mean(freq, na.rm = TRUE),
    sd = sd(freq, na.rm = TRUE)
  )

group <- as.data.frame(group)

write.csv(group, "citydf.csv", row.names=FALSE)

res <- t.test(freq ~ city, data = city)
res

#---------------------------------------------------

#Interval regression for income/city/freq

reg <- read.csv("city and freq.csv")

lapply(reg[, c("city", "income", "freq")], table)

ft <- ftable(xtabs(~ city + income + freq, data = reg))

reg$city <- as.factor(reg$city)

reg$freq <- as.factor(reg$freq)

m <- polr(freq ~ city + income, data = reg, Hess=TRUE)


reg$freq <- as.factor(reg$freq)

summary(m)

ctable <- coef(summary(m))

## calculate and store p values
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2

## combined table
(ctable <- cbind(ctable, "p value" = p))

#-------------------------------------------------------------
#install.packages("likert")
#install.packages('HH')
library(likert)
library(HH)
likertpercent <- read.csv("likert_percent.csv")

HH::likert(Qs ~ ., likertpercent, main="How important are these factors for users?", 
           xlab="PERCENTAGE",
           ylab="LIKERT QUESTIONS",
           scales = list(y = list(cex = 1.1), x = list(cex = 1.2)))

#--------------------------------------------------------

crost <- read.csv("survey copy editted.csv")


ct <- addmargins(table(crost$Income, crost$Decision.support.systems))

write.csv(ct, "ct.csv", row.names = F)

