## System Model

### MicroService Tournament

#### Responsibility
+ Create and retrieve instances of tournaments
+ Facilitate Registration
+ Facilitatie creating Tournament schema
+ Store Tournament specific info; like poules, bouts, references to fencers and referees
#### Interface
+ createTournament
+ registerParticipant (fencer of referee)
+ getFencersPerCategory
+ createSchemaPerCategory
+ registerResults
#### Data
+ Circuit
+ Tournament
+ Poule
+ Bout

### Microservice Fencer 


## Entities

| Entity        | Description                                                                  | Attributes                                 |
|---------------|------------------------------------------------------------------------------|--------------------------------------------|
| Fencer        | Participant who fences in the tournament.                                    | name, age, n weapons, total xp             |
| Referee       | Participant who judges bouts in the tournament.                              | name, age, n weapons, total xp             |
| User          | Authorized user of the system, can edit, create schedules etc, based on role | name, role                                 |
| Viewer        | Anonymous user who can view tournament results                               |                                            |
| Tournament    |                                                                              |                                            |
| Circuit       | Series of tournaments                                                        | name                                       |
| Ledger        | Lists payments                                                               | name, date amount                          |
| Subscription  | Right to participate in specific tournament or circuit                       | type (tournament of circuit), date, period |