# Use an official Python runtime as a parent imagef
FROM python:3.10-slimf
#FROM ubuntu

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
	build-essential \
	git \
	curl \
	libgl1-mesa-glx \
	&& rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone the ComfyUI repository
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app

# Install Python dependencies
RUN pip install --upgrade pip \
	&& pip install -r requirements.txt

# Command to start the ComfyUI server
CMD ["python", "main.py", "--listen"]
