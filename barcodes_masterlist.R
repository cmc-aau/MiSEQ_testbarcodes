library(readxl)
library(data.table)
masterlist <- read_excel("barcodes_list_20180125.xlsx", range = "A1:E1153")
dt <- data.table(
  Sample_ID = masterlist$ID,
  Sample_Name = paste0("sample-", 1:1152),
  index = masterlist$`rv_seq (Index1)`,
  index2 = masterlist$`fwd_seq(Index2)`,
  Description = masterlist$ID,
  rev = paste0("rev-", as.integer(gsub(".*-", "", masterlist$rv))),
  fwd = paste0("fwd-", as.integer(gsub(".*-", "", masterlist$fwd))))
fwrite(dt, "barcodes_masterlist.csv")

# then copy/paste into script.sh