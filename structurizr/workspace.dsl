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
                description "Secondary inte rface for mobile users to access ticket management and sales statistics."
            }
            database = container "Database" {
                ticketDb = component "Ticket Database"
                salesStatsDb = component "Sales Statistics Database"
            }
            tableStorage = container "Table Storage" {
                description "Azure Table Storage"
            }
            blob = container "Blob" {
                blobQRC = component "Azure blob to store the QR codes and e-tickets"
            }
            authService = container "Authentication Service" {
                 description "Handles user authentication and security."

                authController = component "Controller" {
                    description "Handles HTTP requests related to authentication, including login, logout, and registration."
                    tags "Controller"
                }

                authServiceComponent = component "Service" {
                    description "Implements authentication logic like validating users, registering, and token generation."
                    tags "Service"
                }

                authRepository = component "Repository" {
                    description "Manages the interaction with the database for user credentials and authentication tokens."
                    tags "Repository"
                }

                userModel = component "User" {
                    description "Represents a user with authentication credentials and token data."
                    tags "Model"
                }

                tokenModel = component "Token" {
                    description "Represents an authentication token with user data and expiration."
                    tags "Model"
                }
            }
            paymentService = container "Payment Service" {
                description "Handles ticket purchases and payment processing."
            }
            ticketService = container "Ticket Service" {
                description "Handles the retrieval and communication with external ticketing APIs"
            }
            orderingService = container "Ordering Service" {
                description "Handles internal orders of tickets and operations with databases"
            }
        }

        externalTicketingAPI = softwareSystem "External Ticketing API" {
            description "External system that provides ticketing information and integrates with Tiqzy for ticket validation and reselling."
        }

        paymentAPI = softwareSystem "Stripe" {
            description "Stripe API"
        }

        grafana = softwareSystem "Grafana" {
            !docs docs
            !adrs adrs
            description "Visualise the metrics and statistics of Tiqzy App"
            grafanaWebApp = container "Grafana Web App" {
                description "Displays the metrics in dashboards"
            }
            metricsService = container "Metrics Service" {
                description "Gathers business metrics with the use of Prometheus"
            }
            statisticsService = container "Statistics Service" {
                description "Gathers statistics"
            }
            database-grafana = container "Database-Grafana" {
                metricsDb = component "Metrics Database"
                statsDb = component "Sales Statistics Database"
            }
        }

        // connections ticket system
        reseller -> ticketResellingSystem "Manages and resells tickets"
        buyer -> ticketResellingSystem "Purchases tickets from resellers"
        admin -> ticketResellingSystem "Oversees system operations"
        admin -> grafana "Oversees Statistics"
        webApp -> paymentService
        grafana -> webApp "Scrapes metrics and statistics"
        mobileApp -> orderingService
        authService -> externalTicketingAPI "Validates tickets"
        paymentService -> externalTicketingAPI "Processes payments"
        webApp -> orderingService "Checks ticket availability"
        webApp -> ticketService "Retrieves Tickets"
        orderingService -> ticketService "Books tickets from external source"
        orderingService -> tableStorage "Stores orders"
        ticketService -> blobQRC
        orderingService -> salesStatsDb
        ticketService -> ticketDb
        mobileApp -> ticketService
        paymentService -> paymentAPI

        //connections grafana
        grafanaWebApp -> metricsService
        grafanaWebApp -> statisticsService
        metricsService -> metricsDb
        statisticsService -> statsDb

        // C3 - AuthService
        authController -> authServiceComponent "Calls authentication logic"
        authServiceComponent -> authRepository "Fetches user credentials and tokens"
        authServiceComponent -> userModel "Reads and writes user data"
        userModel -> tokenModel "Has many"
    }

    views {
        systemContext ticketResellingSystem "Ticket-Reselling-Context" {
            description "System context diagram for the Tiqzy Ticket Reselling platform."
            include *
            autolayout
        }
        container ticketResellingSystem "Ticket-Reselling-Containers" {
            description "Containers diagram of the Tiqzy App."
            include *
            autolayout
        }
        component database "Database-Components" {
            description "Components within the Database container"
            include *
            autolayout
        }
        component blob "Blob-Components" {
            description "Components within the Blob container"
            include *
            autolayout
        }

        systemContext grafana "Grafana-Context" {
            description "System context diagram for the Grafana platform."
            include *
            autolayout
        }
        container grafana "Grafana-Containers" {
            description "Containers diagram of the Grafana App."
            include *
            autolayout
        }
        component database-grafana "Database-Grafana-Components" {
            description "Components within the Grafana Database container"
            include *
            autolayout
        }

        component authService "AuthService-Components" {
            description "Components within the Authentication Service container"
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
        // no scope defined here
    }

}
