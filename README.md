# Jack O Translate

Jack O Translate is a versatile translation app that offers translation capabilities between a wide range of languages, including unique features like emoji and kaomoji translations. The app's standout functionality is its ability to customize the tone and context of translations, achieved through integration with the OpenAI API.

## Technologies Used

- **Language**: Ruby 3.2.2, JavaScript, HTML, CSS
- **Framework**: Rails 7.0.8

## Core Features

### Translation

- **Create New Translations**: Authenticated users can create new translations, selecting from a variety of languages (including emoji and kaomoji).
- **Customization**: Users can customize the language, tone, and context of their translations, leveraging the power of the OpenAI API.
- **Translation Management**: Users can view, edit, and delete their past translations.
- **Filtering**: The home page allows users to filter their translation history by time (e.g., past day, past week).

### User Management

- **Authentication**: User signup/login functionality with email confirmation.
- **Single Sign-On (SSO)**: Integration with Google OAuth2 for streamlined authentication.
- **Password Management**: Features for resetting passwords.
- **Profile Management**: Authenticated users can edit their username, change their password, upload a profile image, and delete their account.

### JPortal

- **Interaction Platform**: A forum-like platform where users can create, update, and delete posts.
- **Community Engagement**: Users can view all posts made by others and respond to them.

## Implementation

- **Architecture**: Built on the Ruby on Rails framework, following the MVC model.
- **User Authentication**: Utilizes the Devise gem for handling user signup, login, confirmation, and password management.
- **Email Service**: Integrates with the Sendgrid API for email functionalities.
- **Frontend**: Styled using Bootstrap 4.5.2.
- **Deployment**: The application is deployed on Heroku and can be accessed at [Jack O Translate](https://jack-o-translate-893de48ebf65.herokuapp.com/).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Ruby version 3.2.2
- Rails version 7.0.8
- PostgreSQL
- Node.js
- Yarn

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/your_username/jack-o-translate.git
   ```
2. Navigate to the project directory:
   ```sh
   cd jack-o-translate
   ```
4. Install Ruby dependencies:
   ```sh
   bundle install
   ```
5. Install JavaScript dependencies:
   ```sh
   yarn install
   ```
   
### Configuration
Set up environment variables and configuration files as needed.

### Database Creation and Initialization
1. Create the PostgreSQL database:
   ```sh
   rails db:create
   ```
2. Migrate the database:
   ```sh
   rails db:migrate
   ```

### Deployment Instructions
The application is deployed on Heroku. To deploy your version, follow Heroku's standard deployment process.

### Contributing
Contributions are welcome and greatly appreciated :)
