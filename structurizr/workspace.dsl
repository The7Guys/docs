workspace {

    model {
        reseller = person "Reseller" {
            description "The user who resells tickets using the system. Wants to track sales statistics and manage tickets."
        }

        buyer = person "Ticket Buyer" {
            description "The user who purchases tickets from resellers through the system."
        }

        admin = person "System Administrator" {
            description "Manages the system, ensures uptime, and oversees user and ticket management."
        }

        ticketResellingSystem = softwareSystem "Tiqzy Ticket Reselling" {
            !docs docs
            !adrs adrs
            description "The system that facilitates the reselling of tickets, including ticket management, sales statistics, and purchasing options."
            webApp = container "Web Frontend" {
                description "Primary interface for users to buy, sell, and manage tickets."
            }
            mobileApp = container "Mobile App" {
                description "Secondary interface for mobile users to access ticket management and sales statistics."
            }
            database = container "Database" {
                ticketDb = component "Ticket Database"
                salesStatsDb = component "Sales Statistics Database"
            }
            authService = container "Authentication Service" {
                description "Handles user authentication and security."
            }
            paymentService = container "Payment Service" {
                description "Handles ticket purchases and payment processing."
            }
        }

        externalTicketingAPI = softwareSystem "External Ticketing API" {
            description "External system that provides ticketing information and integrates with Tiqzy for ticket validation and reselling."
        }

        reseller -> ticketResellingSystem "Manages and resells tickets"
        buyer -> ticketResellingSystem "Purchases tickets from resellers"
        admin -> ticketResellingSystem "Oversees system operations"

        webApp -> ticketDb "Fetches ticket data"
        webApp -> salesStatsDb "Fetches sales statistics"
        mobileApp -> ticketDb
        mobileApp -> salesStatsDb
        authService -> externalTicketingAPI "Validates tickets"
        paymentService -> externalTicketingAPI "Processes payments"
    }

    views {
        systemContext ticketResellingSystem "Ticket-Reselling-Context" {
            description "System context diagram for the Tiqzy Ticket Reselling platform."
            include *
            autolayout
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
