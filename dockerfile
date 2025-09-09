# Use official Python image
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies for MySQL
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev gcc pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements (better for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Flask port
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
