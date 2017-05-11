
function docker_for_mac_screen() {
    echo "Connecting to Docker for Mac TTY"
    echo "Tip: Ctrl-a Ctrl-d to disconnect"
    echo -n "Press ENTER to connect..."
    read
    screen ${HOME}/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
}

alias docker-tty=docker_for_mac_screen
