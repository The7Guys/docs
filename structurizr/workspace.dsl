workspace {

    model {

        buyer = person "Ticket Buyer" {
            description "The user who purchases tickets from resellers through the system."
        }

        admin = person "System Administrator" {
            description "Manages the system, ensures uptime, and oversees user and ticket management."
        }

        ticketResellingSystem = softwareSystem "Ticket Reselling Mobile App" {
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

            paymentTable = container "Payment Table" {
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

            orderTable = container "Order Table" {
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

            wishlistTable = container "Wishlist Table" {
                description "Stores user wishlists in Azure Table Storage."
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

        tiqzyStats = softwareSystem "Tiqzy Stats System" {
            description "A system that manages and visualizes statistics and metrics for the Tiqzy Ticket Reselling platform."
            tags "External System"
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
        ticketResellingSystem -> externalTicketingAPI "Retrieves event information, availability, and updates stock using"

        // connections level C2 - container (ticketResellingSystem)
        buyer -> mobileApp "Browses events and purchases tickets using"
        mobileApp -> apiGateway "Sends incoming requests to"
        apiGateway -> rabbitMQ "Routes messages using"
        rabbitMQ -> authenticationService "Routes authentication requests to"
        authenticationService -> usersDatabase "Fetches user data from"
        usersDatabase -> authenticationService "Sends user data to"
        authenticationService -> emailSystem "Sends magic link emails to users using"
        rabbitMQ -> ticketService "Routes ticket requests to"
        ticketService -> externalTicketingAPI "Makes API calls using"
        ticketService -> qrCodeService "Generates QR codes using"
        qrCodeService -> blobStorage "Stores QR codes in"
        rabbitMQ -> wishlistService "Routes wishlist requests to"
        wishlistService -> wishlistTable "Stores wishlists in"
        rabbitMQ -> orderService "Routes order requests to"
        orderService -> paymentService "Processes payments using"
        paymentService -> paymentTable "Stores payment information in"
        paymentService -> paymentAPI "Processes payments using"
        orderService -> orderTable "Stores orders in"
        azureGetTicketsFunction -> paymentTable "Retrieves ticket information for invoice from"
        azureGetTicketsFunction -> blobStorage "Stores invoices in"

        // C3 - AuthService
        authController -> authServiceComponent "Calls authentication logic"
        authServiceComponent -> authRepository "Fetches user credentials and tokens"
        authServiceComponent -> userModel "Reads and writes user data"
        userModel -> tokenModel "Has many"

        // C3 - Payment Service
        paymentController -> paymentServiceComponent "Calls payment processing logic"
        paymentServiceComponent -> paymentRepository "Manages payment data"
        paymentServiceComponent -> paymentModel "Reads and writes payment data"
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
        component authenticationService "Authentication-Service-Components" {
            description "Component diagram of the Authentication Service"
            include *
            autolayout lr
        }
        component paymentService "Payment-Service-Components" {
            description "Component diagram of the Payment Service"
            include *
            autolayout lr
        }
        theme default
    }
}
