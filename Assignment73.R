library("ggplot2")

titanic <- read.csv("titanic.csv")
head(titanic)

# 1. Bar Chart

ggplot(titanic) + geom_bar(aes(x = Sex, fill= Sex)) + labs(title = 'Gender', x = 'Gender', y = 'Count')

Classes <- factor(titanic$Pclass)
levels(Classes) <- c('First class','Second class', 'Third class')
ggplot(titanic) + geom_bar(aes(x = Classes, fill= Classes)) + labs(title = 'Ticket Class', x = 'Ticket Class', y = 'Count')


survival <- factor(titanic$Survived)
levels(survival) <- c('No', 'Yes')

ggplot(titanic) + geom_bar(aes(x = survival, fill= survival)) + labs(title = 'Passenger Survival', x = 'Survived', y = 'Count')

#2. Histogram


library("RColorBrewer")
display.brewer.all(colorblindFriendly = TRUE)

colours<-brewer.pal(n = 12, name = 'Paired')
hist(titanic$Age,breaks=20,col=colours[2])

ggplot(titanic) + geom_boxplot(aes(x = Pclass, y =Age, fill = Classes))  + labs(title = 'Age per ticket class')



ggplot(titanic) + geom_boxplot(aes(x = survival, y =Age, fill = survival))  + labs(title = 'Age based on survival')
```
#3. Travel fare

colours<-brewer.pal(n = 12, name = 'Paired')
hist(titanic$Fare, xlim=c(0,350), col=colours[4])

library (dplyr)
titanic <-  titanic %>% 
  mutate(Payment = if_else(titanic$Fare <= 0, 'Free', 'Paid'))

titanic %>% 
  count(Payment)



