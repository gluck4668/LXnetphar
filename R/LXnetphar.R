
netphar <- function(name,website){

  #------------------------------------------------------------------------------
  R_packs_install <- function(){

    R_packs <- c("rvest","stringr","jsonlite","httr", "magrittr","dplyr","openxlsx")

    list_installed <- installed.packages()

    new_R_packs <- subset(R_packs, !(R_packs %in% list_installed[, "Package"]))

    if(length(new_R_packs)!=0){install.packages(new_R_packs,force=TRUE,quietly = TRUE)
      print(c(new_R_packs, " packages added..."))}

    if((length(new_R_packs)<1)){print("No new dependency packages added...")}

  }

  R_packs_install()


  #--------------------

  for(i in R_packs){
    library(i, character.only = T)
  }

  rm(i)

  ##------------------------------------------------------------------------------


  filename <- trimws(paste(name,"(成分-靶点-疾病)",".xlsx"))

  n1 <- c("化学成分.xlsx")
  n2 <- c("靶点.xlsx")
  n3 <- c("相关疾病.xlsx")
  name1 <- paste(name,n1,collapse ="")
  name2 <- paste(name,n2,collapse ="")
  name3 <- paste(name,n3,collapse ="")

  n01 <- c("化学成分")
  n02 <- c("靶点")
  n03 <- c("相关疾病")
  name01 <- paste(name,n01)
  name02 <- paste(name,n02)
  name03 <- paste(name,n03)

  web <- read_html(GET(website,encoding="UTF-8", config(ssl_verifypeer = FALSE)))

  tcmsp <- web %>% html_elements("script") %>% html_text()
  test1 <- str_extract_all(tcmsp,"data:\\s\\[.*\\]")
  test2 <- unlist(test1[12])
  chengfen <- str_replace(test2[1], "data:","") %>%
    writeLines(., "ingredients.txt")
  chengfen_df <- read_json("ingredients.txt",simplifyVector = TRUE)
  #write.xlsx(chengfen_df, file=name1, sheetName=name01,append=TRUE,rowNames=F)

  dtarget <- str_replace(test2[2], "data:","")  %>%
    writeLines(., "dtarget.txt")
  dtarget_df <- read_json("dtarget.txt",simplifyVector = TRUE)
  #write.xlsx(dtarget_df, file=name2, sheetName=name02,append=TRUE,rowNames=F)


  re_dis<- str_replace(test2[4], "data:","")  %>%
    writeLines(., "re_dis.txt")
  re_dis_df <- read_json("re_dis.txt",simplifyVector = TRUE)
  #write.xlsx(re_dis_df, file=name3, sheetName=name03,append=TRUE,rowNames=F)
  file.remove(c("ingredients.txt","dtarget.txt","re_dis.txt"))



  sheets=list("化学成分"=chengfen_df,"靶点"=dtarget_df,"相关疾病"=re_dis_df)


  write.xlsx(sheets,filename)

  note <- paste("搜索结果，请到当前文件夹查看","“",name,"(成分-靶点-疾病)","”")

  print(note)

}


