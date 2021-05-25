# Roku markdown renderer

This is a **simple markdown renderer** for Roku apps written in [BrighterScript](https://github.com/rokucommunity/brighterscript).

Parser and renderer support a subset of the markdown spec, and strip all inline styles. 
The goal is to eventually support images between paragraphs.

There is currently no plan to support full text styling.

## Setup instructions

1. Install [NodeJS](https://nodejs.org)
2. install npm dependencies
    ```bash
    npm install
    ```
3. Build a zip of the project
    ```bash
    npm run package
    ```

## Debugging

This repository comes pre-configured to work with the [BrightScript Language](https://github.com/rokucommunity/vscode-brightscript-language) extension for Visual Studio Code. So once you have that plugin installed, debugging your project is as simple as clicking the "Start Debugging" button.
