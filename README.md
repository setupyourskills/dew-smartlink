# Dew Smart Link

🌿 **neorg-dew-smartlink** is a minimal, focused [Neorg](https://github.com/nvim-neorg/neorg) extension designed to automatically insert a formatted link using the page title from any URL stored in your clipboard.

This module is part of the [neorg-dew](https://github.com/setupyourskills/neorg-dew) ecosystem.

## Features

- Automatically fetches the `<title>` of any URL in your system clipboard using `curl`.
- Inserts a well-formatted Neorg link: `{https://example.com}[Page Title]`
- Lightweight and easily customizable.

## Installation

### Prerequisites

- A functional installation of [Neorg](https://github.com/nvim-neorg/neorg) is required for this module to work.
- The core module [Neorg-dew](https://github.com/setupyourskills/neorg-dew) must be installed, as it provides essential base libraries.

- Neovim must be compiled with `+clipboard` support.
- A functional system clipboard (register `+`) is required to read URLs.

- [`curl`](https://curl.se/) must be available in your system’s `$PATH`.

### Using Lazy.nvim

```lua
{
  "setupyourskills/dew-smartlink",
  dependencies = {
    "setupyourskills/neorg-dew",
  },
}
```

## Configuration

Make sure all of them are loaded through Neorg’s module system in your config:

```lua
["external.neorg-dew"] = {},
["external.dew-smartlink"] = {},
```

## Usage

1. Copy any URL to your clipboard (register +).

2. You can insert the formatted link at the current cursor position using the built-in Neorg command:

```
:Neorg dew_smartlink
```

## How it works

This module will:

- Fetch the HTML page.

- Extract its `<title>`.

- Insert the formatted link at the current cursor position.

## Collaboration and Compatibility

This project embraces collaboration and may build on external modules created by other Neorg members, which will be tested regularly to ensure they remain **functional** and **compatible** with the latest versions of Neorg and Neovim.  

## Why **dew**?

Like morning dew, it’s **subtle**, **natural**, and brief, yet vital and effective for any workflow.
