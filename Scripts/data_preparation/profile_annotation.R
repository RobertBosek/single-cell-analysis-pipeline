rm(list = ls()); gc()

# set path to data folder
dp = "../../Data/"

# read in annotated data and split it into expressions values and annotation dataframes
all.data <- readRDS(paste0(dp, "00_original/cll_data_num_all.rds"))
cll.exprs <- all.data[-which(rownames(all.data) %in% c("patient", "cluster", "cell_type")), ]

# von email 2018-06-20, Franziska Görtler, "Datensatz erklärungen"
#   0: CLL Tumor
#   1: CD4+
#   2: CD8+
#   3: Monozyten
#   4: NK
#   5: NLC
#   6: Das war bei mir drin, was sie null annotiert haben. irgend welcher Krusch, kannst weg lassen
#   7: Zellen, die sie hatten, aber nicht zuordnen konnten. War aber kein Tumor.
map.fun <- function(x){
  if(x == 0){return("malignant")}
  if(x == 1){return("cd4+")}
  if(x == 2){return("cd8+")}
  if(x == 3){return("mono")}
  if(x == 4){return("nk")}
  if(x == 5){return("nlc")}
  if(x == 6){return("not_annotated")}
  if(x == 7){return("unassigned")}
  return("unmapped")
}

tmp.pheno <- all.data[c("patient", "cluster", "cell_type"), ] # tmp => will be switched to data.frame

# annotate celltype by mapping function
cll.pheno <- data.frame(
  "sample.name" = colnames(tmp.pheno),
  "patient" = tmp.pheno["patient", ],
  "cluster" = tmp.pheno["cluster", ],
  "cell_type" = sapply(tmp.pheno["cell_type", ], map.fun)
  , stringsAsFactors = FALSE)

# save files as rda for subsampling R script
save(
  cll.pheno, cll.exprs
  , file = paste0(dp, "all/cll_all.rda")
)

# save expression and annotation as csv for easier reading in with python
write.csv(cll.exprs, paste0(dp, "all/data.csv"))
write.csv(cll.pheno, paste0(dp, "all/pheno.csv"), row.names = FALSE)
