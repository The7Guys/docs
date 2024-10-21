workspace {

    model {
        # reseller = person "Reseller" {
        #     description "The user who resells tickets using the system. Wants to track sales statistics and manage tickets."
        # }

        buyer = person "Ticket Buyer" {
            description "The user who purchases tickets from resellers through the system."
        }

        admin = person "System Administrator" {
            description "Manages the system, ensures uptime, and oversees user and ticket management."
        }

        ticketResellingSystem = softwareSystem "Ticket Reselling Mobile App" {
            !docs docs
            !adrs adrs
            description "Allows users to browse events and purchase tickets from resellers."
           
            # database = container "Database" {
            #     ticketDb = component "Ticket Database"
            #     salesStatsDb = component "Sales Statistics Database"
            #     wishlistDb = component "Wishlist Database"

            
            # authService = container "Authentication Service" {
            #      description "Handles user authentication and security."

            #     authController = component "Controller" {
            #         description "Handles HTTP requests related to authentication, including login, logout, and registration."
            #         tags "Controller"
            #     }

            #     authServiceComponent = component "Service" {
            #         description "Implements authentication logic like validating users, registering, and token generation."
            #         tags "Service"
            #     }

            #     authRepository = component "Repository" {
            #         description "Manages the interaction with the database for user credentials and authentication tokens."
            #         tags "Repository"
            #     }

            #     userModel = component "User" {
            #         description "Represents a user with authentication credentials and token data."
            #         tags "Model"
            #     }

            #     tokenModel = component "Token" {
            #         description "Represents an authentication token with user data and expiration."
            #         tags "Model"
            #     }
            # }
            mobileApp = container "Mobile App" {
                description "Primary interface for users to browse and purchase tickets."
                tags "Mobile App"
            }
            apiGateway = container "API Gateway" {
                description "Handles incoming requests and routes them to the appropriate services."
            }
            rabbitMQ = container "RabbitMQ" {
                description "Message broker for asynchronous communication between services."
                tags "Message Broker"
            }
            authenticationService = container "Authentication Service" {
                description "Handles user authentication and security."
            }
            usersDatabase = container "Users Database" {
                description "Stores user data and authentication information using MariaDB."
                tags "Database"
            }
            ticketService = container "Ticket Service" {
                description "Handles the retrieval and communication with the external Tiqzy Ticketing API."
            }
            blobStorage = container "Blob Storage" {
                description "Stores QR codes for tickets and invoices."
                tags "Database"
            }
            qrCodeService = container "QR Code Service" {
                description "Generates QR codes for event tickets."
            }
            wishlistService = container "Wishlist Service" {
                description "Handles the wishlist operations."
            }
            wishlistTable = container "Wishlist Table" {
                description "Stores user wishlists in Azure Table Storage."
                tags "Database"
            }
            orderService = container "Order Service" {
                description "Handles the order operations."
            }
            orderTable = container "Order Table" {
                description "Stores user orders in Azure Table Storage."
                tags "Database"
            }
            paymentService = container "Payment Service" {
                description "Handles ticket purchases and payment processing."
            }
            paymentTable = container "Payment Table" {
                description "Stores payment information in Azure Table Storage."
                tags "Database"
            }
            azureGetTicketsFunction = container "Get Tickets Function" {
                description "Azure Function to get tickets and create invoices for users."
            }
        }

        externalTicketingAPI = softwareSystem "Tiqzy Ticketing System" {
            description "Tiqzy's ticketing system that provides ticket information, availability, and validation."
            tags "External System"
        }

        emailSystem = softwareSystem "Tiqzy Email System" {
            description "Tiqzy's email system that sends invoices/tickets to uses via email."
            tags "External System"
        }

        paymentAPI = softwareSystem "Tiqzy Payment System" {
            description "Tiqzy's payment system that processes transactions and payments using Stripe API."
            tags "External System"
        }

        firebase = softwareSystem "Firebase" {
            description "Firebase is used to enable push notifications."
            tags "External System"
        }

        tiqzyStats = softwareSystem "Tiqzy Application Statistics and Metrics" {
            !docs docs
            !adrs adrs
            description "Alows users to view and manage statistics and metrics for the Tiqzy Mobile Application."
            grafanaDashboard = container "Grafana Dashboard" {
                description "Displays statistics and metrics in a dashboard."
            }
            statisticsService = container "Statistics Service" {
                description "Gathers statistics and metrics from the Tiqzy Mobile App using Prometheus."
            }

            # tiqzyMobileApp = container "Tiqzy Mobile App" {
            #     description "Displays the metrics in dashboards"
            # }
            # metricsService = container "Metrics Service" {
            #     description "Gathers business metrics with the use of Prometheus"
            # }
            # statisticsService = container "Statistics Service" {
            #     description "Gathers statistics"
            # }
            # database-grafana = container "Database-Grafana" {
            #     metricsDb = component "Metrics Database"
            #     statsDb = component "Sales Statistics Database"
            # }
        }

        // connections level C1 - context
        buyer -> ticketResellingSystem "Browses events based on location and date and purchases tickets using"
        admin -> ticketResellingSystem "Oversees operations of"
        admin -> tiqzyStats "Manages and visualizes statistics and metrics using"
        tiqzyStats -> ticketResellingSystem "Gathers statistics and metrics from"
        ticketResellingSystem -> emailSystem "Sends tickets and invoices using"
        ticketResellingSystem -> firebase "Sends push notifications using"
        ticketResellingSystem -> paymentAPI "Processes payments using"
        emailSystem -> buyer "Sends tickets and invoices to"
        firebase
        ticketResellingSystem -> externalTicketingAPI "Retrieves event information, availability, and updates stock using"

        // connections level C2 - container (tiqzyStats)
        admin -> grafanaDashboard "Views statistics and metrics from application using"
        grafanaDashboard -> statisticsService "Displays statistics and metrics from"
        statisticsService -> grafanaDashboard "Sends statistics and metrics periodically to"
        statisticsService -> ticketResellingSystem "Gathers statistics and metrics from"

        // connections level C2 - container (ticketResellingSystem)
        buyer -> mobileApp "Browses events and purchases tickets using"
        mobileApp -> apiGateway "Sends incoming requests to"
        apiGateway -> rabbitMQ "Routes messages using"
        //authentication stuff
        rabbitMQ -> authenticationService "Routes authentication requests to"
        authenticationService -> usersDatabase "Fetches user data from"
        usersDatabase -> authenticationService "Sends user data to"
        authenticationService -> emailSystem "Sends magic link emails to users using"
        //ticket stuff
        rabbitMQ -> ticketService "Routes ticket requests to"
        ticketService -> externalTicketingAPI "Makes API calls using"
        ticketService -> qrCodeService "Generates QR codes using"
        qrCodeService -> blobStorage "Stores QR codes in"
        //wishlist process
        rabbitMQ -> wishlistService "Routes wishlist requests to"
        wishlistService -> wishlistTable "Stores wishlists in"
        wishlistTable -> wishlistService "Retrieves wishlists from"
        //ordering process
        rabbitMQ -> orderService "Routes order requests to"
        orderService -> paymentService "Processes payments using"
        paymentService -> paymentTable "Stores payment information in"
        paymentService -> paymentAPI "Processes payments using"
        orderService -> orderTable "Stores orders in"
        //azure functions
        azureGetTicketsFunction -> paymentTable "Retrieves ticket information for invoice from"
        azureGetTicketsFunction -> blobStorage "Stores invoices in"


        // C3 - AuthService
        # authController -> authServiceComponent "Calls authentication logic"
        # authServiceComponent -> authRepository "Fetches user credentials and tokens"
        # authServiceComponent -> userModel "Reads and writes user data"
        # userModel -> tokenModel "Has many"
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
        # component database "Database-Components" {
        #     description "Components within the Database container"
        #     include *
        #     autolayout
        # }
        # component blob "Blob-Components" {
        #     description "Components within the Blob container"
        #     include *
        #     autolayout
        # }

        systemContext tiqzyStats "Tiqzy-Context" {
            description "System context diagram for the Tiqzy platform."
            include *
            autolayout
        }
        container tiqzyStats "Tiqzy-Containers" {
            description "Containers diagram of the Tiqzy App."
            include *
            autolayout
        }
        # component database-grafana "Database-Grafana-Components" {
        #     description "Components within the Grafana Database container"
        #     include *
        #     autolayout
        # }

        # component authService "AuthService-Components" {
        #     description "Components within the Authentication Service container"
        #     include *
        #     autolayout
        # }

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
            element "External System" {
                background grey
            }
            element "Mobile App" {
                shape mobiledeviceportrait
            }
            element "Message Broker" {
                shape pipe
            }
            element "Database" {
                shape cylinder
            }
        }
    }

    configuration {
        // no scope defined here
    }

}
