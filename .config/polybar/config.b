;--------------------------------------------
; colors                                    ;
;--------------------------------------------

[colors]

	bar_bg = ${xrdb:color0}
	bar_fg = ${xrdb:color7}

	border_col = ${xrdb:color0}

	modules_bg = ${xrdb:color7}
	modules_fg = ${xrdb:color0}

	mod_bg = ${xrdb:color7}

	modules_prefix_bg = ${xrdb:color7}
	modules_prefix_fg = ${xrdb:color0}

	urgent_bg  = ${xrdb:color1}
	focused_bg = ${xrdb:color10}

	essid_p_bg   = ${xrdb:color6}
	down_p_bg    = #5e606c
	cpu_p_bg     = ${xrdb:color5}
	ram_p_bg     = ${xrdb:color11}
	vol_p_bg     = #637b81
	bright_p_bg  = #c29f6f
	battery_p_bg = ${xrdb:color9}
	time_p_bg    = ${xrdb:color10}

;--------------------------------------------
; bars                                      ;
;--------------------------------------------

[bar/base]
	dpi      = 192
	width    = 100%
	height   = 32
	offset-x = 0
	offset-y = 0

	bottom = false

	background = #000f0f0f
	foreground = ${xrdb:color7}

	border-bottom-size  = 0
	border-top-size     = 10

	border-left-size  = 0
	border-right-size = 30

	border-bottom-color = #000f0f0f
	border-top-color    = #000f0f0f

	border-left-color  = #000f0f0f
	border-right-color = #000f0f0f

	spacing            = 0
	padding-left       = 0
	padding-right      = 0
	module-margin-left = 0

	font-N = <fontconfig pattern>;<vertical offset>
	font-0 = Siji:size=4;2
	font-1 = lemon:pixelsize=10;1
	font-2 = Kochi Gothic:size=4;1

	modules-right  = previous playpause next paddinglite workspaces paddinglite battery date

	fixed-center = true

	#monitor = LVDS1


;--------------------------------------------
; modules                                   ;
;--------------------------------------------

[module/network]
	type          = internal/network
	interface     = wlp3s0
	ping-interval = 3

[module/xwindow]
	y-offset      = 10
	type          = internal/xwindow
	format        = <label>
	label         = %title:0:50:%
	label-padding = 3

[module/date]
	type     = internal/date
	interval = 1.0
	time     = "%I:%M %p"
	label    = "%time%"

	format         = <label>
	format-padding = 0

	label-background = ${xrdb:color21}
	label-foreground = ${xrdb:color18}
	label-padding    = 4

[module/previous]
	type = custom/text

	content = "   "
	content-background = ${xrdb:color0}
	content-foreground = ${xrdb:color21}
	content-padding = 0

	click-left = mpc prev

[module/playpause]
	type = custom/script

	exec = sh ~/.config/polybar/playpause.sh

	interval= .5

	label = %output%
	label-background = ${xrdb:color0}
	label-foreground = ${xrdb:color21}
	label-padding = 2

	click-left = mpc toggle

[module/next]
	type = custom/text

	content = "   "

	content-background = ${xrdb:color0}
	content-foreground = ${xrdb:color21}
	content-padding = 0

	click-left = mpc next

[module/music]
	type = internal/mpd

	host = 127.0.0.1
	port = 6600

	interval = 2

	format-online = <label-song>

	label-song         = "%artist% - %title% "
	label-song-padding = 0
	label-song-background = ${xrdb:color0}
	label-song-foreground = ${xrdb:color7}

	format-online-prefix-padding = 0

[module/battery]
	type          = internal/battery
	full-at       = 98
	battery       = BAT0
	adapter       = AC0
	poll-interval = 5

	format-charging = <label-charging>

	label-charging            = "%percentage%%"
	label-charging-background = ${xrdb:color7}
	label-charging-foreground = ${xrdb:color0}
	label-charging-padding    = 4

	format-discharging = <label-discharging>

	label-discharging            = "%percentage%%"
	label-discharging-background = ${xrdb:color7}
	label-discharging-foreground = ${xrdb:color0}
	label-discharging-padding    = 4

	format-full = <label-full>

	label-full            = "%percentage%%"
	label-full-background = ${xrdb:color7}
	label-full-foreground = ${xrdb:color0}
	label-full-padding    = 4

[module/volume]
	type          = internal/pulseaudio
	format-volume = <label-volume>

	mapped = true

	label-volume            = "%percentage%%"
	label-volume-background = ${xrdb:color0}
	label-volume-foreground = ${xrdb:color7}
	label-volume-padding    = 1

	format-muted = <label-muted>

	label-muted            = "0% (muted)"
	label-muted-background = ${xrdb:color0}
	label-muted-foreground = ${xrdb:color7}
	label-muted-padding    = 1

	format-volume-padding = 0
	format-muted-padding  = 0

	ramp-headphones-0 = 

[module/cpu]
	type             = internal/cpu
	interval         = 0.5
	format           = <label>
	label            = %percentage%%
	label-background = ${colors.modules_bg}
	label-foreground = ${colors.modules_fg}
	label-padding    = 1

	format-prefix = 

	format-prefix-padding    = 1
	format-prefix-background = ${colors.cpu_p_bg}
	format-prefix-foreground = ${colors.modules_prefix_fg}

[module/ram]
	type     = internal/memory
	interval = 3

	format           = <label>
	label            = "%percentage_used%%"
	label-background = ${colors.modules_bg}
	label-foreground = ${colors.modules_fg}
	label-padding    = 1

	format-prefix = 

	format-prefix-padding    = 1
	format-prefix-background = ${colors.ram_p_bg}
	format-prefix-foreground = ${colors.modules_prefix_fg}


