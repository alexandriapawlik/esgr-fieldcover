# ESGR Field Cover data (Art Cooper)
Repository Link: [GitHub](www.github.com/alexandriapawlik/esgr-fieldcover)
Data Source: [Relationships Between Plant Life-Forms and Microclimate, Cooper 1961](https://doi.org/10.2307/1950745)


## Excel files for plots 1-19 combined into 4 extracted tables: (copy/paste and some retyped by hand)
- trees/shrubs DBH (tree_shrub_dbh.csv)
	- subplots 1-9
	- alive/dead
	- converted to long to combine live and dead tables
- trees/shrubs reproduction/saplings (tree_shrub_reproduction.csv)
	- subplots 1-9
	- kept wide format
- field cover (field_cover.csv)
	- trees/shrubs and herbs
	- bottom (plots 1-3) / middle (plots 4-6) / top (plots 7-9)
	- kept wide format
- plot summary
	- created by hand using data extracted from data source paper


R notebook details all cleaning completed after initial extraction .   
Metadata was extracted from the data source document.



## Additional attachments:
- code.zip - code for data cleaning
- raw.zip - raw Excel data and extracted tables (described above)
- photos.zip - plot photos taken by Art Cooper, 1957



## Versions:

edi.933.1 - initial release
- AKP 8/6/21 
- to do:
	- add locations for plots 18 and 19
	- updated locations for all plots
	- add pictures taken of plots in 2021
