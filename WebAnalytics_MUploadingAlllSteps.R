library(knitr)
library(markdown)
library(rmarkdown)
library(stringr)

YearMon = format(Sys.Date(), "%Y-%m")
Sys.setenv(RSTUDIO_PANDOC = "C:\\Program Files\\RStudio\\bin\\pandoc")

####  1.small states
s_group_states = list(c("'UT','HI','RI','WV','AK','MT','WY','CT','NH','ND','LA','ME','OR'"), #13
                    c("'GA','SC','MI','NV','MA','WA','NJ','AZ'"), #8
                    c("'CO','MS','NM','IN'"),
                    c("'AL','NC','DE','NY'"),
                    c("'TN', 'VT', 'ID'"), 
                    c("'SD', 'AR', 'WI'"),
                    c("'CA', 'MD'"),
                    c("'IL', 'PA'"),
                    c("'MO', 'KY'"), 
                    c("'VA'"),#10th row, always has problem
                    c("'FL'"),
                    c("'MN'"),
                    c("'TX'"))

for(j in s_group_states){
  j_index = which(s_group_states ==j)
  print(j_index)
  print(j)
  tryCatch(
  rmarkdown:: render('C:\\Users\\tianyi.fang\\Documents\\Projects_Infinedi\\WebAnalytics_Phase1and2_Sstate.Rmd',
                     output_file = paste(YearMon, '_SStates_Group',j_index,'.docx', sep = '' ),
                     output_dir ='X:\\ITProjects\\Project Documentation\\Project\\InWork\\Analytic Web Portal - Starting Aug 2018\\Uploading Record')
  , error = function(e) {print(paste('Error and skip: ', YearMon, '_SStates_Group',j_index))})
  
}
#### 2.Large states
states = list("'IA'", "'KS'","'OH'", "'NE'")
split_states = list("'[A-D]'","'[E-H]'","'[I-Q]'","'[R-Z]'")
YearMon = format(Sys.Date(), "%Y-%m")

for(m in states){
  m_name = gsub("\'", "", noquote(m))
  print(m_name)
  for(n in split_states){
    n_index = as.numeric(which(split_states ==n))
    tryCatch(
    rmarkdown:: render('C:\\Users\\tianyi.fang\\Documents\\Projects_Infinedi\\WebAnalytics_Phase1and2_Lstate.Rmd',
                       output_file = paste(YearMon,'_',m_name, '_Group',n_index,'.docx', sep = '' ),
                       output_dir ='X:\\ITProjects\\Project Documentation\\Project\\InWork\\Analytic Web Portal - Starting Aug 2018\\Uploading Record')
    ,error =function(e) {print(paste('Error and skip: ',YearMon,'_',m_name, '_Group',n_index))})
    } 
  
}

##### 3.for 1 state OK need to split Q
split_states2 = list("'[A-D]'","'[E-H]'","'[I-M]'","'[Q]'","'[R-Z]'")
m ="'OK'"
m_name = gsub("\'", "", noquote(m))
for(n in split_states2){
  n_index = as.numeric(which(split_states2 ==n))
  print(n)
  print(n_index)
  tryCatch(
  rmarkdown:: render('C:\\Users\\tianyi.fang\\Documents\\Projects_Infinedi\\WebAnalytics_Phase1and2_Lstate.Rmd',
                     output_file = paste(YearMon,'_',m_name, '_Group',n_index,'.docx', sep = '' ),
                     output_dir ='X:\\ITProjects\\Project Documentation\\Project\\InWork\\Analytic Web Portal - Starting Aug 2018\\Uploading Record')
  ,error =function(e) {print(paste('Error and skip: ',YearMon,'_',m_name, '_Group',n_index))})
}

##### 4.Brad's Data
YearMon = format(Sys.Date(), "%Y-%m")
rmarkdown:: render('C:\\Users\\tianyi.fang\\Documents\\Projects_Infinedi\\WebAnalytics_Phase1and2_Brad.Rmd',
                   output_file = paste(YearMon, '_Brad','.docx', sep = '' ),
                   output_dir ='X:\\ITProjects\\Project Documentation\\Project\\InWork\\Analytic Web Portal - Starting Aug 2018\\Uploading Record')
