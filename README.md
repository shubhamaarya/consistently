# README

This README would normally document whatever steps are necessary to get the
application up and running.

Habit Tracker Rails App
A modern Rails 8 application for tracking habits with interactive UI powered by Hotwire (Turbo + Stimulus), background job processing using Sidekiq, and styling with TailwindCSS

Features
User authentication with Devise

Habit creation, editing, and tracking

Real-time UI updates with Turbo Streams

Background processing with Sidekiq and Redis

Scheduled weekly email summaries using Sidekiq Cron

Responsive design with TailwindCSS

PostgreSQL as the database

Tech Stack
Ruby on Rails 8.0.2

PostgreSQL

Sidekiq + Redis for background jobs

Turbo Rails and Stimulus Rails for Hotwire frontend

Tailwind CSS for styling

Devise for authentication

Importmap for managing JavaScript dependencies

Foreman for managing Procfile and development processes

Setup Instructions
Prerequisites
Ruby 3.x

PostgreSQL

Redis

Node.js & Yarn (for JS tooling if needed)

Bundler
1: Install gems:
bundle install
2 Setup database:
rails db:create
rails db:migrate

3: Install Tailwind CSS:
rails tailwindcss:install
4: Start Redis server (if not running):
redis-server
5: Start Sidekiq (in a separate terminal):
bundle exec sidekiq
