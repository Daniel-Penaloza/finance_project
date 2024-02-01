### Information bout the application:
This application is creaated with postgresql database so first be sure to have installed postgres on your
local machine.
Currently i'm developing the application in Linux Fedora 38 so you can see more references about the installation over here:
https://docs.fedoraproject.org/en-US/quick-docs/postgresql/

### Setup the application
* Run bundle install
* Run rails db:setup
And you will be good to go.


### Current Endpoints:
All the endpoints are currently provided by Swagger in the following route:
* http://localhost:3000/api-docs/index.html this means
* All the CRUD for expenses.
* You can generate a report and send it you your email with the following endpoint the http://localhost:3000/api/v1/monthly_report You just need to update your development.rb and then update your MAILTRAP_USER and MAILTRAP_PASSWORD envs in your application.yml file (be sure to have an account in MailTrap).
The parameters that you can use in this endpoint are optionally year and month and if you don't provide it by default the application will assign the current year and month, so you can use the endpoint as http://localhost:3000/api/v1/monthly_report?year=2023&month=01.


#### Search filter criteria:
* Index -> localhost:3000/api/v1/expenses
* Year -> localhost:3000/api/v1/expenses?year=2023
* Year And Month -> localhost:3000/api/v1/expenses?year=2023&month=01
* Specific date -> localhost:3000/api/v1/expenses?date=2023-01-01


#### TODOS
* JWT authentication