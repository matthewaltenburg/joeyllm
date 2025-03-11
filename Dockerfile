# Use Ubuntu 24.04 for stability
FROM ubuntu:24.04

# Set environment variable for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \      # Essential tools for compiling software (gcc, make, etc.)
    vim \                  # Terminal-based text editor
    git \                  # Version control system
    wget \                 # Utility for downloading files from the internet
    curl \                 # Similar to wget, used for API requests & fetching data
    htop \                 # Interactive process monitor (better than 'top')
    nvtop \                # GPU process monitor (useful for NVIDIA GPUs on HPC)
    python3 \              # Python 3 interpreter
    python3-pip \          # Package manager for Python (pip)
    python3-venv \         # Virtual environment support for Python
    python3-dev \          # Header files & libraries for Python development
    && rm -rf /var/lib/apt/lists/*  # Clean up package lists to reduce image size

# Ensure 'python3' is recognized as 'python'
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Default command (for interactive HPC usage)
CMD ["/bin/bash"]
