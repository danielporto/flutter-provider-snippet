FROM cirrusci/flutter:beta

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=cirrus
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Configure apt and install packages
RUN sudo apt-get update \
    && sudo apt -y install --no-install-recommends apt-utils dialog rsync fish  2>&1 \
#     #
#     # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && sudo apt -y install git procps lsb-release \
#     #
#     # Clean up
    && sudo apt-get autoremove -y \
    && sudo apt-get clean -y \
    && sudo rm -rf /var/lib/apt/lists/*
    
# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=