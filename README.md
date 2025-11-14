# TODO List Application

A simple Flask-based TODO list application with unit and integration tests using the Robot Framework.

## Setup

### Prerequisites

- Docker

### Build and Run the Application

1. Build the Docker image:
   ```bash
   docker build -t todo-app .
   ```

2. Run the container:
   ```bash
   docker run -p 5000:5000 todo-app
   ```

3. Access the application:
   - API endpoint: http://localhost:5000/todos

## API Endpoints

- `GET /todos` - Get all todos
- `POST /todos` - Add a new todo (requires `task` in JSON body)
- `PATCH /todos/<id>` - Mark a todo as done
- `POST /reset` - Reset the todo list (for testing)

## Testing

The application includes unit and integration tests using the Robot Framework.
