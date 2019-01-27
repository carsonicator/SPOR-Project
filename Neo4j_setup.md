# Setting up the Neo4j Database

1. Download and install Neo4j: https://neo4j.com/download/

2. Create a new project. Within the project, create a new database.

3. Click 'Manage' and go to 'Settings'. You should see the _neo4j.conf_ file displayed below. By default Neo4j only allows .csv file imports from the _import_ folder. For Macs, this folder lives in _/Users/[user_name]/Library/Application Support/Neo4j Desktop/Application/neo4jDatabases/[database-id]]/installation-[version]/_ by default. However, you can access it in the Neo4j administration window. If you want to load files from another location, comment out the following line:

  _dbms.directories.import=import_

4. Start the database and open the browser.

# Loading the Provider-Encounter Test Data

Once you've set up your database, you can load the test data using the Cypher queries in _load_test_data.cql_. There are two queries you need to run. The first one loads the _provider_ and _encounter_ nodes followed by the `[:INVOLVED_IN]` relationship. The second query adds attributes to the _encounter_ nodes. Just copy the queries one at a time, paste them in the Neo4j browser query window, and push the _Play_ button.

In neo4j.conf...
#
# Commented out this line
#dbms.directories.import=import

# Added this line to allow APOC to read .csv files
# apoc.import.file.enabled=true

# Uncommented this line as suggested here:
# https://community.neo4j.com/t/setting-apoc-import-file-enabled-true-in-your-neo4j-conf/4293/3:
#dbms.security.procedures.whitelist=apoc.coll.*,apoc.load.*

#
###
###
