![Personal Blog](personal-blog.webp)

# Personal Blog Platform

> **A free and open-source personal blogging platform** built with modern web technologies, designed to help you share your thoughts, connect with readers, and build a vibrant online community.

[![Ruby](https://img.shields.io/badge/Ruby-3.2.0-red.svg)](https://www.ruby-lang.org/)
[![Rails](https://img.shields.io/badge/Rails-7.0.3+-red.svg)](https://rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Latest-blue.svg)](https://www.postgresql.org/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5.2-purple.svg)](https://getbootstrap.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 🌟 Overview

This is a **beautifully crafted, full-featured personal blogging platform** that I've spent **8 months** developing as an expert software engineer. Built with efficiency and creativity in mind, it combines the power of Ruby on Rails with modern frontend technologies to deliver a seamless blogging experience.

Whether you're a writer, developer, or content creator, this platform provides everything you need to:

-   ✍️ **Write and publish** rich, engaging blog posts
-   💬 **Interact with readers** through comments and discussions
-   👥 **Build a community** with friendship and follow features
-   🏷️ **Organize content** with tags and categories
-   📊 **Track engagement** with likes and view counts
-   🔍 **Optimize for search engines** with SEO-friendly URLs

---

## ✨ Key Features

### 📝 Content Management

-   **Rich Text Editor**: Powered by Action Text (Trix) for beautiful, formatted content
-   **Media Support**: Upload and embed images, videos, and files with Active Storage
-   **SEO-Friendly URLs**: Automatic slug generation with FriendlyId for better search rankings
-   **Draft & Publish**: Control when your content goes live
-   **View Analytics**: Track post views and engagement metrics

### 💬 Social Interaction

-   **Nested Comments**: Threaded discussions with unlimited nesting levels
-   **Like System**: Let readers show appreciation for your posts
-   **Friendship System**: Follow other bloggers and build your network
    -   Send and receive friend requests
    -   Accept, decline, or block connections
    -   Manage your social graph

### 🏷️ Content Organization

-   **Tagging System**: Categorize posts with multiple tags
-   **Related Posts**: Discover similar content automatically
-   **Search & Filter**: Find posts by tags, authors, or keywords

### 👤 User Features

-   **User Profiles**: Customizable profiles with avatar uploads
-   **Authentication**: Secure user accounts with Devise
-   **Personal Dashboard**: Manage your posts, comments, and connections
-   **Activity Tracking**: Monitor your sign-ins and account activity

### 🎨 Modern UI/UX

-   **Responsive Design**: Beautiful Bootstrap 5 interface that works on all devices
-   **Fast & Smooth**: Turbo Rails for lightning-fast page transitions
-   **Interactive Elements**: Stimulus controllers for dynamic user interactions
-   **Accessibility**: Built with web standards and best practices

---

## 🛠️ Technology Stack

### Backend

-   **Ruby** `3.2.0` - Modern, elegant programming language
-   **Rails** `7.0.3+` - Robust web application framework
-   **PostgreSQL** - Powerful, open-source relational database
-   **Puma** - High-performance web server
-   **Devise** - Flexible authentication solution
-   **FriendlyId** - SEO-friendly URL slugs
-   **Pagy** - Fast, lightweight pagination
-   **Action Text** - Rich text content and editing
-   **Active Storage** - File uploads and attachments

### Frontend

-   **Bootstrap 5.2** - Modern CSS framework
-   **Bootstrap Icons** - Beautiful icon library
-   **Stimulus** - JavaScript framework for the HTML you already have
-   **Turbo Rails** - The speed of a single-page application without the complexity
-   **Trix** - Rich text editor
-   **ESBuild** - Fast JavaScript bundler
-   **Sass** - CSS preprocessor
-   **Validate.js** - Client-side form validation

### Development Tools

-   **RSpec** - Behavior-driven development for Ruby
-   **Capybara** - Integration testing framework
-   **Solargraph** - Ruby language server
-   **Faker** - Generate fake data for testing

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

-   **Ruby** `3.2.0` or higher
-   **Rails** `7.0.3` or higher
-   **PostgreSQL** (latest version)
-   **Node.js** and **Yarn** (for JavaScript dependencies)
-   **Bundler** (Ruby gem manager)

### Installation

1. **Clone the repository**

    ```bash
    git clone https://github.com/yourusername/personal-blog.git
    cd personal-blog
    ```

2. **Install Ruby dependencies**

    ```bash
    bundle install
    ```

3. **Install JavaScript dependencies**

    ```bash
    yarn install
    ```

4. **Set up the database**

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed  # Optional: Load sample data
    ```

5. **Configure environment variables**

    ```bash
    cp .env.example .env
    # Edit .env with your configuration
    ```

6. **Start the development server**

    ```bash
    bin/dev
    # Or separately:
    # rails server (in one terminal)
    # yarn build --watch (in another terminal)
    ```

7. **Visit the application**
    ```
    http://localhost:3000
    ```

### Production Deployment

For production deployment, ensure you:

-   Set up environment variables securely
-   Configure PostgreSQL connection
-   Set up Active Storage (local, S3, or other service)
-   Configure Action Cable for real-time features
-   Set up email delivery (SMTP or service like SendGrid)
-   Enable SSL/HTTPS
-   Configure asset compilation

---

## 📁 Project Structure

```
personal-blog/
├── app/
│   ├── assets/          # Stylesheets, images, and compiled assets
│   ├── channels/         # Action Cable channels
│   ├── controllers/      # Application controllers
│   ├── helpers/         # View helpers
│   ├── javascript/      # JavaScript controllers and utilities
│   ├── jobs/            # Background jobs
│   ├── mailers/         # Email templates
│   ├── models/          # ActiveRecord models
│   └── views/           # ERB templates
├── config/              # Application configuration
├── db/                  # Database migrations and schema
├── spec/                # RSpec test files
└── public/              # Static assets
```

---

## 🧪 Testing

Run the test suite:

```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/models/post_spec.rb

# Run with coverage
COVERAGE=true bundle exec rspec
```

---

## 🤝 Contributing

Contributions are welcome! This is an open-source project, and I'd love to see your ideas and improvements.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Guidelines

-   Follow Ruby style guide and Rails conventions
-   Write tests for new features
-   Update documentation as needed
-   Be respectful and constructive in discussions

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🙏 Acknowledgments

-   Built with love using Ruby on Rails
-   Inspired by the need for a simple, powerful blogging platform
-   Thanks to all the open-source contributors whose work made this possible

---

## 📧 Contact & Support

-   **Issues**: [GitHub Issues](https://github.com/yourusername/personal-blog/issues)
-   **Discussions**: [GitHub Discussions](https://github.com/yourusername/personal-blog/discussions)

---

## 🌈 Roadmap

Future enhancements planned:

-   [ ] Email notifications for comments and likes
-   [ ] RSS feed support
-   [ ] Advanced search functionality
-   [ ] Post scheduling
-   [ ] Analytics dashboard
-   [ ] Multi-language support
-   [ ] Dark mode theme
-   [ ] Mobile app API

---

<div align="center">

**⭐ Star this repo if you find it helpful! ⭐**

Made with ❤️ by an expert software engineer

</div>
