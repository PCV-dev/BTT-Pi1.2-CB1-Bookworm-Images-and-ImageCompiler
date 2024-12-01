#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root." >&2
  exit 1
fi

# List of packages to be installed
packages=(
  ccache debian-archive-keyring debootstrap device-tree-compiler dwarves
  gcc-arm-linux-gnueabihf jq libbison-dev libc6-dev-armhf-cross
  libelf-dev libfl-dev liblz4-tool libpython2.7-dev libusb-1.0-0-dev
  pigz pixz pv swig pkg-config python3-distutils qemu-user-static u-boot-tools
  distcc uuid-dev lib32ncurses-dev lib32stdc++6 apt-cacher-ng
  aptly aria2 libfdt-dev libssl-dev
)

# Install the required packages
for package in "${packages[@]}"; do
  if ! dpkg -s "$package" >/dev/null 2>&1; then
    echo "Installing $package..."
    DEBIAN_FRONTEND=noninteractive apt-get install -y "$package" || {
      echo "Failed to install $package. Exiting." >&2
      exit 1
    }
  else
    echo "$package is already installed."
  fi
done

# Run the Unpack-archivs script
script_dir="$(dirname "$0")"
if [ -f "$script_dir/Unzip_FileList_eng.sh" ]; then
  echo "Running the Unzip script..."
  bash "$script_dir/Unzip_FileList_eng.sh"
  echo "Installation process completed successfully."
else
  echo "Error: Unpack-archivs script not found in the current directory." >&2
  exit 1
fi

