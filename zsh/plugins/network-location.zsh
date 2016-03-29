# Use OS X networksetup utility to expose the current location

if [ "$(uname)" == "Darwin" ]; then
    export NETWORK_LOCATION=$(networksetup -getcurrentlocation)
fi
