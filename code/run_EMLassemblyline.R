# This script executes an EMLassemblyline workflow.

# Initialize workspace --------------------------------------------------------

# Update EMLassemblyline and load

# remotes::install_github("EDIorg/EMLassemblyline")
library(EMLassemblyline)

# Define paths for your metadata templates, data, and EML

path_templates <- "metadata/templates"
path_data <- "output"
path_eml <- "output"

# Create metadata templates ---------------------------------------------------

# Below is a list of boiler plate function calls for creating metadata templates.
# They are meant to be a reminder and save you a little time. Remove the 
# functions and arguments you don't need AND ... don't forget to read the docs! 
# E.g. ?template_core_metadata

# Create core templates (required for all data packages)

EMLassemblyline::template_core_metadata(
  path = path_templates,
  license = "CCBY",
  write.file = TRUE)

# Data prov

EMLassemblyline::template_provenance(
  path = path_templates
)

# Create table attributes template (required when data tables are present)

EMLassemblyline::template_table_attributes(
  path = path_templates,
  data.path = path_data,
  data.table = c("tree_shrub_dbh.csv", "tree_shrub_reproduction.csv", "field_cover.csv", "plot_summary.csv"))

# Create categorical variables template (required when attributes templates
# contains variables with a "categorical" class)

EMLassemblyline::template_categorical_variables(
  path = path_templates, 
  data.path = path_data)
# 
# # Create geographic coverage (required when more than one geographic location
# # is to be reported in the metadata).
# 
# EMLassemblyline::template_geographic_coverage(
#   path = path_templates, 
#   data.path = path_data, 
#   data.table = "stemmaps.csv", 
#   site.col = "Site",
#   empty=TRUE)

# Create taxonomic coverage template (Not-required. Use this to report 
# taxonomic entities in the metadata)

# remotes::install_github("EDIorg/taxonomyCleanr")
# library(taxonomyCleanr)
# 
# taxonomyCleanr::view_taxa_authorities()
# 
# EMLassemblyline::template_taxonomic_coverage(
#   path = path_templates, 
#   data.path = path_data,
#   taxa.table = "",
#   taxa.col = "",
#   taxa.name.type = "",
#   taxa.authority = 3)

# Make EML from metadata templates --------------------------------------------

# Once all your metadata templates are complete call this function to create 
# the EML.


Pid <- "edi.933.1"
Sid <- "edi.367.1"

EMLassemblyline::make_eml(
  path = path_templates,
  data.path = path_data,
  eml.path = path_eml, 
  dataset.title = "Field cover at the Edwin S. George Reserve, Southeastern Michigan in 1957", 
  temporal.coverage = c("1957-08-26", "1957-09-07"), 
  geographic.description = "University of Michigan Edwin S. George Reserve in Pinckney, Michigan",
  geographic.coordinates = c('42.46', '-84.00', '42.46', '-84.00'),
  maintenance.description = "complete", 
  data.table = c("field_cover.csv", "plot_summary.csv", "tree_shrub_dbh.csv", "tree_shrub_reproduction.csv"), 
  data.table.name = c("Field Cover Density", "Plot Summary", "Tree and Shrub DBH Measurements", "Tree and Shrub Reproduction Counts"),
  data.table.description = c("Density of herbs, trees, and shrubs in horizontal regions of sloped plots", 
                             "Plot numbers and key plot properties",
                             "DBH measurements and status for trees and shrubs in each plot",
                             "Reproduction counts for trees and shrubs in each plot"),
  other.entity = c("code.zip", "raw.zip", "photos.zip", "README.md"),
  other.entity.name = c("R Code", "Source", "Plot Photos", "Read Me"),
  other.entity.description = c("R scripts for data and metadata cleaning", "Source data for R scripts", "Pictures taken of plots by Arthur Cooper in 1957", "Readme file describing data curation process and versions"),
  user.id = "umbiologicalstat",
  user.domain = "EDI", 
  package.id = Pid)
