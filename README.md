## How to run?
1. Run ``` docker-compose up ```.
2. You will see a message whether the creation was `Okay` or `Not Okay`.
3. Exec into the container.
4. Populate the data by running with the required size ``` ./mnt/scripts/populate_data.sh  1k```.
5. Run the query using ```  ./mnt/scripts/run_queries.sh  ```.
6. Don't forget to stop the container after you are done.
7. Run ``` docker-compose down --volumes``` to delete the volumes.

## How can you contribute?
1. Create queries in the `queries` folder.
2. Add the queries to the `run_queries.sh` file.

## How to add data?
1. Add a new script in the `dummyData` folder.
2. Add the new size of the data in the `populate_data.sh` file.


>> You can find the schema of the database in the `DDL` folder.
