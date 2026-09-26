------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "eDP-1",
	mode = "2736x1824@59.95900",
	position = "0x0",
	scale = 1.9,
	transform = 0,
	disabled = false,
	bitdepth = 10,
})

hl.monitor({
	output = "DP-1",
	mode = "preferred",
	position = "0x0",
	mirror = "eDP-1",
	disabled = false,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "qs ipc call AppLauncher toggle"

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_MENU_PREFIX", "arch- ")
hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita-dark")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("HYPRSHOT_DIR", "/home/maskop/Pictures/Screenshots")
-----------------------
----- PERMISSIONS -----
-----------------------

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

--------------------
----- SOURCING -----
--------------------

require("hyprland/autostart")
require("hyprland/keybinds")
require("hyprland/look")
require("hyprland/input")
require("hyprland/windows-workspaces")
-- require("hyprland/plugins")
