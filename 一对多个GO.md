## 借用一个例子 https://zhuanlan.zhihu.com/p/27792447

rm(list = ls())
GO_test <- read.table(file.choose(),sep = "\t" ,header = F)
# GO_test <- read.table(”1.txt“,sep = "\t" ,header = F)

> 1、 得到包含list中个数的数据框
## 添加第二列中每一行所含有的个数
GO_list <- strsplit(as.vector(GO_test$V2)," ") ## 将第二列的字符串按空格切割变成list

length(GO_list[[1]])  ## 查看第一个list中的个数
GO_length <- c()  ## 创建一个空的向量
  
for (i in 1:length(GO_list)) {
    GO_length[i] <- length(GO_list[[i]])
}   ## 计算出每一个list的长度

GO_test$length <- GO_length ## 将长度添加到GO_test表中

> 2、
times <- as.numeric(GO_test$length)
gene_ID <- rep( as.vector(GO_test[,1]),times) #得到gene ID
GO_ID<- data.frame(matrix(unlist(GO_list), byrow=T),stringsAsFactors=FALSE) ##得到GO号
data.frame(gene_ID = gene_ID,GO_ID = GO_ID) -> gene_GO_ID # 合并

> 3、
colnames(gene_GO_ID) <- c("gene_ID","GO_ID")
