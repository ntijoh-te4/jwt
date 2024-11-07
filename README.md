# Vue JWT Ddemo
JWT Demo med Vue3-frontend. Ruby, Sinatra och SQlite backend. Authentisering med JWT.

### Uppgift
Bara när du är inloggad har du rättigheter att se en lista på alla användare i databasen. Knappen i menyn döljs / visas.

 - Ta reda på hur appen vet att du är inloggad och då ska visa eller ej visa menyn.
 - Lägg till en ny funktion som också styrs på inloggad / ej inloggad.

## Backend
Ruby med Sinatra och SQLite. 

* Project setup: ```bundle install```
* Seed DB: ```rake seed```
* Run backend: ```rake run```
* Seeda databasen via webbläsaren http://localhost:9292/api/v1/reset/

Behöver du så ändra ruby-version med ```chruby``` (tex ```chruby ruby-3.1.2```) och använd ```ruby-install``` för att installera versioner.

## Frontend
Vue3 med VueX.

Appen startas på: http://localhost:8080/ 
Testanvändare ola med lösenord 123

* Project setup: ```yarn install```
* Compiles and hot-reloads for development: ```yarn serve```
