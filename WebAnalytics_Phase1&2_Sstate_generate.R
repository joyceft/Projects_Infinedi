library(knitr)
library(markdown)
library(rmarkdown)
library(stringr)

group_states = list(c("'UT','HI','RI','WV','AK','MT','WY','CT','NH','ND','LA','ME','OR'"),
                    c("'GA','SC','MI','NV','MA','WA','NJ','AZ'"),
                    c("'CO','MS','NM','IN','AL','NC','DE','NY'"),
                    c("'TN', 'VT', 'ID'"),
                    c("'SD', 'AR', 'WI'"),
                    c("'CA', 'MD'"),
                    c("'IL', 'PA'"),
                    c("'MO', 'KY'"),
                    c("'VA', 'FL'"),
                    c("'MN', 'TX'"))

enddate = format(Sys.Date(), "%Y-%m-01") #first day of current month
prestartdate = format(Sys.Date()-30,"%Y-%m-01" ) #first day of last month
pres3tartdate = format(Sys.Date()-120,"%Y-%m-01" ) #first day of last 3 month
YearMon = format(Sys.Date(), "%Y-%m")
  for(j in group_states){
    
    j_index = which(group_states ==j)
    print(j_index)
    print(j)
     # j = group_states[[10]]
     # print(j)
    rmarkdown:: render('C:\\Users\\tianyi.fang\\Desktop\\TF\\projects\\Mobile Application - Infninedi Analytics\\WebAnalytics_Phase1and2_Sstate.Rmd',
                       output_file = paste(YearMon, '_SStates_Group',j_index,'.docx', sep = '' ),
                       output_dir ='X:\\ITProjects\\Project Documentation\\Project\\InWork\\Analytic Web Portal - Starting Aug 2018\\Uploading Record')

     }
 

#this is for larger state 
# states = list("'IA'","'KS'","'OH'", "'NE'", "'OK'")# 
# split_states = list("'[A-D]'","'[E-H]'","'[I-M]'","'[Q]'","'[R-Z]'")
# 
# 
# YearMon = format(Sys.Date(), "%Y-%m")
# 
# for(m in states){
#   m_name = gsub("\'", "", noquote(m))
#   print(m_name)
#   for(n in split_states){
#     n_index = as.numeric(which(split_states ==n))
#     # print(j_index)
#     # print(j)
#     rmarkdown:: render('C:\\Users\\tianyi.fang\\Desktop\\TF\\projects\\Mobile Application - Infninedi Analytics\\WebAnalytics_Phase1&2_Lstate.Rmd',
#                        output_file = paste(YearMon,'_',m_name, '_Group',n_index,'.docx', sep = '' ),
#                        output_dir ='X:\\ITProjects\\Project Documentation\\Project\\InWork\\Analytic Web Portal - Starting Aug 2018\\Uploading Record')
#   } 
#   
# }