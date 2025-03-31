# Base image with Python and CUDA (for GPU) or just Python (for CPU)
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Copy the repository files into the container
COPY . /app

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && \
    pip install flask && \
    pip install -r requirements.txt

# Expose the Flask app port
EXPOSE 5000

# Command to run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]
