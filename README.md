# layout-switcher.nvim

This is a simple neovim plugin that manages a hustle of constantly switching between keyboard layouts.

# Functionality

> By `us` layout I mean the `initial layout` which will be set by plugin after
> the `setup()` was called.

- After entering normal mode, layout will always be `us`.

- After entering insert mode for the first time, layout will be `us`.

- After exiting insert mode into normal mode, neovim will remember the `last layout`,
  then switch to `us`.

- After entering insert mode again, neovim will switch back to the `last layout`.

# Support for OS/DE/Input_methods

> [!NOTE]
> It's not hard to add support for your environment.
> I will gladly accept a merge request.

## ✅ Supported

- **Hyprland** window manager/compositor with **Multiple keyboard layouts** configured via `kb_layout` in it's config.

## ❓ Compatibility Map

To check if your environment is supported, check:

1. your OS is supported
2. your window manager/desktop environment is supported
3. your input method is supported

- OS
  - ✅ Linux
    - ✅ Omarchy
  - ❌ MacOS
  - ❌ Windows
- WM / DE
  - ✅ Hyprland
  - ❌ Gnome
  - ❌ KDE
- Input methods
  - ✅ hyprctl
  - ❌ xkb
  - ❌ ibus

# Installation

With a plugin manager of your choice.

> [!IMPORTANT]
> Don't forget to call `setup()`.
