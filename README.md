# Unbound DNS Server Docker Setup

This repository provides a simple Docker setup for running **Unbound**, a validating, recursive, and caching DNS resolver, using **Docker Compose**.

## 🚀 Quick Start

Follow these steps to get Unbound up and running with Docker Compose:

### Prerequisites

- **Docker**: Ensure you have [Docker](https://www.docker.com/products/docker-desktop) installed.
- **Docker Compose**: Ensure you have [Docker Compose](https://docs.docker.com/compose/) installed.


### Steps to Run

1. **Clone the repository** (if you haven't already):
   <pre>
   git clone https://github.com/yourusername/unbound-docker.git
   cd unbound-docker
   </pre>

2. **Build and start the container**:
   Use Docker Compose to bring up the Unbound service:
   <pre>
   docker-compose up -d
   </pre>

   This will:
   - Download the Unbound image.
   - Start **two instances** (replicas) of the Unbound service, which will listen on port `53` for DNS requests.

3. **Verify that the service is running**:
   You can check if the containers are running with:
   <pre>
   docker ps
   </pre>

### 🛠️ Configuration

The default configuration for Unbound is provided inside the Docker image. The following default settings are applied:

- **DNS Resolution**: The server will resolve DNS queries and provide the results back to the clients.
- **Interface Binding**: The Unbound DNS service listens on all interfaces (`0.0.0.0`).
- **Access Control**: Allows specific private IP ranges, such as `192.168.0.0/16`, `10.0.0.0/16`, etc.

If you want to customize the configuration, you can edit the `unbound.conf` file in the container (it is already pre-configured in the image).

### 🔧 Troubleshooting

If you experience issues or need to troubleshoot:

1. **Check logs**:
   Since there are no logs being persisted, you can view logs from the running container:
   <pre>
   docker logs <container_name>
   </pre>

2. **Check container status**:
   To see if your Unbound containers are running, use:
   <pre>
   docker-compose ps
   </pre>

### ⚙️ Configuration Customization

You can customize the **Unbound** settings by
