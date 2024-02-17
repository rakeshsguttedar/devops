# Kubernetes (K8s) - Part 1

Kubernetes (K8s) is an open-source container orchestration system, platform, or COE (container orchestration engine) for automating deployment, scaling, and management of containerized applications.

## Why Kubernetes?

Docker is a containerization platform that provides a basic solution for managing the application lifecycle through containers on a single host. However, Docker containers are ephemeral and lack support for features like auto-healing and auto-scaling.

Kubernetes addresses these limitations by providing features such as:
1. Auto-healing: Restarting pods if they become unhealthy.
2. Auto-scaling: Dynamically adjusting the number of pods based on workload.
3. Enterprise-level support: Offering health checks, readiness probes, etc.

These features minimize application downtime and reduce manual intervention in application management.

## Basic Components of Kubernetes:

### Pod:
- A pod is the smallest deployable unit in Kubernetes, containing one or more containers.

### Service:
- Provides service discovery, load balancing, and exposes applications within or outside the cluster.

### Ingress:
- Manages routing based on host or path instead of IP address.

### ConfigMap:
- Stores configuration data such as database connection URLs.

### Secrets:
- Stores sensitive information such as credentials in base64 encoding.

### Volumes:
- Maintains the state of deployed applications.

## Architecture of Kubernetes:

A Kubernetes cluster consists of two main components:
- Control plane (Master node)
- Data plane (Worker node)

### Control Plane Components:
- API server: Gateway for cluster requests.
- Etcd: Key-value store containing cluster information.
- Scheduler: Assigns nodes for pod scheduling.
- Controller Manager (CM): Maintains desired cluster state.
- Cloud Controller Manager: Manages cloud provider resources.

### Data Plane Components:
- Container runtime process: Manages containers.
- Kubelet: Creates and manages pods.
- Kube Proxy: Handles networking for pods.

## Pod in Kubernetes:

A pod is the smallest deployable unit in Kubernetes, containing one or more containers. Pods can pass configurations to containers using YAML manifest files.

Examples of pods with multiple containers:
- Ephemeral containers: For troubleshooting.
- Init containers: Run before app containers to perform setup tasks.
- Sidecar containers: Enhance main application functionality.

### Ephemeral Containers:
A special type of container that runs temporarily in an existing Pod to accomplish user-initiated actions such as troubleshooting. Ephemeral containers are typically used to inspect services rather than to build applications. For example, they can be used for troubleshooting issues in distroless image containers.

### Init Containers:
Specialized containers that run before app containers in a Pod. Init containers can contain utilities or setup scripts not present in an app image. They run and complete their tasks before the main application container starts. Unlike sidecar containers, init containers are not continuously running alongside the main containers. They run to completion sequentially, and the main container does not start until all the init containers have successfully completed. Init containers do not support lifecycle, livenessProbe, readinessProbe, or startupProbe, whereas sidecar containers support all these probes to control their lifecycle. Init containers share the same resources (CPU, memory, network) with the main application containers but do not interact directly with them. However, they can use shared volumes for data exchange.

### Sidecar Containers:
Enhance or extend the functionality of the main application container by providing additional services or functionality such as logging, monitoring, security, or data synchronization, without directly altering the primary application code.
