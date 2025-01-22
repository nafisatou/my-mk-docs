#Use the official nginx image as base image
FROM nginx:alpine AS builder

#Install deps
RUN apk update && \
    apk add --no-cache python3 py3-pip

# Create a virtual environment
RUN python3 -m venv /app/venv

# Activate the virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Install mkdocs and mkdocs-material
RUN pip3 install mkdocs mkdocs-material

# Set working directory inside the container
WORKDIR /app

# Copy the project file into the container
COPY . .

# Build the project
RUN mkdocs build

FROM nginx:alpine

#Copy project build code to nginx server
COPY --from=builder /app/site /usr/share/nginx/html
