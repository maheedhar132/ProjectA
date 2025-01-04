# Install Docker on Linux

This bash script automates the process of installing Docker on a Linux system. It supports Ubuntu, CentOS, Fedora, and OpenSUSE distributions.

**How it works:**

1. **Detects the distribution:** The script first determines the Linux distribution by checking for specific package managers (apt, yum, dnf, or zypper).
2. **Installs prerequisites:** Based on the detected distribution, it installs necessary packages like `curl`, `ca-certificates`, and other dependencies required for Docker.
3. **Adds Docker repository:** The script adds the official Docker repository to the system's package sources.
4. **Installs Docker:** It uses the appropriate package manager to install the Docker Engine, CLI, and containerd.
5. **Starts and enables Docker service:** The script starts the Docker service and configures it to start automatically on system boot.
6. **Verifies installation:** Finally, it runs a simple test command (`docker run hello-world`) to verify that Docker is installed and working correctly.

**How it helps:**

- **Simplifies installation:** Automates the entire installation process, eliminating the need for manual steps and reducing the risk of errors.
- **Cross-platform compatibility:** Supports multiple Linux distributions, making it versatile for different environments.
- **Ensures consistency:** Provides a consistent installation process across different systems, reducing variations and potential issues.
- **Saves time and effort:** Reduces the time and effort required to install Docker manually.

**Instructions:**

1. Save the script as a file (e.g., install-docker.sh).
2. Make the script executable using `chmod +x install-docker.sh`.
3. Run the script with `sudo ./install-docker.sh`

This script can be a valuable tool for system administrators, developers, and anyone who needs to quickly and easily install Docker on their Linux systems.
