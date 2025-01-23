FROM nginx AS builder

# Set working directory inside the container
WORKDIR /app

# Update system and install Python3, pip, and virtualenv
RUN apt update && apt install -y python3 python3-pip python3-venv

# Create a virtual environment for Python packages
RUN python3 -m venv /venv

# Install mkdocs and mkdocs-bootstrap in the virtual environment
RUN /venv/bin/pip install mkdocs mkdocs-bootstrap

# Copy the project files into the container
COPY . .

# Build the project
RUN /venv/bin/mkdocs build

FROM nginx:alpine

# Copy project build code to nginx server
COPY --from=builder /app/site /usr/share/nginx/html
