# Make things installed via `pip3 install --user`
# available in the PATH
path+=("$(python3 -m site --user-base)/bin")
