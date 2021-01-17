# Tooth Growth Analysis of Pigs

*In this project, we are going to analyize the tooth growth of pigs by using statistical inferences.*
- We have used the sample dataset of 60 guinea pigs which is  available in R lanaguage's sample datasets, but you can use your custom dataset for this purpose.

### About Dataset
The dataset contaions the data of tooth growth by giving Vitamin c (VC) and orange juice (OJ). On the basis of three different dosage quantities _i.e._ 0.5mg, 1mg, 2mg.

## Execuation Guide
1. Install R language
2. Install R studio
3. Download and install the _ggplot2_ library.

```
 install.packages("ggplot2")
```
4. You are all set. Now, run the project in R studio.

## WorkFlow of the Project Script
 ### 1. Load Dataset and Neccessary Libararies
 ```
 library(ggplot2)
 data(ToothGrowth)
 ```
 ### 2. Basic Summary and Structure of Dataset
 ```
 head(ToothGrowth)
 str(ToothGrowth)
 summary(ToothGrowth)
 dim(ToothGrowth)
 
 ```
 ### 3. Basic Exploratory Analysis
 ```
 g<- ggplot(data=ToothGrowth, aes(x=paste(supp,dose) , y=len, fill=factor(dose)))
 g<- g+geom_boxplot() 
 g<- g+labs(title = "Tooth growth of 60 guinea pigs by dosage and delivery method of vitamin C", x = "Dose in milligrams/day", y = "Tooth Lengh")
 g<- g+ scale_fill_discrete(name="dosage type")
 g<- g+theme(plot.title = element_text(hjust = 0.5))
 print(g)
 ```
 ![Basic Exploratory Analysis](https://imgur.com/PiJPdWs.png)
 ### 4. Data Manipulation to Separated Data by Dosage
 ```
 data_0.5<-subset(ToothGrowth, dose==0.5)
 data_1<-subset(ToothGrowth, dose==1)
 data_2<-subset(ToothGrowth, dose==2)
 ```
 ### 5. Performing T-test to Accept or Reject Hypothesis
 ```
 t1<-t.test(len~supp, data=data_0.5)
 t2<-t.test(len~supp, data=data_1)
 t3<-t.test(len~supp, data=data_2)
 ```
 ### 6. Creating Dataframes to Analyize the Results
 ```
Conclusion<-data.frame("p-value"=c(t1$p.value,t2$p.value,t3$p.value),
                       "Low-Confidence"=c(t1$conf.int[1],t2$conf.int[1],t3$conf.int[1]),
                       "High-Confidence"=c(t1$conf.int[2],t2$conf.int[2],t3$conf.int[2]),
                       "OJ mean" = c(t1$estimate[1],t2$estimate[1],t3$estimate[1]),
                       "VC mean" = c(t1$estimate[2],t2$estimate[2],t3$estimate[2]),
                       row.names = c("Dosage_.5","Dosage_1","Dosage_2"))

Conclusion
 ```
 ### 7. Conclusion
 - Since P value for dosage 0.5 and 1 are less than threshold value (0.5), we reject the null hypothesis which states that there is no relation between tooth growth and supplement method for 0.5 and 1mg dose.
 - Since P value for dosage 2mg is greater than threshold value (0.5), we accept the null hypothesis which states that there is no relation between tooth growth and supplement method for 2mg dose.
 - From datafarme last 2 columns, it is concluded that OJ provides more growth than VC when dosage is 0.5mg or 1mg.
 





      
## Let's Connect
[![Ayesha Iftikharr](https://img.shields.io/badge/Ayesha_Iftikharr-000000?logo=opsgenie&logoColor=ffffff)](https://ayeshaiftikhar.github.io) [![Github](https://img.shields.io/badge/Github-Follow-211F1F?logo=GitHub&logoColor=ffffff)](https://github.com/AyeshaIftikhar/) [![Linkedin](https://img.shields.io/badge/Linkedin-Connect-0077B5?logo=Linkedin&logoColor=ffffff)](https://www.linkedin.com/in/seayeshaiftikhar/)  [![Facebook](https://img.shields.io/badge/Facebook-1877F2?logo=Facebook&logoColor=ffffff)](https://www.facebook.com/seayeshaiftikhar/) [![Twitter](https://img.shields.io/badge/Twitter-Follow-08A0E9?logo=Twitter&logoColor=ffffff)](https://www.twitter.com/seaishaiftikhar/) [![Instagram](https://img.shields.io/badge/Instagram-Follow-DD2A7B?logo=Instagram&logoColor=ffffff)](https://www.instagram.com/seayeshaiftikhar/) [![Youtube](https://img.shields.io/badge/Youtube-Subscribe-FF0000?logo=Youtube&logoColor=ffffff)](https://www.youtube.com/channel/UCUI0fN6xPUT3SfGLfh8B9Lg) [![Medium](https://img.shields.io/badge/Medium-Follow-0077B5?logo=Medium&logoColor=ffffff)](https://www.medium.com/@seayeshaiftikhar) [![StackOverflow](https://img.shields.io/badge/Stackoverflow-211F1F?logo=stackoverflow&logoColor=ffffff)](https://stackoverflow.com/users/9611960/ayesha-iftikhar) [![Gmail](https://img.shields.io/badge/Gmail-D44638?logo=gmail&logoColor=ffffff)](mailto:seayeshaiftikharl@gmail.com) [![Messenger](https://img.shields.io/badge/Chat-1877F2?logo=Messenger&logoColor=ffffff)](https://m.me/seayeshaiftikhar/) [![WhatsApp](https://img.shields.io/badge/Chat-25D366?logo=WhatsApp&logoColor=ffffff)](https://wa.me/923137128036?text=%23Github) 

