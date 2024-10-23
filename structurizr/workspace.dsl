workspace {

    model {

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

                authController = component "Auth Controller" {
                    description "Handles HTTP requests related to login, logout, and registration."
                    tags "Controller"
                }

                authServiceComponent = component "Auth Service" {
                    description "Handles authentication logic like login, logout, and token generation."
                    tags "Service"
                }

                authRepository = component "Auth Repository" {
                    description "Interacts with the database for user credentials and tokens."
                    tags "Repository"
                }

                userModel = component "User Model" {
                    description "Represents user data with authentication credentials."
                    tags "Model"
                }

                tokenModel = component "Token Model" {
                    description "Represents authentication tokens."
                    tags "Model"
                }
            }

            usersDatabase = container "Users Database" {
                description "Stores user data and authentication information using MariaDB."
                tags "Database"
            }

            paymentService = container "Payment Service" {
                description "Handles ticket purchases and payment processing."

                paymentController = component "Payment Controller" {
                    description "Handles payment requests like creating payments, retrieving payment history."
                    tags "Controller"
                }

                paymentServiceComponent = component "Payment Service" {
                    description "Implements the logic for processing payments and communicating with payment gateways."
                    tags "Service"
                }

                paymentRepository = component "Payment Repository" {
                    description "Interacts with the database for storing payment data."
                    tags "Repository"
                }

                paymentModel = component "Payment Model" {
                    description "Represents payment data."
                    tags "Model"
                }
            }

            paymentTable = container "Payment Database" {
                description "Stores payment information in Azure Table Storage."
                tags "Database"
            }

            orderService = container "Order Service" {
                description "Handles the order operations."

                orderController = component "Order Controller" {
                    description "Handles requests for creating and retrieving orders."
                    tags "Controller"
                }

                orderServiceComponent = component "Order Service" {
                    description "Implements the logic for managing orders."
                    tags "Service"
                }

                orderRepository = component "Order Repository" {
                    description "Interacts with the database for storing order data."
                    tags "Repository"
                }

                orderModel = component "Order Model" {
                    description "Represents order data."
                    tags "Model"
                }
            }

            orderTable = container "Order Database" {
                description "Stores user orders in Azure Table Storage."
                tags "Database"
            }

            ticketService = container "Ticket Service" {
                description "Handles the retrieval and communication with the external Tiqzy Ticketing API."

                ticketController = component "Ticket Controller" {
                    description "Handles requests related to tickets, like retrieving availability and generating Apple Wallet Passes."
                    tags "Controller"
                }

                ticketServiceComponent = component "Ticket Service" {
                    description "Implements the logic for retrieving tickets from external providers."
                    tags "Service"
                }

                ticketRepository = component "Ticket Repository" {
                    description "Interacts with the external ticket provider API."
                    tags "Repository"
                }

                ticketModel = component "Ticket Model" {
                    description "Represents ticket data."
                    tags "Model"
                }
            }

            qrCodeService = container "QR Code Service" {
                description "Generates QR codes for event tickets."

                qrCodeController = component "QR Code Controller" {
                    description "Handles requests for generating QR codes."
                    tags "Controller"
                }

                qrCodeServiceComponent = component "QR Code Service" {
                    description "Implements the logic for generating QR codes."
                    tags "Service"
                }

                qrCodeRepository = component "QR Code Repository" {
                    description "Interacts with the database to store QR codes."
                    tags "Repository"
                }
            }

            blobStorage = container "Blob Storage" {
                description "Stores QR codes for tickets and invoices."
                tags "Database"
            }

            wishlistService = container "Wishlist Service" {
                description "Handles the wishlist operations."

                wishlistController = component "Wishlist Controller" {
                    description "Handles requests for managing wishlists."
                    tags "Controller"
                }

                wishlistServiceComponent = component "Wishlist Service" {
                    description "Implements logic for adding, removing, and retrieving wishlist items."
                    tags "Service"
                }

                wishlistRepository = component "Wishlist Repository" {
                    description "Interacts with the database to manage wishlists."
                    tags "Repository"
                }

                wishlistModel = component "Wishlist Model" {
                    description "Represents wishlist data."
                    tags "Model"
                }
            }

            wishlistTable = container "Wishlist Database" {
                description "Stores user wishlists in Azure Table Storage."
                tags "Database"
            }

            azureGetTicketsFunction = container "Get Tickets Function" {
                description "Azure Function to get tickets and create invoices for users."

                timerTrigger = component "Timer Trigger" {
                    description "Triggers the function to run periodically."
                }

                invoiceGenerator = component "Invoice Generator" {
                    description "Generates invoices for users."
                }
            }
        }

        externalTicketingAPI = softwareSystem "Tiqzy Ticketing System" {
            description "Tiqzy's ticketing system that provides ticket information, availability, and validation."
            tags "External System"
        }

        emailSystem = softwareSystem "Tiqzy Email System" {
            description "Tiqzy's email system that sends invoices/tickets to users via email."
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

                # metricsCollector = component "Metrics Collector" {
                #     description "Scrapes raw data from the Ticket Reselling System using Prometheus."
                # }

                # dataProcessor = component "Data Processor" {
                #     description "Processes and normalizes raw metrics into useful data points."
                # }

                # statisticsController = component "Statistics Controller" {
                #     description "Handles requests for statistics and metrics."
                # }
            }
        }

        # connections level C1 - context
        buyer -> ticketResellingSystem "Browses events based on location and date and purchases tickets using"
        admin -> ticketResellingSystem "Oversees operations of"
        admin -> tiqzyStats "Manages and visualizes statistics and metrics using"
        tiqzyStats -> ticketResellingSystem "Gathers statistics and metrics from"
        ticketResellingSystem -> emailSystem "Sends tickets and invoices using"
        ticketResellingSystem -> firebase "Sends push notifications using"
        ticketResellingSystem -> paymentAPI "Processes payments using"
        emailSystem -> buyer "Sends tickets and invoices to"
        firebase -> buyer "Sends push notifications to"
        ticketResellingSystem -> externalTicketingAPI "Retrieves event information, availability, and updates stock using"

        # connections level C2 - container (tiqzyStats)
        admin -> grafanaDashboard "Views statistics and metrics from application using"
        grafanaDashboard -> statisticsService "Displays statistics and metrics from"
        statisticsService -> grafanaDashboard "Sends statistics and metrics periodically to"
        statisticsService -> ticketResellingSystem "Gathers statistics and metrics from"

        # connections level C2 - container (ticketResellingSystem)
        # API Gateway routes requests to internal services
        buyer -> mobileApp "Browses events and purchases tickets using"
        mobileApp -> apiGateway "Sends HTTP requests to"

        # API Gateway routes requests to appropriate microservices
        apiGateway -> authenticationService "Routes authentication requests to"
        apiGateway -> orderService "Routes order requests to"
        apiGateway -> ticketService "Routes ticket requests to"
        apiGateway -> wishlistService "Routes wishlist requests to"
        apiGateway -> paymentService "Routes payment requests to"

        # RabbitMQ routes messages between microservices
        orderService -> rabbitMQ "Uses"
        ticketService -> rabbitMQ "Uses"
        paymentService -> rabbitMQ "Uses"
        wishlistService -> rabbitMQ "Uses"
        qrCodeService -> rabbitMQ "Uses"

        # Internal interactions between microservices
        authenticationService -> usersDatabase "Fetches user data from"
        paymentService -> paymentTable "Stores payment data in"
        orderService -> orderTable "Stores order data in"
        wishlistService -> wishlistTable "Stores wishlist data in"
        qrCodeService -> blobStorage "Stores QR codes in"

        # External API interactions
        ticketService -> externalTicketingAPI "Retrieves ticket information from"
        paymentService -> paymentAPI "Processes payments using"
        orderService -> emailSystem "Sends order confirmation emails using"
        wishlistService -> firebase "Sends push notifications for wishlist items using"

        # Azure function
        azureGetTicketsFunction -> paymentTable "Retrieves ticket information for invoice from"
        azureGetTicketsFunction -> blobStorage "Stores invoices in"

        # C3 - ticketService
        apiGateway -> ticketController "Sends ticket requests to"
        ticketController -> ticketServiceComponent "Uses"
        ticketController -> rabbitMQ "Uses"
        ticketServiceComponent -> ticketRepository "Uses"
        ticketServiceComponent -> ticketModel "Uses"
        ticketRepository -> externalTicketingAPI "Uses"

        # C3 - qrCodeService
        qrCodeController -> qrCodeServiceComponent "Uses"
        qrCodeController -> rabbitMQ "Uses"
        qrCodeServiceComponent -> qrCodeRepository "Uses"
        qrCodeRepository -> blobStorage "Uses"

        # C3 - wishlistService
        wishlistController -> wishlistServiceComponent "Uses"
        wishlistController -> rabbitMQ "Uses"
        wishlistServiceComponent -> wishlistRepository "Uses"
        wishlistServiceComponent -> wishlistModel "Uses"
        wishlistRepository -> wishlistTable "Uses"
        wishlistServiceComponent -> firebase "Uses"

        # C3 - authenticationService
        apiGateway -> authController "Sends authentication requests to"
        authController -> authServiceComponent "Uses"
        authServiceComponent -> authRepository "Uses"
        authRepository -> usersDatabase "Uses"
        authServiceComponent -> userModel "Uses"
        authServiceComponent -> tokenModel "Uses"
        authServiceComponent -> emailSystem "Uses"

        # C3 - orderService
        apiGateway -> orderController "Sends order requests to"
        orderController -> orderServiceComponent "Uses"
        orderController -> rabbitMQ "Uses"
        orderServiceComponent -> orderRepository "Uses"
        orderServiceComponent -> orderModel "Uses"
        orderRepository -> orderTable "Uses"
        orderServiceComponent -> emailSystem "Uses"

        # C3 - paymentService
        apiGateway -> paymentController "Sends payment requests to"
        paymentController -> paymentServiceComponent "Uses"
        paymentController -> rabbitMQ "Uses"
        paymentServiceComponent -> paymentRepository "Uses"
        paymentServiceComponent -> paymentModel "Uses"
        paymentRepository -> paymentTable "Uses"
        paymentServiceComponent -> paymentAPI "Uses"

        # C3 - azureGetTicketsFunction
        timerTrigger -> invoiceGenerator "Triggers"
        invoiceGenerator -> paymentTable "Retrieves ticket information from"
        invoiceGenerator -> blobStorage "Stores invoices in"
    }

    views {
        # systemContext ticketResellingSystem "Ticket-Reselling-Context" {
        #     description "System context diagram for the Tiqzy Ticket Reselling platform."
        #     include *
        #     autolayout
        # }
        # container ticketResellingSystem "Ticket-Reselling-Containers" {
        #     description "Containers diagram of the Tiqzy App."
        #     include *
        #     autolayout
        # }
        # component authenticationService "Authentication-Service-Components" {
        #     description "Component diagram of the Authentication Service"
        #     include *
        #     autolayout lr
        # }
        # component paymentService "Payment-Service-Components" {
        #     description "Component diagram of the Payment Service"
        #     include *
        #     autolayout lr
        # }
        # theme default

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
        component ticketService "Ticket-Service-Components" {
            description "Component diagram of the Ticket Service"
            include *
            autolayout lr
        }
        component qrCodeService "QR-Code-Service-Components" {
            description "Component diagram of the QR Code Service"
            include *
            autolayout lr
        }
        component wishlistService "Wishlist-Service-Components" {
            description "Component diagram of the Wishlist Service"
            include *
            autolayout lr
        }
        component authenticationService "Authentication-Service-Components" {
            description "Component diagram of the Authentication Service"
            include *
            autolayout lr
        }
        component orderService "Order-Service-Components" {
            description "Component diagram of the Order Service"
            include *
            autolayout lr
        }
        component paymentService "Payment-Service-Components" {
            description "Component diagram of the Payment Service"
            include *
            autolayout lr
        }
        component azureGetTicketsFunction "Azure-Get-Tickets-Function-Components" {
            description "Component diagram of the Azure Get Tickets Function"
            include *
            autolayout lr
        }
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

        styles {
            element "Person" {
                background dodgerblue
                shape person
                color #ffffff
            }
            element "External System" {
                background grey
                color #ffffff
            }
            element "Software System" {
                background #107a27
                color #ffffff
            }
            element "Container" {
                background #1ab83c
                color #ffffff
            }
            element "Mobile App" {
                shape mobiledeviceportrait
            }
            element "Message Broker" {
                shape pipe
                background #b00000
                color #ffffff
            }
            element "Database" {
                shape cylinder
                background #83fc9e
                color #000000
            }
            element "Controller" {
                
            }
        }
    }
    configuration {
        // no scope defined here
    }
}
