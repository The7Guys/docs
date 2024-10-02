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
| Client        | Person who buys tickets for events or attractions                           | Name, Email, Password, Address, Payment Information, Tickets |
| Ticket        | A ticket for an event or attraction                                          | Event, Price, Date, Location               |
| Event         | An event or attraction that tickets can be bought for                        | Name, Description, Location, Date, Tickets          |
| Reseller      | A platform that sells tickets for events or attractions                      | Name, Logo, Website                        |
| Payment       | A payment for a ticket                                                      | Amount, Date, Payment Method, Payment Status |
| Provider      | A platform that provides tickets for events or attractions via API           | Name, URL, API, Enabled, Token             |
| Admin         | A person who manages the system                                              | Name, Email, Password                      |