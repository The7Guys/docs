## Application from a quality perspective
To be able to make sure that the application is robust, and that we are building a secure and functional app, these are some things we wish to implement.

### Validation (are we building the right system)
- **Feedback on the requirements** -- meeting: Conduct meetings with client to gather feedback on the requirements and ensure the system being built aligns with their needs.

- **User testing**: Involve end-users in testing the application to validate that it meets their expectations and requirements. It will also help for us to know how the users are experiencing the application and any problems they're having.

- **Retrospective/demo**: Conduct regular demos and retrospectives to review the progress and get feedback from the team and client. We will then fix the processes that are not working well and improve the ones we already have with feedback.

- **Prototype**: Create low-fidelity prototypes to get early feedback from users and also the client on the design and functionality of the application.


### Verification (are we building the system right)
- **Unit tests**: Implement automated unit tests to verify the functionality of individual components or modules of the application.

- **Integration testing**: Conduct tests to ensure the different components of the application work together seamlessly.

- **CDC (Consumer-Driven Contract) testing**: Verify the compatibility between the application and its dependencies by testing the contract between the consumer and provider.

- **End-to-end testing**: Perform comprehensive tests that simulate real-world user scenarios and validate the entire application flow.

- **Static code check**: Analyze the codebase using static code analysis tools to identify and address potential issues, such as code quality, security vulnerabilities, and code consistency.


### Exploration (how can the system be abused/used in other ways)
To prevent the application from being abused, you can consider the following measures:

- **Input Validation**: Implement robust input validation mechanisms to sanitize and validate all user inputs, preventing common web application vulnerabilities like SQL injection, cross-site scripting (XSS), and command injection.

- **Access Controls**: Implement a comprehensive access control system that enforces the principle of least privilege. This includes role-based access controls, multi-factor authentication, and fine-grained permissions to limit unauthorized access and actions.

- **Security Headers and Policies**: Configure appropriate security headers (e.g., Content Security Policy, X-Frame-Options, X-XSS-Protection) and policies to mitigate common web application vulnerabilities and protect against client-side attacks.

- **Secure Coding Practices**: Adhere to secure coding practices, such as using parameterized queries for database interactions, avoiding the use of unsafe functions, and implementing input validation and output encoding consistently throughout the codebase.

- **Secure Configuration Management**: Ensure that the application and its infrastructure are configured securely, with regular updates and patches applied to address known vulnerabilities.

- **Logging and Monitoring**: Implement robust logging and monitoring mechanisms to detect and respond to suspicious activities, security incidents, and potential abuse attempts.

- **User Education**: Educate users on secure practices, such as reporting suspicious activities, avoiding the use of weak or shared credentials, and being cautious of social engineering attacks.

- **Implementing an API gateway**: Using an API gateway with rate limiting and load balancing, it will protect our backend services from being overwhelmed by too many requests. And Bb centralizing authentication and authorization, it reduces security vulnerabilities and blocks unauthorized requests


