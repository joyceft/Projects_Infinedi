library(taskscheduleR)
library(knitr)
library(markdown)
library(rmarkdown)
library(stringr)



### Userful link
# https://beta.rstudioconnect.com/content/3132/Job_Scheduling_R_Markdown_Reports_via_R.html

uploadscript <- file.path("C:", "Users", "tianyi.fang", "Documents", "Projects_Infinedi", "WebAnalytics_MUploadingAlllSteps.R")

taskscheduler_create(taskname = 'WA_upload_schedule',rscript = uploadscript, 
                     schedule = 'MONTHLY', starttime = "00:01", days = 1,
                     startdate = format(as.Date("2020-04-01"), "%m/%d/%Y"))

#check the existing schedule task, x is a dataframe
x = taskscheduler_ls() 
x[x$TaskName =='WA_upload_schedule']


## Once the task is create, there is no need to create this task again. 

## delete the tasks
taskscheduler_delete(taskname = "WA_upload_schedule")

## log file is at the place where the helloworld.R script was located
mylog <- system.file("extdata", "helloworld.log", package = "taskscheduleR")
cat(readLines(mylog), sep = "\n")