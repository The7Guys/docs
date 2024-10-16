## System Model

### Authentication Service

#### Responsibility
+ Manage user authentication
+ Manage user roles
+ Manage user permissions
+ Manage user sessions
+ Send magic links for passwordless login

#### Interface
+ login
+ logout
+ register
+ sendMagicLink

#### Data
+ User
+ Role
+ Token
+ MagicLink

### Payment Service

#### Responsibility
+ Create payment
+ Manage payment methods
+ Manage payment status
+ Access payment history
+ Retrieve payment information
+ Handle callback from payment gateway
+ Store and manage payment information

#### Interface
+ createPayment
+ getPaymentMethods
+ getPayment
+ getPaymentHistory
+ handleCallback
+ getPaymentInformation

#### Data
+ Payment
+ PaymentMethod
+ PaymentStatus
+ PaymentInformation

### Ordering Service

#### Responsibility
+ Create order
+ Manage order status
+ Access order history
+ Retrieve order information
+ Handle order cancellation

#### Interface
+ createOrder
+ getOrder
+ getOrderHistory
+ cancelOrder

#### Data
+ Order
+ OrderStatus

### Ticket Service
+ Retrieve tickets from provider
+ Manage ticket availability
+ Get Ticket information
+ Get Ticket availability
+ Generate Apple Wallet Pass

#### Interface
+ getTicketsFromProvider
+ getTicket
+ getTicketAvailability
+ generateAppleWalletPass

#### Data
+ Ticket
+ TicketAvailability
+ AppleWalletPass


### Wishlist Service

#### Responsibility
+ Add item to wishlist
+ Remove item from wishlist
+ Retrieve wishlist items
+ Manage wishlist items

#### Interface
+ addItem
+ removeItem
+ getItems

#### Data
+ Wishlist
+ WishlistItem

## Entities

| Entity        | Description                                                                  | Attributes                                 |
|---------------|------------------------------------------------------------------------------|--------------------------------------------|
| User          | Person who buys tickets for events or attractions                           | First Name, Last Name, Email, Password, Payment Information, Tickets, Role, Permission, Tokens |
| Ticket        | A ticket for an event or attraction                                          | Event Name, Price, Date, Location               |
| Payment       | A payment for a ticket                                                      | Amount, Date, Payment Method, Payment Status, Payment Method, Payment Information |
| Payment Status | The status of a payment                                                      | Pending, Success, Failed, Refunded, Cancelled |
| Payment Method | A method of payment                                                          | Credit Card, Debit Card, PayPal, Bank Transfer, iDEAL, PayPal |
| Payment Information | Information about a payment method                                       | Credit Card Number, Expiry Date, CVV, Name on Card, Bank Account Number, Bank Account Name, Bank Name, Bank Branch, Bank Branch Code, Bank Account Type, Bank Account Holder Name, Bank Account Holder Address, Bank Account Holder Phone Number, Bank Account Holder Email |
| Order         | An order for tickets                                                         | Tickets, Date, Status, Payment, User, Order Number |
| Order Status  | The status of an order                                                       | Pending, Confirmed, Cancelled, Refunded, Completed |
| Role          | A role for a user                                                            | Admin, User, Reseller, Support |
| Token         | A token for user authentication                                               | Access Token, Refresh Token, Expiry Date, User |
| Ticket Availability | The availability of tickets for an event or attraction                    | Event Name, Date, Location, Available Tickets, Total Tickets |
| Apple Wallet Pass | A pass for Apple Wallet                                                     | Pass Type, Pass Information |
| Wishlist      | A list of items that a user wants to buy in the future                       | Wishlist Items, User |
| Wishlist Item | An item in a wishlist                                                        | Name, Description, Price, Image, URL |
| Magic Link    | A link that allows a user to login without a password                        | Link, Expiry Date, User |