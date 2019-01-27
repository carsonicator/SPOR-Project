# Setting up the Neo4j Database

1. Download and install Neo4j: https://neo4j.com/download/

2. Create a new project. Within the project, create a new database. For the test database, set the username to _neo4j_ and password _sportest2019_.

3. Click 'Manage' and go to 'Settings'. You should see the _neo4j.conf_ file displayed below. By default Neo4j only allows .csv file imports from the _import_ folder. For Macs, this folder lives in _/Users/[user_name]/Library/Application Support/Neo4j Desktop/Application/neo4jDatabases/[database-id]]/installation-[version]/_ by default. However, you can access it in the Neo4j administration window. If you want to load files from another location, comment out the following line:

  _dbms.directories.import=import_

4. Start the database and open the browser.

# Loading the Provider-Encounter Test Data

Once you've set up your database, you can load the test data using the Cypher queries in _load_test_data.cql_. There are two queries you need to run. The first one loads the _provider_ and _encounter_ nodes followed by the `[:INVOLVED_IN]` relationship. The second query adds attributes to the _encounter_ nodes. Just copy the queries one at a time, paste them in the Neo4j browser query window, and push the _Play_ button.

# Testing the database connection in python

_./code/Neo4j_test_query_with_Python.ipynb_ can be used to test the database connection and sample query.
