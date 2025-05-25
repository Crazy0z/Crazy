# Roblox UI Library

## Overview
The Roblox UI Library is a flexible and easy-to-use library for creating user interfaces in Roblox games. It provides a set of components and utilities that simplify the process of building interactive and visually appealing UIs.

## Features
- **Modular Components**: Create windows, pages, sections, and various UI elements like buttons, toggles, sliders, and more.
- **Customizable**: Easily customize the appearance and behavior of UI components to fit your game's theme.
- **Animation Support**: Utilize built-in utilities for smooth animations and transitions.
- **Event Management**: Efficiently manage user interactions and events with a connection manager.

## Installation
To use the Roblox UI Library in your project, follow these steps:

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/roblox-ui-library.git
   ```

2. Place the `roblox-ui-library` folder into your Roblox project.

3. Require the library in your scripts:
   ```lua
   local Library = require(game.ReplicatedStorage:WaitForChild("roblox-ui-library").src.init)
   ```

## Usage
Here’s a basic example of how to create a window and add components:

```lua
local Library = require(game.ReplicatedStorage:WaitForChild("roblox-ui-library").src.init)

local window = Library:CreateWindow({
    Title = "My UI Window",
    Size = UDim2.new(0, 400, 0, 300)
})

local page = window:AddPage("Main Page")

local section = page:AddSection("Controls")

section:AddToggle({
    Name = "Enable Feature",
    Default = false,
    Callback = function(state)
        print("Feature enabled:", state)
    end
})

window:Open()
```

## API Reference
- **Library**: Main class for creating windows and managing UI components.
- **Window**: Represents a UI window with methods for opening, closing, and managing properties.
- **Page**: Represents a page within a window, allowing the addition of sections.
- **Section**: Represents a section within a page, where components can be added.
- **Toggle**: Represents a toggle switch for binary options.
- **Button**: Represents a clickable button for actions.
- **Slider**: Represents a slider for selecting values.
- **TextBox**: Represents an input field for user text input.
- **Dropdown**: Represents a dropdown menu for selecting options.

## Examples
Check the `examples` folder for scripts demonstrating basic and advanced usage of the library.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.

## License
This project is licensed under the MIT License. See the LICENSE file for details.