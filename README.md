# Description
Shared patient encounters form the basis for collaborative relationships, which are crucial to the success of interdisciplinary teamwork in healthcare. Quantifying the strength of these relationships using shared risk-adjusted patient outcomes provides insight into interactions that occur between healthcare providers in a hospital setting. A network-based approach that quantifies teamwork quality can characterize clinical processes, facilitate quality improvement (QI), and become an important tool in learning healthcare systems. The goal of this project is to establish a generalizable, graph-based framework for measuring the Shared Positive Outcome Ratio (SPOR), an objective composite measure that quantifies the concentration of risk-adjusted positive outcomes for each pair of providers over a set of shared patient encounters.
![alt text](https://github.com/carsonicator/SPOR-Project/blob/master/examples/shared_encounters_example.png "shared encounter example")
The Shared Positive Outcome Ratio, or SPOR, weights relationships according to the relative success of a provider pair. The SPOR answers this question: '_How many more good outcomes do these two providers achieve when they work together versus when they work with other providers?_’ If the rate of satisfaction was the same inside the overlap as it is outside of the overlap, the SPOR would be 1, which is the expected value. In this example, however, both providers have greater success when working together (i.e., inside the overlap) and the SPOR value is greater than 1. This metric was calculated for each pair of providers in the network.

# Contact
[Matt Carson](https://galter.northwestern.edu/contact/matthew/carson/)

# File Overview

## Code Files

### R Script
_calculate_RAF.R_: used to calculate the risk adjustment factor (RAF) for each encounter

### Python Scripts
* _Neo4j_test_query_with_Python.ipynb_: used to test your connection to the Neo4j database using the `Py2Neo` package; also includes a test query
* _create_spor_network_test_neo4j_3_20190126.py_: used to calculate the SPOR metric for each provider in the network

### Cypher Script
_load_test_data.cql_: contains queries to load test data into the graph database

## Data Files
* _test_activities.csv_: contains encounter IDs and the associated providers (an edge list)
* _test_encounters.csv_: contains encounter IDs, acuity, outcome, and risk adjustment factor (RAF)
* _test_encounter_data_for_R.csv_: contains the encounter ID, acuity, and outcome for each encounter; used with _calculate_RAF_ to calculate the RAF

# Getting started

## Setting up the Neo4j Database

1. Download and install Neo4j: https://neo4j.com/download/

2. Create a new project. Within the project, create a new database. For the test database, set the username to _neo4j_ and password _sportest2019_.

3. Click 'Manage' and go to 'Settings'. You should see the _neo4j.conf_ file displayed below. By default Neo4j only allows .csv file imports from the _import_ folder. For Macs, this folder lives in _/Users/[user_name]/Library/Application Support/Neo4j Desktop/Application/neo4jDatabases/[database-id]]/installation-[version]/_ by default. However, you can access it in the Neo4j administration window. If you want to load files from another location, comment out the following line:

... _dbms.directories.import=import_

4. Start the database and open the browser.

## Loading the Provider-Encounter Test Data

Once you've set up your database, you can load the test data using the Cypher queries in _load_test_data.cql_. There are two queries you need to run. The first one loads the _provider_ and _encounter_ nodes followed by the `[:INVOLVED_IN]` relationship. The second query adds attributes to the _encounter_ nodes. Just copy the queries one at a time, paste them in the Neo4j browser query window, and push the _Play_ button.

## Testing the database connection in python

[_./code/Neo4j_test_query_with_Python.ipynb_](https://github.com/carsonicator/SPOR-Project/blob/master/code/Neo4j_test_query_with_Python.ipynb) can be used to test the database connection and sample query.

# Citations

## Publications

The **Shared Positive Outcome Ratio (SPOR)** metric and example applications are described in the following publications:

1. Carson, M. B., Gravenor, S. J., Scholtens, D. M., Frailey, C. N., Kricke, G. S., and Soulakis, N. D. [_An outcome-weighted network model for characterizing collaboration._](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0163861) PLoS ONE. 2016 Oct 5. doi: 10.1371/journal.pone.0163861. PMID: 27706199

2. Carson, M. B., Scholtens, D. M., Frailey, C. N., Gravenor, S. J., Powell, E. S., Wang, A. Y., Kricke, G. S., Ahmad, F. S., Mutharasan, R. K., and Soulakis, N. D. [_Characterizing Teamwork in Cardiovascular Care Outcomes: A Network Analytics Approach._](http://circoutcomes.ahajournals.org/content/9/6/670) Circ Cardiovasc Qual Outcomes. 2016 Nov; 9(6): 670–678. doi: 10.1161/CIRCOUTCOMES.116.003041. PMID: 28051772

3. Carson, M. B., Scholtens, D. M., Frailey, C. N., Gravenor, S. J., Powell, E. S., Wang, A. Y., Kricke, G. S., Ahmad, F. S., Mutharasan, R. K., Soulakis, N. D. An outcome- weighted network model for quantifying and measuring collaboration in a hospital cardiology unit. AMIA 2016 Annual Symposium Nov. 12-16, Chicago, IL. [doi:10.18131/G3HC89](https://digitalhub.northwestern.edu/files/3e5cf487-2383-4d1f-b697-ed40a8b79670)


[![DOI:10.18131/G3HC89](https://digitalhub.northwestern.edu/files/3e5cf487-2383-4d1f-b697-ed40a8b79670)](https://doi.org/10.18131/G3HC89)
