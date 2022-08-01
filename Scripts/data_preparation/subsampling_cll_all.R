rm(list = ls()); gc()

# set path to data folder
dp = "../../Data/"

load(file = paste0(dp, "all/cll_all.rda"))

set.seed(42)

#choose percentage of cells for subsampling
perc.per.type <- 0.1
downsampled.cll <- matrix(
  data = NA
  , nrow = nrow(cll.exprs)
  , ncol = 0
)
rownames(downsampled.cll) <- rownames(cll.exprs)

for(l.cell.type in unique(cll.pheno$cell_type)){
  # get all cells for current celltype
  pos.profiles <- which(cll.pheno$cell_type == l.cell.type)
  # get index of cells of current celltype
  profiles.id <- cll.pheno[pos.profiles, "sample.name"]
  # subsample profile.id with set percentage
  selected.samples <- sample(
    x = profiles.id
    , size = round(perc.per.type*length(pos.profiles))
    , replace = FALSE
    )
  # select colums of expression matrix corresponding to subsampled cell indices
  downsampled.cll <- cbind(
    downsampled.cll, 
    cll.exprs[, selected.samples]
  )
}

# select annotation by subsampled cell indices
downsampled.pheno <- subset(
  cll.pheno,
  sample.name %in% colnames(downsampled.cll)
  )

# save R data objects as rda
save(
  downsampled.pheno, downsampled.cll
  , file = paste0(dp, "downsampled/cll_downsampled.rda")
)

# save R data objects as csvs for easier reading in python
write.csv(downsampled.cll, paste0(dp, "downsampled/data.csv"))
write.csv(downsampled.pheno, paste0(dp, "downsampled/pheno.csv"), row.names = FALSE)

