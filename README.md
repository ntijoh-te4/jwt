# Vue JWT Ddemo
JWT Demo med Vue3-frontend. Ruby, Sinatra och SQlite backend. Authentisering med JWT.

När du är inloggad i appen får du lov att lista användare. När du inte är inloggad får du inte lov att lista användare.

## Backend
Ruby (v3.1.x) med Sinatra och SQLite. Ändra ruby-version med ```chruby``` (tex ```chruby ruby-3.1.2```). Behöver du installera en version använder du ```ruby-install```.

* Project setup: ```bundle install```
* Seed DB: ```rake seed```
* Run backend: ```rake run```
* Seeda databasen via webbläsaren http://localhost:9292/api/v1/reset/

## Frontend

Appen startas på: http://localhost:8080/ 
Testanvändare ola med lösenord 123

* Project setup: ```yarn install```
* Compiles and hot-reloads for development: ```yarn serve```
* Compiles and minifies for production: ```yarn build```
* Lints and fixes files: ```yarn lint```
