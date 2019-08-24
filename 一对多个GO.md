{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "name": "一多个GO .md",
      "version": "0.3.2",
      "provenance": [],
      "collapsed_sections": [],
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/Yixiangzhang1996/2019Bio.Script.Test/blob/master/%E4%B8%80%E5%AF%B9%E5%A4%9A%E4%B8%AAGO.md\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "t7iTJy_bNGTp",
        "colab_type": "code",
        "colab": {}
      },
      "source": [
        ""
      ],
      "execution_count": 0,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "-m0odJxGNIBj",
        "colab_type": "text"
      },
      "source": [
        "转换一个基因对应的多个GO ID的处理方式\n",
        "\n",
        "```\n",
        "rm(list = ls())\n",
        "GO_test <- read.table(file.choose(),sep = \"\\t\" ,header = F)\n",
        "# GO_test <- read.table(”1.txt“,sep = \"\\t\" ,header = F)\n",
        "\n",
        "> 1、 得到包含list中个数的数据框\n",
        "## 添加第二列中每一行所含有的个数\n",
        "GO_list <- strsplit(as.vector(GO_test$V2),\" \") ## 将第二列的字符串按空格切割变成list\n",
        "\n",
        "length(GO_list[[1]])  ## 查看第一个list中的个数\n",
        "GO_length <- c()  ## 创建一个空的向量\n",
        "  \n",
        "for (i in 1:length(GO_list)) {\n",
        "    GO_length[i] <- length(GO_list[[i]])\n",
        "}   ## 计算出每一个list的长度\n",
        "\n",
        "GO_test$length <- GO_length ## 将长度添加到GO_test表中\n",
        "\n",
        "> 2、\n",
        "times <- as.numeric(GO_test$length)\n",
        "gene_ID <- rep( as.vector(GO_test[,1]),times) #得到gene ID\n",
        "GO_ID<- data.frame(matrix(unlist(GO_list), byrow=T),stringsAsFactors=FALSE) ##得到GO号\n",
        "data.frame(gene_ID = gene_ID,GO_ID = GO_ID) -> gene_GO_ID # 合并\n",
        "\n",
        "> 3、\n",
        "colnames(gene_GO_ID) <- c(\"gene_ID\",\"GO_ID\")\n",
        "\n",
        "```"
      ]
    }
  ]
}