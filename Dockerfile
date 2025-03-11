# Use Ubuntu 24.04 for stability
FROM ubuntu:24.04

# Set environment variable for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    vim \                 # Terminal-based text editor
    git \                 # Version control system
    wget \                # Utility for downloading files
    curl \                # Used for fetching data/APIs
    htop \                # System process viewer
    nvtop \               # GPU process monitor
    python3 \             # Python 3 interpreter
    python3-pip \         # Pip for managing Python packages
    python3-venv \        # Virtual environment support for Python
    python3-dev \         # Development headers for Python
    && rm -rf /var/lib/apt/lists/*  # Cleanup to reduce image size

# Ensure 'python3' is recognized as 'python'
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Default command (for interactive HPC usage)
CMD ["/bin/bash"]
