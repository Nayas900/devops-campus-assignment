
# Use an official lightweight Python image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy dependency file first
COPY app/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY app/ .

# Document the port used by the Flask application
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