[module/essid]
	inherit = module/network

	format-connected = <label-connected>

	format-connected-prefix              = ""
	format-connected-prefix-padding      = 1
	format-connected-prefix-padding-left = 1
	format-connected-prefix-background   = ${xrdb:color0}
	format-connected-prefix-foreground   = ${xrdb:color5}

	label-connected               = "%essid%"
	label-connected-background    = ${xrdb:color0}
	label-connected-foreground    = ${xrdb:color5}
	label-connected-padding       = 1
	label-connected-padding-right = 1

	ramp-signal-background    = ${xrdb:color0}
	ramp-signal-foreground    = ${xrdb:color5}
	ramp-connected-foreground = ${xrdb:color5}
	ramp-signal-padding       = 1

	format-disconnected = <label-disconnected>

	format-disconnected-prefix              = ""
	format-disconnected-prefix-padding      = 1
	format-disconnected-prefix-padding-left = 1
	format-disconnected-prefix-background   = ${xrdb:color0}
	format-disconnected-prefix-foreground   = ${xrdb:color7}

	label-disconnected               = "DISCONNECTED"
	label-disconnected-background    = ${xrdb:color0}
	label-disconnected-foreground    = ${xrdb:color7}
	label-disconnected-padding       = 1
	label-disconnected-padding-right = 1


[module/down]
	inherit = module/network

	format-connected = <label-connected>

	format-connected-prefix            = 
	format-connected-prefix-background = ${colors.down_p_bg}
	format-connected-prefix-foreground = ${colors.modules_prefix_fg}
	format-connected-prefix-padding    = 1

	label-connected               = %{T2}%downspeed:7%%{T-}
	label-connected-background    = ${colors.modules_bg}
	label-connected-foreground    = ${colors.modules_fg}
	label-connected-padding-right = 1

[module/padding]
	type               = custom/text
	content            = ||
	content-padding    = 1
	content-foreground = #000f0f0f
	content-background = #000f0f0f

[module/paddinglite]
	type               = custom/text
	content            = |
	content-padding    = .5
	content-foreground = ${xrdb:color18}
	content-background = ${xrdb:color18}

[module/workspaces]

	type            = internal/i3
	format          = <label-state> <label-mode>
	index-sort      = true
	wrapping-scroll = false
	strip-wsnumbers = true

	label-mode-background = ${xrdb:color18}
	label-mode-foreground = ${xrdb:color7}
	label-mode-padding    = 1

	label-focused            = +
	label-focused-background = ${xrdb:color18}
	label-focused-foreground = ${xrdb:color3}
	label-focused-padding    = 1

	label-unfocused            = -
	label-unfocused-background = ${xrdb:color18}
	label-unfocused-foreground = ${xrdb:color8}
	label-unfocused-padding    = 1

	label-visible            = -
	label-visible-background = ${xrdb:color18}
	label-visible-foreground = ${xrdb:color7}
	label-visible-padding    = 1

	label-urgent            = -
	label-urgent-background = ${xrdb:color18}
	label-urgent-foreground = ${xrdb:color1}
	label-urgent-padding    = 1

	pin-workspaces = true

[module/mon2]

	type            = internal/i3
	format          = <label-state><label-mode>
	index-sort      = true
	wrapping-scroll = false
	strip-wsnumbers = true

	label-mode-background = #000f0f0f
	label-mode-foreground = ${xrdb:color7}
	label-mode-padding    = 1

	label-focused            = %name%
	label-focused-background = #000f0f0f
	label-focused-foreground = ${xrdb:color2}
	label-focused-padding    = 1

	label-unfocused            = %name%
	label-unfocused-background = #000f0f0f
	label-unfocused-foreground = ${xrdb:color7}
	label-unfocused-padding    = 1

	label-visible            = %name%
	label-visible-background = #000f0f0f
	label-visible-foreground = ${xrdb:color7}
	label-visible-padding    = 1

	label-urgent            = •
	label-urgent-background = ${xrdb:color7}
	label-urgent-foreground = ${xrdb:color1}
	label-urgent-padding    = 1

	pin-workspaces = true


[module/openbox]
	type                      = internal/xworkspaces
	pin-workspaces            = true
	enable-click              = false
	enable-scroll             = false
	format                    = <label-state>
	label-monitor             = %name%
	label-active              = %icon%%name%
	label-active-foreground   = ${colors.obfg}
	label-active-background   = ${colors.obbg}
	label-active-underline    = #fba922
	label-active-padding      = 1
	label-occupied            = %name%
	label-occupied-background = ${colors.obbg}
	label-occupied-padding    = 1
	label-urgent              = %index%
	label-urgent-foreground   = #000000
	label-urgent-background   = #bd2c40
	label-urgent-underline    = #9b0a20
	label-empty               = %name%
	label-empty-padding       = 1
	label-empty-background    = ${colors.obibg}
	label-empty-foreground    = ${colors.obifg}

[module/backlight]
	type = internal/backlight

	output = LVDS-1

	card          = acpi_video0
	enable-scroll = false

	format        = <label>
	format-prefix = 

	format-prefix-padding    = 1
	format-prefix-background = ${colors.cpu_p_bg}
	format-prefix-foreground = ${colors.modules_prefix_fg}

	label            = %percentage%%
	label-background = ${colors.modules_bg}
	label-foreground = ${colors.modules_fg}
	label-padding    = 1
