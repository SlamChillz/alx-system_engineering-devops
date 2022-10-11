# MySQL - Database Replication

The general objectives of this project are:

- What is the main role of a database
- What is a database replica
- What is the purpose of a database replica
- Why database backups need to be stored in different physical locations
- What operation should you regularly perform to make sure that your database backup strategy actually works

## Tasks

### [0. Install MySQL](./0-install_mysql5.7)
Install  MySQL on both your `web-01` and `web-02` servers.
- MySQL distribution must be `5.7.x`
- [public gpg key](./signature.key) for installation

### [1. Let us in!](./create_and_grant_user.sql)
- Create a MySQL user named `holberton_user` on both `web-01` and `web-02` with the host name set to `localhost` and the password `projectcorrection280hbtn`. This will allow us to access the replication status on both servers.
- Make sure that `holberton_user` has permission to check the `primary/replica` status of your databases.

### [2. If only you could see what I've seen with your eyes](./create_database-tyrell_corp.sql)
In order for you to set up replication, we’ll need to have a database with at least one table and one row in your primary MySQL server (web-01) to replicate from.
- Create a database named `tyrell_corp`.
- Within the `tyrell_corp` database create a table named `nexus6` and add at least one entry to it.
- Make sure that `holberton_user` has `SELECT` permissions on your table so that we can check that the table exists and is not empty.
