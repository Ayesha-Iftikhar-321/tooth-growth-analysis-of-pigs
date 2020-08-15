#1. Load neccessary dataset and libraaries 

#loads the library using library()
library(ggplot2) 
data(ToothGrowth) #data() loads the dataset of toothgrowth which is already available in R 

#2. basic summay and structurrre of dataset

head(ToothGrowth) # head() displays head of dataset
str(ToothGrowth) #str(): tells overall structure of dataset
summary(ToothGrowth) #summary(): gives the summay of the complete dataset
dim(ToothGrowth) #dim(): tells the dimension of dataset_ number of rows and columns


#3. Basic exploratory Analysis
g<- ggplot(data=ToothGrowth, aes(x=paste(supp,dose), y=len, fill=factor(dose)))
g<- g+geom_boxplot()
g<- g+labs(title="Tooth growth of 60 guinea pigs by dosage and delivery method of vitamin C",x="Dose in milligrams/day",y="Tooth Length")
g<-g+ scale_fill_discrete(name="doasage_type")
g<- g+theme(plot.title=element_text(hjust=0.5))
print(g)

#4. Data manipulation to separate data by dosage
data_0.5<- subset(ToothGrowth, dose==0.5)
data_1<- subset(ToothGrowth, dose==1)
data_2<- subset(ToothGrowth, dose==2)

#5.Performing T test to Accept or Reject Hypothesis
t1<- t.test(len~supp, data=data_0.5)
t2<-t.test(len~supp, data=data_1)
t3<-t.test(len~supp, data=data_2)

#6. Creating DataFrame to analyze the result
Conclusion<-data.frame("p-value"=c(t1$p.value,t2$p.value,t3$p.value),
                       "Low-Confidence"=c(t1$conf.int[1],t2$conf.int[1],t3$conf.int[1]),
                       "High-Confidence"=c(t1$conf.int[2],t2$conf.int[2],t3$conf.int[2]),
                       "OJ mean" = c(t1$estimate[1],t2$estimate[1],t3$estimate[1]),
                       "VC mean" = c(t1$estimate[2],t2$estimate[2],t3$estimate[2]),
                       row.names = c("Dosage_.5","Dosage_1","Dosage_2"))

Conclusion

