library(dplyr)
library(Hmisc)
brfssdata=read.csv("https://github.com/cazvan/599B_Final/raw/master/brfss.csv")
dfmelt=brfssdata%>%
  select(year, stab, mental, ex2014)%>%
  filter(stab %nin% bad)%>%
  filter(!is.na(ex2014))%>%
  group_by(year,ex2014)%>% 
  mutate(mentavg=mean(mental, na.rm = TRUE))%>%
  ungroup()%>%
  select(year, ex2014,mentavg)%>%
  unique()%>%
  mutate(ex2014=ifelse(ex2014==0, "No Expansion", "Expansion"))

