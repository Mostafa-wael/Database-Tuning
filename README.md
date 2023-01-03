## How to run?
1. Run ``` docker-compose up ```.
2. You will see a message whether the creation was `Okay` or `Not Okay`.
3. Exec into the container.
4. Populate the data by running with the required size ``` ./mnt/scripts/populate_data.sh  1k```.
5. Run the query using ```  ./mnt/scripts/run_queries.sh query1```.
6. Don't forget to stop the container after you are done.
7. Run ``` docker-compose down --volumes``` to delete the volumes.

how to copy and paste file in bash script?
```bash
cp /mnt/scripts/queries/query1.js /mnt/scripts/queries/query1.js.bak
```

### For NOSQL 

1. Run ``` docker-compose up mongodb ```
2. Container will create collections upon startup also it will insert dummy data into them
3. Use <b>connect_db.sh</b> to exec into container
4. Run the following commands 
```
    mongosh
    use admin
    db.auth("root","pass12345")
    use social

```
5. The container starts initially with 10k data for each collection , to change this
    - Open a shell in the container using connect_db.sh
    - change the number fo dummy data  using ``` export DUMMY_SIZE=1000000 ```
    - run ``` mongosh ```
    - Authenticate yourself using step 4 commands
    - load the script again using ``` load("./insert_dummy.js") ```


## How can you contribute?
1. Create queries in the `queries` folder.
2. Add the queries to the `run_queries.sh` file.

## How to add data?
1. Add a new script in the `dummyData` folder.
2. Add the new size of the data in the `populate_data.sh` file.


>> You can find the schema of the database in the `DDL` folder.


### Helpful mongo commands
1. Note that mongo command should be installed on the computer. On Linux this should be install `mongodb-org-shell` [package](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/).
2. Connect to MongoDB server ```mongo admin -u root -p pass12345``` It will connect to localhost port 27017.
3. Show databases: `show dbs`
4. Create new non-existent database: `use mydatabase`
5. Show collections: `show collections`
6. Show contents/documents of a collection: `db.your_collection_name.find()`
7. Save a data to a collection: `db.your_collection_name.save({"name":"Sony AK"})`
8. Show database version: `db.version()`
9. Show database status: `db.stats()`
