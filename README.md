# Vue JWT Ddemo
JWT Demo med Vue3-frontend. Ruby, Sinatra och SQlite backend. Authentisering med JWT.

### Uppgift
När du är inloggad i appen får du lov att lista användare. När du inte är inloggad får du inte lov att lista användare. 

 - Ta reda på hur appen vet att du är inloggad och då ska visa / ej visa menyn.
 - Lägg till en ny funktion som också styrs på inloggad / ej inloggad.

## Backend
Ruby (v3) med Sinatra och SQLite. Ändra ruby-version med ```chruby``` (tex ```chruby ruby-3.1.2```). Behöver du installera en version använder du ```ruby-install```.

* Project setup: ```bundle install```
* Seed DB: ```rake seed```
* Run backend: ```rake run```
* Seeda databasen via webbläsaren http://localhost:9292/api/v1/reset/

För att kuna köra Backend på Ruby 3.2 behöver du installera EventMachine 1.2.7 vilket Bundler inte verkar kunna. Läs isf. https://www.jessesquires.com/blog/2023/01/18/eventmachine-failure-on-macos-ventura/

## Frontend

Appen startas på: http://localhost:8080/ 
Testanvändare ola med lösenord 123

* Project setup: ```yarn install```
* Compiles and hot-reloads for development: ```yarn serve```
* Compiles and minifies for production: ```yarn build```
* Lints and fixes files: ```yarn lint```
