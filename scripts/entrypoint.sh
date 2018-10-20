#!/bin/bash
database=Sampler
wait_time=15s
password=Your_password123

# wait for SQL Server to come up
echo creating db will be started in $wait_time...
sleep $wait_time

echo creating Sampler db...
# run the init script to create the DB, tables and sp
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./init-sampler.sql