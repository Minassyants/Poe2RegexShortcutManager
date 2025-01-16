# Path of Exile 2 Regex Shortcut Manager

This application is specifically designed to streamline your **Path of Exile 2** experience by allowing you to quickly insert predefined regex search strings into the search bar. It's particularly useful for efficiently sorting **good/bad maps, tablets, and other items** using regex patterns.

## Features

- **Regex-Focused Shortcuts**: Define hotkeys for complex regex strings to easily filter maps, tablets, and other items.
- **Clipboard Management**: Temporarily replaces the clipboard to insert the regex string and restores it afterward.
- **Easy Management**: Add, delete, and save shortcuts with a simple and intuitive graphical interface.
- **Portable**: No installation required—just download and run.

## Usage

1. **Launch the App**: Run the script. The configuration window will open.
2. **Add Shortcuts**:
   - Press your desired shortcut key in the **Shortcut** field.
   - Enter the regex string you want to use in the **Regex** field.
   - Click **Add Shortcut** to save it.
3. **Delete Shortcuts**:
   - Select a shortcut from the list.
   - Click **Delete Shortcut** to remove it.
4. **Activate Shortcuts**:
   - Click **Hide and Activate**. This registers the shortcuts and hides the window.
   - While in Path of Exile 2, open stash tab and press the shortcut key to insert the regex string into the search bar (no need to press ctrl+f).
5. **Toggle GUI**: Press the `F1` key to show or hide the configuration window.
6. **Save Configurations**: Click **Save Config** to save your shortcuts to a file.

## Installation

1. Download and install [AutoHotkey v2](https://www.autohotkey.com/).
2. Clone or download this repository:
   ```bash
   git clone https://github.com/<YourUsername>/poe-regex-shortcut-manager.git
3. Complie script with AutHotKey Dash.

## OR
Just download .exe file from realeases.

## Predefined setup
- Numpad 0 = Maps with quantity of items and no bad mods.
- Numpad 1 = Maps with quantity of waystones and no bad mods. Good for bosses.
- Numpad 2 = No inc. gold mod and no bad mods.
- Numpad 3 = No bad mods.
- Numpad 4 = Items with normal rarity. Used to quickly upgrade white tablets.
- Numpad 5 = Good tablets with quantity of items.
- Numpad 6 = Tablets with inc. gold mod. I just delete them.
- Numpad 7 = Items with normal or magic rarity. Used to quickly upgrade maps.

## Contribution
Contributions are welcome! If you have ideas for new features or find any issues, feel free to open an issue or submit a pull request.

## Disclaimer
This tool is designed specifically to enhance your gameplay experience in Path of Exile 2 by facilitating regex searches. Please ensure it complies with the game's terms of service.