### Authentication Service 

# Project setup

- Clone the project on your local machine.
- Run "npm install" in root directory of the project.
- Create .env file in project root directory and add following environmental variable:
    PORT=6000

- Inside config folder create config.json and add the following piece of code:

"development": {
    "username": <YOUR_DB_LOGIN_NAME>,
    "password": <YOUR_DB_PASSWORD>,
    "database": "Auth_db_dev",
    "host": "127.0.0.1",
    "dialect": "mysql"
  }

- Once you've added your db config change the directory to src folder using terminal and execute the below cmd
    `npx sequelize db:create`

- After creation of the db in your mysql db execute below command
    `npx sequelize db:migrate`


Task need to prepare multiple error files. I know both cases one is custom error file for every error or you can make a generic error file any thing should work but custom one looks more cleaner. Instead of creating classes we can create a file full of objects and start throughing those objects.

Note: Having good error message to the client is necessary. ex: googlePay