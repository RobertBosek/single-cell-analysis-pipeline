# Cell type labeling of chronic lymphocytic leukemia (CLL) single-cell RNA-sequencing (scRNA-seq) data

* Student: Robert Bosek
* Mentor: Marian Schön

## General project information

In this project we are using scRNA-seq data from Rendeiro et al. provided in scope of their paper 'Chromatin mapping and single-cell immune profiling define the temporal dynamics of ibrutinib response in CLL'.

This data is analysed using scanpy, adapting the tutorial pipeline developed by Lücken and Theis in scope of their paper 'Current best practices in single-cell RNA-seq analysis: a tutorial'.

We  apply  the pipeline to the data with the aim to assign cell type labels to expression profiles.  We give insight into methods and results for different steps in the analysis workflow and point out alternative ways of assigning cell type labels. Our results show, that the annotation of expression profiles with cell type labels depends on the strategy and thus is not distinct.  Furthermore it also depends on the usage of additional data, like cell type marker gene sets.


## Software information

The project was implemented with Python version 3.6.9 and R version 3.6.2

For setting up libraries and dependencies check:

* [scanpy installation](https://icb-scanpy.readthedocs-hosted.com/en/stable/installation.html)

* [single-cell-tutorial](https://github.com/theislab/single-cell-tutorial/) especially the [latest-notebook](https://github.com/theislab/single-cell-tutorial/tree/master/latest_notebook) (Stand 4.11.2019)