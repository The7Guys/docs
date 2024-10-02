## Context
Tiqzy is Whitelabel ticket reselling software package owned by a Dutch entrepreneur and developed by a team in London that will work with the student team. The current version is linked to various API’s related to ticket sales. These API’s usually work with timeslot (since COVID). For example: Museum tickets now have a time specified at which the visitor can enter.
The company would like their software to be more suitable for mobile users (the ticket resellers will be the users), for example by displaying sales statistics. Students are invited to think about the direction in which this software will develop. They will be supported when it comes to things like making API connections.
The current software is entirely written in PHP.

![](embed:Ticket-Reselling-Context)

## System story

The Tiqzy platform is designed as a reseller system that allows businesses to sell tickets under their own brand. Tiqzy sets up microsites for resellers, such as hotels, museums, or other businesses, enabling them to manage and sell tickets through their own platform-branded microsite. The system provides resellers with tools to customize their microsite by adding logos, images, payment methods, and other relevant details. It offers flexibility in ticket pricing (full price, discounted, or free) and connects with external platforms via APIs.

The platform's goal is to support global scalability for discovery and selling, offering users an easy-to-navigate interface where they can select a country and city, view local ticket options, and purchase them seamlessly. Tiqzy aims to expand the platform by increasing the number of cities, thereby growing the user base. A core feature is its integration with external ticketing providers via API, ensuring up-to-date content is delivered to the app without manual upload. Stripe is used as the payment platform.

Tiqzy is looking to implement a cloud-based backend architecture that supports scalability as the platform's user base grows. Initially, the system will be designed to support a smaller user base averaging 5,000 users, with the ability to scale seamlessly to accommodate up to 50,000 users and beyond as demand increases. The goal is to have an infrastructure that can dynamically expand in response to user growth, ensuring that the platform remains fast and reliable at all stages.

Their design inspiration is drawn from similar systems like GetYourGuide.com and Tiqets.com with a goal to improve existing traditional user workflows. The system seeks to balance recognizable design elements with improved user experience, providing a streamlined, and intuitive ticketing experience.

### Target User Group

The application is built for a wide range of users, from businesses looking to resell tickets to consumers seeking quick access to local events and attractions. The target users are both the companies setting up the reseller platforms and the end consumers purchasing tickets. The initial audience is expected to be between 5,000 and 15,000 users, with growth dependent on the addition of new cities and countries to the platform.

### Platform Goals and Features

Customizable reseller microsites where businesses can manage ticket sales.

Global scalability, allowing users to select the country and city they would like to purchase tickets at and view relevant venue ticket offerings.

API integration for seamless content delivery from external providers.

Stripe payment integration for easy transactions.

User-friendly design, inspired by GetYourGuide.com and Tiqets.com, with flexibility in navigation and ticket advertising.

This platform seeks to establish itself as a competitive player in the ticketing industry, offering improvements on existing systems through enhanced scalability and ease of use.