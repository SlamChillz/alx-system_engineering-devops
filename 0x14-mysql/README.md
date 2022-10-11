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
