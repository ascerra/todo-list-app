# Base image
FROM python:3.9-slim

# ARG SEALIGHTS_AGENT_TOKEN
# ENV PYTHON_EXE=python

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# # Install dependencies
RUN chmod +x /app/app.py
RUN chown 1000:1000 /app/app.py
RUN chown 1000:1000 /app/
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r robot_requirements.txt

# Expose the application's port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
