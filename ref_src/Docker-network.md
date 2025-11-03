## `docker network`

`docker network`  is a command used to  **manage Docker networks**, enabling containers to  **communicate with each other**  and control how they connect internally and externally. Docker provides several types of networks (bridge, overlay, host, and macvlan), each suited for different use cases.

### Key Features:

-   **Create, inspect, connect, and disconnect networks**.
-   Control how containers communicate within and across multiple hosts.
-   Supports  **custom and isolated networks**  for security and scalability.

----------

## Docker Network Types

### 1. Bridge Network (default)

-   The most common type for standalone containers.
-   Containers on the same bridge network can communicate with each other.

### 2. Host Network

-   Removes network isolation; the container uses the  **host’s network stack**  directly.
-   Suitable for high-performance network communication.

### 3. Overlay Network

-   Used for  **multi-host networking**  in Docker Swarm.
-   Allows containers on different hosts to communicate securely.

### 4. Macvlan Network

-   Assigns a  **MAC address**  to containers, making them appear as physical devices on the network.
-   Useful for integrating Docker with existing physical networks.

----------

## Basic Syntax

```
docker network [COMMAND] [OPTIONS]

```

### Common  `docker network`  Commands:

-   **`create`**: Create a new network.
-   **`ls`**: List all networks.
-   **`inspect`**: Show detailed information about a network.
-   **`connect`**: Connect a container to a network.
-   **`disconnect`**: Disconnect a container from a network.
-   **`rm`**: Remove a network.

## Examples of  `docker network`  Commands

### 1. List All Docker Networks

```
docker network ls

```

**Example Output:**

```
NETWORK ID     NAME      DRIVER    SCOPE
6e8d77eabc12   bridge    bridge    local
5aeb2c1234ab   host      host      local
9a8d12345def   none      null      local

```

----------

### 2. Create a New Bridge Network

```
docker network create my_custom_network

```

This creates a custom bridge network called  `my_custom_network`.

----------

### 3. Create a Network with a Specific Subnet

```
docker network create \
  --subnet=192.168.1.0/24 \
  custom_subnet_network

```

This creates a network with the subnet  `192.168.1.0/24`.

----------

### 4. Inspect a Network

```
docker network inspect my_custom_network

```

This provides detailed information about the network, including connected containers and configuration.

----------

### 5. Connect a Container to a Network

```
docker network connect my_custom_network my_container

```

This connects  `my_container`  to  `my_custom_network`.

----------

### 6. Disconnect a Container from a Network

```
docker network disconnect my_custom_network my_container

```

This disconnects  `my_container`  from  `my_custom_network`.

----------

### 7. Create an Overlay Network

```
docker network create \
  --driver overlay \
  my_overlay_network

```

This creates an overlay network for multi-host communication (requires Docker Swarm).

----------

### 8. Create a Macvlan Network

```
docker network create \
  -d macvlan \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  -o parent=eth0 \
  my_macvlan_network

```

This creates a macvlan network where containers get their own IP addresses in the  `192.168.1.0/24`  subnet.

----------

### 9. Remove a Network

```
docker network rm my_custom_network

```

This removes the  `my_custom_network`.

----------

### 10. Remove All Unused Networks

```
docker network prune

```

This removes all unused networks.

----------

### 11. Use a Custom Network When Running a Container

```
docker run --rm --network=my_custom_network nginx

```

This runs an  `nginx`  container attached to  `my_custom_network`.

----------

### 12. List Connected Containers in a Network

```
docker network inspect my_custom_network | jq '.[0].Containers'

```

This lists all containers connected to  `my_custom_network`  (requires  `jq`  for JSON parsing).

----------

## Use Cases for  `docker network`

### 1. Container Communication in Isolated Environments

-   Use custom bridge networks to  **group related containers**  for secure communication.
-   Example: Create a network for a  **web app and database**, ensuring they can communicate internally.

----------

### 2. High-Performance Networking with Host Mode

-   Use the  **host network**  for  **low-latency**  and high-performance applications like monitoring tools or network proxies.
-   Example: Run a  **Prometheus**  container in host mode to reduce network overhead.

----------

### 3. Multi-Host Networking (Docker Swarm)

-   Use overlay networks for  **distributed applications**  across multiple Docker hosts.
-   Example: Deploy a  **microservices application**  across a Docker Swarm cluster.

----------

### 4. Integrating Docker with Physical Networks (Macvlan)

-   Use macvlan networks to  **assign unique IP addresses**  to containers on your physical network.
-   Example: Deploy containers as part of your corporate network infrastructure.

----------

### 5. Secure and Private Networks

-   Create isolated networks for  **sensitive applications**  to prevent external access.
-   Example: Run an  **internal API service**  on a private network only accessible to specific containers.

----------

### 6. Simplified CI/CD Networking

-   Create temporary networks in CI pipelines for testing container communication.
-   Example: Set up an  **isolated network**  for integration tests in a CI/CD job.

----------

## List of Common  `docker network`  Commands

  
| **Command** | **Description** |
|--|--|
| `docker network ls` | List all networks |
| `docker network create my_network` | Create a new bridge network |
| `docker network create --driver overlay my_overlay` | Create an overlay network for multi-host setups |
| `docker network inspect my_network` | Inspect a network for detailed information |
| `docker network connect my_network my_container` | Connect a container to a network |
| `docker network disconnect my_network my_container` | Disconnect a container from a network |
| `docker network rm my_network` | Remove a network |
| `docker network prune` | Remove all unused networks |

----------

## Best Practices for Using Docker Networks:

1.  **Use custom networks**  for container communication to avoid exposing services to the default bridge network.
2.  **Isolate sensitive services**  on private networks for security.
3.  **Monitor and prune unused networks**  to avoid network clutter.
4.  **Use overlay networks**  for multi-host Docker Swarm deployments.
5.  **Plan subnets**  carefully to avoid conflicts with your physical network.

----------

## Common Errors and Solutions

1.  **“Network not found”**  
    → Ensure the network exists by checking with  `docker network ls`.
2.  **“Address already in use”**  
    → Choose a subnet that does not conflict with other networks on your host.
3.  **“Cannot connect to container”**  
    → Verify that the container is running and the network is properly configured.
4.  **“Permission denied”**  
    → Run the command with  `sudo`  or check user permissions.

----------

## Combining  `docker network`  with Other Commands

### Run a Web App with a Linked Database

```
docker network create web_net
docker run -d --network=web_net --name=web_app my_web_app
docker run -d --network=web_net --name=db my_database

```

### Inspect and Check for IP Conflicts

```
docker network inspect my_network

```

### Automate Network Cleanup

```
docker network prune -f
```

----------
