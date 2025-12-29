# layout-switcher.nvim

This is a simple neovim plugin that manages a hustle of constantly switching between keyboard layouts.

# Functionality

- After calling `setup()`, `initial layout` variable will be set to `current layout`.

- After entering normal mode, layout will be set to `initial layout`.

- After exiting insert mode into normal mode, `last layout` variable will be
  set to current layout, then layout will be set to `initial layout`.

- After entering insert mode, layout will be set to `last layout`.

> [!NOTE]
> `current layout` is the layout of the keyboard at the moment.
> `layout will be set` means that the layout of the keyboard will be set.

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
