DEBIAN_FRONTEND=noninteractive
RESOLUTION="1920x1200"

# Validate vnc server installed
if ! command -v vncserver &> /dev/null
then
    echo "VNC server could not be found. Installing..."
    sudo apt-get update
    sudo apt install -y  --no-install-recommends \
        dbus-x11 \
        xfce4 \
        tigervnc-standalone-server \
        xfce4-terminal \
        xfce4-goodies \
        tigervnc-tools
else
    echo "VNC server is already installed."
fi

# config vnc
if [ ! -f ~/.vnc/xstartup ]; then
    echo "Configuring VNC server..."
    mkdir -p ~/.vnc
    echo "xfce4-session" > ~/.vnc/xstartup
    chmod +x ~/.vnc/xstartup
    echo "VNC server configured."
else
    echo "VNC server is already configured."
fi


# Start VNC server
if ! pgrep -x "vncserver" > /dev/null
then
    echo "Starting VNC server..."
    vncserver :1 -geometry $RESOLUTION -depth 24
else
    echo "VNC server is already running."
fi
# Set VNC password
if [ ! -f ~/.vnc/passwd ]; then
    echo "Setting VNC password..."
    vncpasswd
else
    echo "VNC password is already set."
fi
# Set display variable
export DISPLAY=:1