<p align="center">
    <img src="../images/postgresql-150x150.png"/>
</p>
<h1 align="center">Postgre SQL</h1>

- [Docker postgresql contaienr එක තුල ඇති psql shell එකට පිවිසීම](#docker-postgresql-contaienr-එක-තුල-ඇති-psql-shell-එකට-පිවිසීම)
- [K8s postgresql pod එකක් තුල ඇති psql shell එකට පිවිසීම](#k8s-postgresql-pod-එකක්-තුල-ඇති-psql-shell-එකට-පිවිසීම)
- [Basic Commands](#basic-commands)
  - [දැනට ඇති Database වල විස්තර බලාගැනීම](#දැනට-ඇති-database-වල-විස්තර-බලාගැනීම)
  - [Connection Information බලාගැනීම](#connection-information-බලාගැනීම)
- [Database Commands](#database-commands)
  - [අලුත් Database එකක් සෑදීම.](#අලුත්-database-එකක්-සෑදීම)
  - [Database එකක් Delete කිරීම.](#database-එකක්-delete-කිරීම)
- [Table Commands](#table-commands)
  - [Tables ගැන විස්තර බැලීම](#tables-ගැන-විස්තර-බැලීම)
  - [Table එකක් සෑදීම](#table-එකක්-සෑදීම)
  - [Table එකකට දත්ත ඇතුලත් කිරීම.](#table-එකකට-දත්ත-ඇතුලත්-කිරීම)
  - [Table එකක් තුල පවතින දත්තයන් බැලීම](#table-එකක්-තුල-පවතින-දත්තයන්-බැලීම)
  - [Table එකක් Delete කිරීම](#table-එකක්-delete-කිරීම)



## Docker postgresql contaienr එක තුල ඇති psql shell එකට පිවිසීම

දැනට run වන docker container හදුනාගැනීම.
```bash
docker ps
```

අදාල docker container එකට පිවිසීම
```bash
docker exec -it <container_id> /bin/sh
```

`postgres` user account එකට log වීම
```bash
su postgres
```

`psql` shell එකට පිවිසීම
```bash
psql
```

## K8s postgresql pod එකක් තුල ඇති psql shell එකට පිවිසීම
```bash
k exec -it <pod_name> -n <namespace> -- psql -U <username> -d <database_name>
```

## Basic Commands

### දැනට ඇති Database වල විස්තර බලාගැනීම 
```psql
\l
```

### Connection Information බලාගැනීම
```psql
\conninfo
```

## Database Commands
### අලුත් Database එකක් සෑදීම.
```psql
CREATE DATABASE <database_name>;
```

### Database එකක් Delete කිරීම.
```psql
DROP DATABASE <database_name>;
```

## Table Commands

මේ සදහා පළමුව Database එකකට current user account එකෙන් log වීම සිදුකල යුතුය.
```psql
\c <database_name>
```

### Tables ගැන විස්තර බැලීම
```psql
\dt
```

### Table එකක් සෑදීම
උදාහරණයක් ලෙස පහත ආකාරයේ table එකක් සාදන ආකාරය බලමු.
|Field|Type|
|-|-|
|ID|SERIAL PRIMARY KEY|
|name|VARCHAR(255)|
|email|VARCHAR(255)|
|age|INT|
|dob|DATE|

```paql
CREATE TABLE <table_name> (ID SERIAL PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), age INT, dob DATE);
```

### Specific Table එකක Schema බලන්න.
```
\d <table_name>
```

### Table එකකට දත්ත ඇතුලත් කිරීම.

ඉහත සාදාගත් table එකට පහත දත්තයන් ඇතුලත් කරන ආකාරය බලමු. ID field එක auto generate වේ.

|name|email|age|dob|
|-|-|-|-|
|nimal|nimal@example.com|25|1996-02-03|
|kamal|kamal@example.com|23|1997-08-25|
|meena|meena@example.com|20|2000-05-15|

```psql
INSERT INTO <table_name> (name, email, age, dob) VALUES ('nimal', 'nimal@example.com', 25, '1996-02-03'), ('kamal', 'kamal@example.com', 23, '1997-08-25'), ('meena', 'meena@example.com', 20, '2000-05-15');
```

### Table එකක් තුල පවතින දත්තයන් බැලීම
```bash
SELECT * FROM <table_name>;
```

### Table එකක් Delete කිරීම
```bash
DROP TABLE <table_name>;
```

## Backup Database
```bash
pg_dump -h <host> -U <username> -d <database> --no-owner --no-privileges --inserts > <backup_file_path>.sql
```

## Restore Database
```bash
pg_restore -h <host> -p <port> -U <username> -d <database> <backup_file_path>
```
Restore the Plain Text Dump: Use the psql command to restore the plain text dump file:
```bash
psql -h <host> -U <user> -d <database> -f <dump_file>.sql
```



