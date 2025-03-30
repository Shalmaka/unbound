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

### 🧑‍💻 Example `docker-compose.yml`

Here is the **`docker-compose.yml`** file used to run Unbound:

<pre>
services:
  nsr:
    image: docker.io/ztaguassi/unbound:latest-arm64
    restart: unless-stopped
    deploy:
      replicas: 2  # Deploy two instances of the Unbound service
    dns:
      - 127.0.0.1
    networks:
      - macvlan

networks:
  macvlan:
    external: true
</pre>

### 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.
