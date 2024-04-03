#bibliotecas usadas
library(psych)

#Formação da base de dados
bdCompleto <- read.table("DadosBrutos.txt", header = TRUE, stringsAsFactors = FALSE)
bdTBC <- read.table("TBCdata.txt", header = TRUE, stringsAsFactors = FALSE)

#Alpha
alpha(bdTBC)

#Teste de normalidade para a média dos dados (REFEITO - 14/08/18)
shapiro.test(bdCompleto$MediaIRAP)

#One-sample T-test para a média dos dados (REFEITO - 14/08/18)
t.test(bdCompleto$MediaIRAP)

#Teste de normalidade para BP-CP (REFEITO - 14/08/18)
shapiro.test(bdCompleto$BP.CP)

#One-sample T-test para BP-CP (REFEITO - 14/08/18)
t.test(bdCompleto$BP.CP)

#Teste de normalidade para BP-CN (REFEITO - 14/08/18)
shapiro.test(bdCompleto$BP.CN)

#One-sample T-test para BP-CN (REFEITO - 14/08/18)
t.test(bdCompleto$BP.CN)

#Teste de normalidade para MP-CP (REFEITO - 14/08/18)
shapiro.test(bdCompleto$MP.CP)

#One-sample T-test para MP-CP (REFEITO - 14/08/18)
t.test(bdCompleto$MP.CP)
wilcox.test(bdCompleto$MP.CP)

#Teste de normalidade para MP-CN (REFEITO - 14/08/18)
shapiro.test(bdCompleto$MP.CN)

#One-sample T-test para MP-CN (REFEITO - 14/08/18)
t.test(bdCompleto$MP.CN)

#Comparação de blocos consistentes e inconsistentes
var(bdCon$MediaIRAP)
var(bdIncon$MediaIRAP)
var(bdCon$MediaIRAP)/var(bdIncon$MediaIRAP)
var.test(bdCon$MediaIRAP, bdIncon$MediaIRAP)

# (REFEITO - 14/08/18)
t.test(bdCon$MediaIRAP, bdIncon$MediaIRAP, var.equal = TRUE)

library(Rcmdr)

cor.test(bdCompleto$MediaIRAP, bdCompleto$EscoreMedio, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$BP.CP, bdCompleto$EscoreMedio, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$BP.CN, bdCompleto$EscoreMedio, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$MP.CP, bdCompleto$EscoreMedio, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$MP.CN, bdCompleto$EscoreMedio, alternative = "two.sided",
         method = "spearman")

cor.test(bdCompleto$BP.CP, bdCompleto$BP.CN, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$BP.CP, bdCompleto$MP.CP, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$BP.CP, bdCompleto$MP.CN, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$BP.CN, bdCompleto$MP.CP, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$BP.CN, bdCompleto$MP.CN, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$MP.CP, bdCompleto$MP.CN, alternative = "two.sided",
         method = "spearman")


#Testes adicionais, mas em nenhum deles o resultado teve magnitude acima de 0,2_
#e estatisticamente significativa
cor.test(bdCompleto$MP.CP, bdCompleto$Genero, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$MP.CP, bdCompleto$Idade, alternative = "two.sided",
         method = "spearman")
cor.test(bdCompleto$MP.CP, bdCompleto$AnoEntrada, alternative = "two.sided",
         method = "spearman")

#Testes com características dos participantes (REFEITO - 14/08/18)
bdCon <- read.table("DadosBrutos_C.txt", header = TRUE, stringsAsFactors = FALSE)
bdIncon <- read.table("DadosBrutos_I.txt", header = TRUE, stringsAsFactors = FALSE)

cor.test(bdCompleto$BP.CP, bdCompleto$BP.CN, alternative = "two.sided",
         method = "spearman")

#Anova
#Formação da base de dados
bdAnova <- read.table("DadosAnova.txt", header = TRUE, stringsAsFactors = FALSE)
anovaresults<-aov(Latencias~TipoTentativaSigla,data=bdAnova)
summary(anovaresults)

#Tamanho do efeito
SST<-var(bdAnova$Latencias)*(188-1)
eta<-sqrt(6.816/SST)

#Verificação dos pressupostos da ANOVA
shapiro.test(resid(anovaresults))
library(car)
leveneTest(Latencias~TipoTentativaSigla,data=bdAnova)

#Post-test
TukeyHSD(anovaresults)
boxplot(Latencias~TipoTentativaSigla,data=bdAnova)
