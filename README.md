# **Lift Logix**

**Lift Logix** is a web application developed over the course of two weeks. Designed for dedicated gym-goers, it helps users create personalised workout programs, customise exercise plans for each split, log weights and sets, track progress with charts, and receive weight/rep recommendations.

## **Features**

During the two-week sprint, we implemented several key features that address core user needs:

- **Custom Workout Program**: Users can design a custom workout program, specifying the number of weeks and tailoring each exercise split.
- **Workout Scheduling and Tracking**: Users can start a workout session on the go or schedule workouts in advance. Completed and upcoming workouts are visualized on an interactive calendar.
- **Log Weights and Reps**: Users can log weights and repetitions across multiple sets for each exercise.
- **Receive Progressive Overloads Recommendations**: Frequent app users see their previous heaviest weight and receive tailored coaching on weights and reps for progressive improvement.
- **Completion Tracking**: Users mark workouts as completed, which updates their calendar with a green tick, offering a visual sense of achievement.
- **Progress Insights**: Users can monitor program completion rates, view their scheduled workouts in a calendar format, and track individual exercise progression through interactive line charts.

## **Technologies**

- **Languages**: Ruby on Rails, HTML, SCSS, JavaScript (Stimulus & Turbo)
- **Tools and Platforms**: Heroku (deployment), GitHub (version control), Figma(UI kit and user journey), Notion & Github projects (Agile project management and Kanban board)
- **Key Gems**: 
  - `bootstrap` - For responsive UI design
  - `simple_form` - For streamlined form handling
  - `font-awesome-sass` - For icon integration
  - `sassc-rails` - For SCSS compilation
  - `simple-calendar` - For calendar views
  - `devise` - For user authentication and session management
  - `turbo` - For smooth page updates without full reloads
  - `stimulus` - For interactive form control and page anchoring

## **My role**
- **Led Backend Development**: crafted data models with PostgreSQL, implemented routes and user stories in Ruby on Rails, and enhanced app responsiveness using JavaScript and Stimulus.
- **Agile project management**: managed project workflows, conducted daily stand-ups and maintained an updated Kanban board.
- **What I like and learnt the most**: 
  - **Optimized Routing**: Structured routes for seven data models, minimizing nesting for better readability and maintainability.
  - **Feature Creation Inspired by Personal Experience**: Developed features I always wanted in a workout app, like a calendar view for workouts and a carousel of line charts displaying exercise progression over time.
  - **Team Collaboration and Product Pitching**: Monitored our user story development using Kanban board and Agile Project Management. Had the rewarding experience of pitching this product alongside an amazing team.
    <a href="https://www.youtube.com/watch?v=QYZo94IxCN0">Link to product demo recording</a>

## **Getting Started**

To get started, clone this repo, navigate to the project directory, and follow these steps:

```bash
# Install dependencies
bundle install

# Set up the database
rails db:create
rails db:migrate

# Start the server
rails server

