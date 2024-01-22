# Gnome role

Role to set up gnome parameters. This role makes heavy use of `dconf`.

## Prerequisites
The `dconf` module from Ansible has additional requirements.

## Troubleshooting

## Terminal profiles
The terminal profiles are defined at [`terminal-profiles.dconf`](./files/terminal-profiles.dconf).

You can export your own profiles using `dconf dump /org/gnome/terminal/legacy/profiles:/`. Then strip any line that is not defining a profile.

The default profile is set with the variable `gnome.term.default_profile` (defined in [`config.yaml`](../../config.yaml)).

If you want to reset to defaults, use `dconf reset -f /org/gnome/terminal/legacy/profiles:/`.



### Credits
The proposed themes are heavily inspired from [Gogh](https://gogh-co.github.io/Gogh/). You can use that tool to set up a theme and then export it to a file as done in this repo.