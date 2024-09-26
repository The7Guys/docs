
## Requirements
### Functional requirements
#### The tool should facilitate preregistering and registering of fencers and referees.
* preregistration info comes from an external tool so some upload mechanism should be available
* registration should be possible at several registration points
* payments should be administrated, but no bookkeeping application (just a ledger or something like that)
* subscriptions: single entry, subscription


#### Creating a tournament with poules and bouts
* Creating poules and assigning fencers based on weapontype, points
    * foil/epee/sabre short(size 0)/long (size 5)
    * points scored in previous tournaments on this weapon ie foil/epee/sabre any size
* Assigning strips to poules
* Assigning referees to poules
* generating printable poule schedules
* register points scored for fencers
* update total points for fencers
* register referee participation 
* update referee total xp

### Non-Functional requirements

#### Availability
* High availability during tournaments
* In fencing locations no internet may be possible. The solution should include hardware setup to create 
  a local network and/or facilitate internet acces by some means
* during registration at least 3 workstations should be available  
* during the rest of the tournament 2

#### Compliance
* AVG

#### Open Source
* GPL-v2

#### Recoverability
* create and restore backups

#### Response time
* registration and paymentscreens ~ 1s roundtrip
* generating poule schedules ~ 1 m roundtrip
* printing ~ 10 s per poule

#### Scalability
* registration should be able to handle ~ 600 registrations/h 
  * This translates to 10 concurrent registration desks handling 30 registrations/half hour

#### Security
* login mandatory
* secure connection backend and clients
  * intermediate solution credentials in DB, later OAuth
* RBAC
* (pre)/registration, tournament creation, etc only for staff

### Stretch goals
* Multi tenancy
* work offline in a local network with multiple clients, synchronize with online component at later stage.
* view personal results for fencers
  * RBAC tournament results for anyone, personal results for fencer only
  * question: howto couple login to fencer
* poules-lists on-line cq screen(s) in tournament hall
* life updates on-line cq screen(s) in tournament hall
  * ability to register bouts in some app
  * if bout-results are updated realtime, some result monitors
* registration by means of some personalized mobile app, based on some info only locally available
  that's not easily shared to persons off-site,   e.a. barcode, qr-code, etc
  (registration requires the fencer/referee to be on site!)


