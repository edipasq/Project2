# Drugs, death and crimes a crisis in New England

<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/New_England_map.png width =300 height='auto' />
</p>

<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/drug_picture.jpg  width =auto height='auto' />
</p>

<p align="center">
	Drug use in New England and the deaths and crime associated with it have been increasing to a point of great concern.  Numerous public hearings have been held to address this crisis as it affects a growing number of residents in this region of the United States.
This project confirms that drug related deaths and crimes have increased significantly in New England during a five-year period from 2015 to 2019.
The statistics that recorded drug overdoses and crimes during this time were taken from CDC and FBI data sources respectively.
</p>

## Source of Information
<div align='center'>

<h3 align="center"> <strong>FBI</strong> </h3>
<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/FBI_logo.jfif width =300 height='auto' />
</p>

<a align="center" href="https://crime-data-explorer.app.cloud.gov/pages/downloads">FBI Crime Data Explorer (CDE) </a>
 
Under Crime Incident-Based Data by State and Year
![Search Tool](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/FBI_search.PNG)

<p align="center">
The FBI’s Crime Data Explorer (CDE) has Incident-based data that was downloaded as CSV files.
From this source, five years (2015 – 2019) of recorded crime incidents from the states in New England was queried across multiple files.  Results were filtered to show only crimes that were tagged as drug related.  Data from the CDE that was distinguished per gender was combined to show total crimes per year across all genders in order to coordinate with the CDC data described below that did not include gender.
</p>


<h3 align="center"> <strong>CDC</strong> </h3>
<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/cdc_logo.jfif width =300 height='auto' />
</p>

[Centers for Disease Control and Prevention (CDC)](https://www.cdc.gov/nchs/pressroom/sosmap/drug_poisoning_mortality/drug_poisoning.htm)

<p>
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/cdc_search.PNG width =500 height='auto' />
</p>

<p>
The CDC’s Drug Overdose Mortality by State data was downloaded as a single CSV file that contains the number of drug related deaths by state per year.
From this source, five years (2015 – 2019) of recorded drug overdoses from the states in New England was queried.  The results show the number of drug related deaths by state per year across all genders.
</p>

</div>

## Extract

30 Files were extracted from the CDE site. Each folder contains the CSV files extracted from each States:
* [Vermont](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/Vermont)
* [New Hampshire](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/New%20Hampshire)
* [Massachusetts](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/Massachusetts)
* [Maine](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/Maine)
* [Rhode Island](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/Rhode%20Island)
* [Connecticut](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/Connecticut)

Fields Extracted from CDC csv file:
* Fields Extracted from CDC CSV file:
* YEAR: Year of Deaths
* STATE: Location of deaths
* DEATH: Number of deaths per State in that year.


## Transform
After cleaning, transforming and merging all the files for each state. We saved a csv file with the final solution to be store on the Databases.
Each File has the following columns:
* arrest_date: date of crime committed
* Offense_type_id: Only got offense id number 35 which was according to another table the drug offense type.
* Sex_code: Gender of whom the crime was committed by.

#### Clean csv files:
* [Vermont](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Vermont/vermont.csv)
* [New Hampshire](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/New%20Hampshire/new_hampshire.csv)
* [Massachusetts](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/Massachusetts/massachusetts.csv)
* [Maine](https://github.com/Rlizaran/Drug-Crime-and-Overdose/tree/main/Resources/Maine/maine.csv)
* [Rhode Island](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Rhode%20Island/rhode_island.csv)
* [Connecticut](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Connecticut/connecticut_df.csv)

For the CDC file:
CSV.csv file was renamed for the project as [Death_overdose.csv](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Death_overdose.csv), this file was transformed and manipulated to meet the requirements of the crimes files to be able to put this in a database and finally join with our other source by state and year.
The exact changes of the transformation of this file would be found in detail in the [PROJECT_ETL.IPYNB](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Cleaning/project_ETL.ipynb), as well as the final database load and comparison.

## Load
### Schema Diagram
<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/schema_diagram.PNG width =500 height='auto' />
</p>

Then we joined all the FBI tables into one and calculated the total number of crimes
<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/clean_table.PNG width=500 height='auto' />
</p>

And for the CDC file, we ended up with the following table
<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/cdc_transform.PNG width=500 height='auto' />
</p>

<p>
	Then we load both file into our database following the diagram above. FBI source into drug_crimes and CDC csv file into overdose_deaths.
</p>

After running a query and using a join specified on our [PROJECT_ETL.IPYNB](https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Cleaning/project_ETL.ipynb),
we could get a new table as follows
<p align="center">
	<img src=https://github.com/Rlizaran/Drug-Crime-and-Overdose/blob/main/Resources/Images/final_query.PNG width=500 height='auto' />
</p>

# Contributors
* [Maria DiPasqule](https://github.com/edipasq)
* [Aurlian Fousse](https://github.com/aurefousse)
* [Chey Rose Flammer](https://github.com/cheyroseflammer)
* [Rodrigo Lizaran Molina](https://github.com/rlizaran)
