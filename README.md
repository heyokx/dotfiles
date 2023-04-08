# dotfiles

Development setup config to be up-and-running on different locals.

TODO:
- setup guide in readme
- list any required tooling for dotfiles (if not part of installation phase of dotfiles)
- list configs (add links to projects)
- establish local specific and secret variable setup

## Configurations
Here are the tools that are configured in these dotfiles:
- [kitty](./configurations/kitty/)
- [fish](./configurations/fish)

## Local Specific & Secret Variables
The current mechanism for handling local specific configurations is specific to each tool configuration.
See specific `./configurations/<tool>/README.md` for details on how it handles local configs.

## Installation
The installation script and procedure of a configuration can be found within the tool's configuration folder at `./configurations/<tool>/sync.fish`.
