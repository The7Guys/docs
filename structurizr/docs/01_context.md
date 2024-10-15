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

The Tiqzy platform is designed for two primary groups of users: businesses setting up reseller microsites (resellers) and end consumers purchasing tickets through these microsites. These two groups have different needs, goals, and interactions with the platform. The initial user base is expected to range from 5,000 to 15,000, with the potential for growth as new cities and countries are added.

To better understand the target user group, the following personas illustrate the users.

**Persona 1: Hannah, the Museum Ticket Reseller & Organizer**

- Age: 45
- Role: Director of Marketing at a historical museum in Amsterdam.
- Goals:
    - Increase museum ticket sales by extending the locations of where tickets are available for purchase.
    - Ensure the museum’s brand and ticketing platform(s) maintain a high standard of professionalism and user experience.
    - Use flexible pricing strategies for off-peak hours or special exhibits to boost attendance.
- Frustrations:
    - Poor integration between internal ticketing systems and reseller platforms can cause delays and booking differences.
    - Difficulty in creating promotional campaigns or discounts that reach the right audience in a timely manner and the ability to be discovered.
    - Concerned about overbooking during popular events and ensuring real-time updates to prevent customer frustration.
- Needs from Tiqzy:
    - Integration between the museum’s internal ticketing system and Tiqzy, allowing real-time updates of ticket availability and pricing.
    - Customizable Microsites: Ability to create branded microsites that allow for customization and that which presents the museum’s branding and relevant information.
    - Being able to track sales to view sales performances.
    - The ability to offer special discounts or promotions and track the success of these offers.
- User Behavior:
    - Use Tiqzy’s dashboard to review sales data and make real-time adjustments to ticket availability.
    - Regularly create promotional campaigns for special events and exhibitions.
    - Prefers a clean, simple user interface that allows quick access to key features like sales reporting and ticket inventory management.

**Persona 2: Ben, the Enthusiastic Museum Visitor (End Consumer)**

- Age: 26
- Role: Traveler across Europe
- Goals:
    - Easily find and purchase museum tickets while traveling, with no time wasted on complex booking processes.
    - Explore local events and museums, with a focus on art, history, and culture.
    - Find special deals or package offers that improves his travel experience.
- Frustrations:
    - Some ticketing platforms are slow, hard to navigate, or filled with outdated event information.
    - Hidden fees or unexpected costs during checkout can lead to frustration and distrust.
    - Finds it difficult to compare ticket options, especially when he’s unfamiliar with local events or venues.
    - Sometimes ticket availability is unclear, which can lead to disappointment if the events are sold out or inaccessible.
- Needs from Tiqzy:
    - A simple search and navigation, mobile-friendly interface that allows him to quickly filter and find museum tickets and local events in the cities he’s visiting.
    - Real-time updates of ticket availability and prices.
    - A transparent and easy to use checkout process with trusted payment methods like Stripe that avoid hidden fees.
    - Event recommendations based on his location and interests, helping him find the best museums and cultural events nearby.
- User Behavior:
    - Typically searches for tickets on his phone while traveling.
    - Tends to make fast purchase decisions.
    - Occasionally looks for bundled or discounted tickets to make the most of his visit, especially when he’s staying in a city for a limited time.

### Platform Goals and Features

Customizable reseller microsites where businesses can manage ticket sales.

Global scalability, allowing users to select the country and city they would like to purchase tickets at and view relevant venue ticket offerings.

API integration for seamless content delivery from external providers.

Stripe payment integration for easy transactions.

User-friendly design, inspired by GetYourGuide.com and Tiqets.com, with flexibility in navigation and ticket advertising.

This platform seeks to establish itself as a competitive player in the ticketing industry, offering improvements on existing systems through enhanced scalability and ease of use.