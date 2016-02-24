# Karabiner

Karabiner stores its `plist` in the `binary1` format.

To update the `xml1` format `plist` in this repository:

    plutil -convert xml1 -o ~/.dotfiles/tag-karabiner/Library/Preferences/org.prqs.Karabiner.plist
