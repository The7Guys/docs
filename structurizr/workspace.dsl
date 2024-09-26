workspace {

    model {
        fencer = person "Fencer" {
            description "Participant in a fencing tournament. Needs to be registered to participate. Wants to lookup his results after publishing"
        }

        tournamentOfficeStaff = person "Tournament Office Staff"
        referee = person "Referee"
        tournamentDirector = person "Tournament Director"



        fencingTournamentSystem = softwareSystem "FencingTournament" {
            !docs docs
            !adrs adrs
             description "The system automates fencing tournaments of the type JPT. It can register fencers and referees, create a tournament schedule and process tournament results"
            webApp = container "Web Frontend" {
                description "Main interface to the application.  All userdriven actions are implemented in this frontend"
            }
            mobileApp = Container "Mobile App" {
                description "Secundary interface to the application.  used to facilitate registring and result lookup"
            }
            database = Container "Database" {
                fencerDb = Component "Fencer Database"
                tournamentDb = Component "Tournament Database"
            }
            keycloak =  Container "Keycloak"
            backend =  Container "Backend" {
                fencerMS = Component "Fencer MicroServie" {
                    technology "golang"
                }
                tournamentMS = Component "Tournament MicroServie" {
                    description "Create and manage tournaments "
                    technology "Java"
                }
            }

        }

        onzeRelatiesSystem = softwareSystem "Onze Relaties" {
            description "Onze relaties is a external system which has a registration of all members of the KNAS. Among which fencers, referees and organisers. It can facilitate single signon"

        }

        fencer -> fencingTournamentSystem "Registers for the tournament and looks up tournament results"
        referee -> fencingTournamentSystem "Gets poule assignments and returns results"
        tournamentOfficeStaff -> fencingTournamentSystem "Handles registration and payments"
        tournamentDirector -> fencingTournamentSystem "Generates poules and bouts"

        keycloak -> onzeRelatiesSystem
        webApp -> fencerMS
        webApp -> tournamentMS
        webApp -> keycloak
        mobileApp -> tournamentMS
        mobileApp -> keycloak
        fencerMS -> fencerDb
        tournamentMS -> tournamentDb



    }

    views {
        systemContext fencingTournamentSystem "Context-Diagram" {
            description "The fencing tournament system "
            include *
            autolayout
        }

        container fencingTournamentSystem "Container-Diagram" {
            include *
        }

        component backend "Backend-Component-Diagram" {
            include *
        }

        component database "Database-Component-Diagram" {
            include *
        }




        styles {
            element "Element" {
                color white
            }
            element "Software System" {
                background seagreen
            }
            element "Container" {
                background mediumseagreen
            }
            element "Component"{
                background lightseagreen
            }
            element "Person" {
                background dodgerblue
                shape person
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}