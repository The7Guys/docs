
## Requirements
### Functional requirements

These are the basic features and functions the Tiqzy app needs to have to work properly: 

**Reseller Microsite Setup**: Resellers are the platforms that want to sell tickets through the ticket platforms. A microsite is mini website that is linked to a reseller Id, when used in the URL, directs users to a website with the reseller’s tickets that they want to sell. The system must allow businesses to create their own ticket-selling microsite, where they can add their brand logos, images, and payment options.  

 

**Country and City Selection**: Users should be able to select their country and city in the app to view tickets for events or attractions available in their area. These tickets will be grouped by activity type. For example, all tickets for boat activities in Amsterdam will be grouped together, and bus tours will also be grouped together differently. 

  

**Ticket Browsing and Purchase**: The app must allow users to browse through available tickets, view details, and purchase tickets directly. It will also allow users to sort through tickets by activity, country, cities etc. 

 

  

**Payment Integration**: The platform must integrate with Stripe for secure online payments, allowing users to pay for tickets easily and safely. 

  

**API Integration**: The system must connect to external ticket providers (via API) to automatically update ticket listings, prices, and availability in real-time. These APIs will also receive information from the businesses like museums which want to sell their tickets through the Tiqzy platform. 

  

**Ticket Management Dashboard**: Resellers must have access to a dashboard where they can manage their tickets (e.g., adding, removing, or editing tickets) and track sales and bookings. 

  

**Ticket Price Management**: The system must support different ticket pricing options, such as full price, discounted, or free tickets, depending on the reseller's preferences. 

  
**Booking Overview**: Resellers should be able to see a list of all booked tickets, 	including information like who bought them and how much they paid. This will be 	linked to their accounts which allow for more visibility. 


### Non-Functional requirements

**Scalability**: The application must scale horizontally, to accommodate a growing number of users and transactions without performance loss. To achieve this, load balancing will be implemented with the application to distribute traffic efficiently. 

 

**Performance**: The application should perform well on any smartphone, with low loading speeds under normal network conditions. The overall user experience while navigating the application must be smooth, and interactions should be performed without lag. 

 

**User-friendly design**: The app should be designed a simple and easy-to-use way, with a clean layout, drawing inspiration from other ticket (re)selling platforms like GetYourGuide or Tiqets. 

 

**Security**: The application must protect all user data by using encryption (SSL/TLS) and secure authentication mechanisms (OAuth 2.0, JWT tokens). The payment processing, done through Stripe, must also implement security measures. 

 

**Availability**: The app should be highly available and reliable, to ensure a minimum level of downtime. To achieve this, logging, error handling, and failover mechanisms will be implemented within the application. 

 

**Integration with external platforms**: The application must integrate smoothly with external ticketing platforms via their APIs, to ensure easy and fast updates to ticket information. 

 

**Localization**: The app should be able to support multiple countries and cities, and it should be adaptable to include more locations if needed. For each location, all tickets for all events located there should be featured on the page. 
