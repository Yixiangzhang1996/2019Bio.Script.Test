##20190819
##Apply函数
##ZYX
##############
##任务一把Chr1上的Gene1的
#creat data
options(stringsAsFactors = F)
set.seed(4)
df = data.frame(s1=sample(c("+","-"),80,replace = T),
                s2=sample(c("+","-"),80,replace = T),
                s3=sample(c("+","-"),80,replace = T),
                Chromosome=sample(c("Chr1","Chr2"),80,replace = T),
                Gene=sample(c("Gene1","Gene2","Gene3","Gene4"),80,replace = T),
                Ontology=sample(c("Enzyme","GH","Oxygen","Dehydrosase"),80,replace = T),
                Type=sample(c("T1","T2","T3"),80,replace = T))
head(df)


#test data

test=as.character(df[1,]) 
test
#def function

pd = function(test){
  ifelse((test[1]=="+")&(test[2]=="+")&(test[3]=="+"),
         "B",
         ifelse(((test[1]=="+")|(test[2]=="+"))&(test[3]=="-"),
                "A",
                ifelse((test[1]=="-")&(test[2]=="-")&(test[3]=="-"),
                       "TNBC","H")))
}
pd(test)
##Using apply
apply(df,1,pd)

##Add in dataframe

df$s4 <- apply(df,1,pd)
df$s5 <- sample(c(1:100),80,replace = F)
##################################################################
#桑基图
#install.packages("ggalluvial")
#library(ggalluvial)
library(ggplot2)
library(reshape2)
library(ggalluvial)
library(tidyverse)
head(df)
df<- df[,c(8,4,6)]
df$Chromosome <- as.factor(df$Chromosome)
ggplot(df,
       aes(x = Ontology, stratum = Chromosome, alluvium = s5,
           fill = Chromosome, label = Chromosome)) +
  scale_fill_brewer(type = "qual", palette = "Set2") +
  geom_flow(stat = "alluvium", lode.guidance = "rightleft",
            color = "darkgray") +
  geom_stratum() +
  theme(legend.position = "bottom") +
  ggtitle("test.sangG")
#####################################################

###Example
data(majors)
majors$curriculum <- as.factor(majors$curriculum)
ggplot(majors,
       aes(x = semester, stratum = curriculum, alluvium = student,
           fill = curriculum, label = curriculum)) +
  scale_fill_brewer(type = "qual", palette = "Set2") +
  geom_flow(stat = "alluvium", lode.guidance = "rightleft",
            color = "darkgray") +
  geom_stratum() +
  theme(legend.position = "bottom") +
  ggtitle("student curricula across several semesters
