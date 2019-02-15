// Cypher queries to load provider-encounter test data

// For convenience...
//
// Delete all relationships:
// MATCH ()-[r]-() DELETE (r)
//
// Delete all nodes:
// MATCH (n) DELETE (n)

// Query 1
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
FROM "file://./data/test_activities.csv" AS line FIELDTERMINATOR ','
WITH line

MERGE (encounter:Encounter { id: line.encounter_id_DEID })
SET encounter.deid = line.encounter_id_DEID

MERGE (provider:Provider { id: line.action_personnel_id_DEID })
SET provider.deid = line.action_personnel_id_DEID

MERGE (provider)-[:INVOLVED_IN]->(encounter)
;

// Query 2
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
FROM 'file://./data/test_encounters.csv' AS line FIELDTERMINATOR ','
WITH line

MERGE (encounter:Encounter { id: line.encounter_id })
SET encounter.acuity = line.Acuity,
    encounter.outcome = line.Outcome,
    encounter.RAF = line.RAF
;

// Test query
// MATCH (p:Provider)-[:INVOLVED_IN]-(e:Encounter) WHERE p.id CONTAINS "P013" RETURN e.deid as deid, e.acuity as acuity, e.RAF as RAF, e.outcome as outcome
