* update_marker.ipynb: updates the marker data files in Data/marker/ from CellMarker database

* profile_annotation.R: Input rds file in Data/original, output rda file with split up expression data and profile annotation as well as two files data.csv and pheno.csv stored in Data/all/

* subsampling_cll_all.R: Input rda file with split up expression data and profile annotation, output downsampled rda file with split up expression data and profile annotation as well as two files data.csv and pheno.csv stored in Data/downsample/

* data_format.ipynb: Input expression data and profile annotation both as .csv, output expression data with profile annotation as observations and genes as variables in h5 file format - the input format for the pipeline

* celltype selection.ipynb: Notebook with celltype label selection decisions, starting with all data removes certain celltype labeled expression profiles


Make sure to create corresponding subdirectories in the Data directory before executing scripts

Data

├── original

├── all

├── downsampled

├── selection

└── marker
