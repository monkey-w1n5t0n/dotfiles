# Configuration for Alacritty, the GPU enhanced terminal emulator

# Any items in the `env` entry below will be added as
# environment variables. Some entries may override variables
# set by alacritty it self.
# env:
  # TERM env customization.
  #
  # If this property is not set, alacritty will set it to xterm-256color.
  #
  # Note that some xterm terminfo databases don't declare support for italics.
  # You can verify this by checking for the presence of `smso` and `sitm` in
  # `infocmp xterm-256color`.
  # TERM: xterm-256color-italic

window:
  # Window dimensions (changes require restart)
  #
  # Specified in number of columns/lines, not pixels. If both are zero this
  # setting is ignored.
  dimensions:
    columns: 100
    lines: 85

  # Window padding (changes require restart)
  #
  # Blank space added around the window in pixels. This padding is not scaled by
  # DPI and the specified value is always added at both opposing sides.
  padding:
    x: 0
    y: 0

  # Spread additional padding evenly around the terminal content.
  dynamic_padding: false

  # Window decorations
  #
  # Available values:
  # - full: borders and title bar
  # - none: neither borders nor title bar
  # - transparent: title bar, transparent background and title bar buttons
  # - buttonless: title bar, transparent background, but no title bar buttons
  #decorations: buttonless

  # Startup Mode (changes require restart)
  #
  # Values for `startup_mode`:
  #   - Windowed
  #   - Maximized
  #   - Fullscreen
  #
  # Values for `startup_mode` (macOS only):
  #   - SimpleFullscreen
  startup_mode: Windowed

scrolling:
  # maximum number of lines in the scrollback buffer. Specifying '0' will
  # disable scrolling.
  history: 0

  # Number of lines the viewport will move for every line scrolled when
  # scrollback is enabled (history > 0).
  multiplier: 3

# Font configuration (changes require restart)
font:
  # The normal (roman) font face to use.
  # Style can be specified to pick a specific face.
  normal:
    family: Iosevka
    style: Light
    # family: "Fira Code"
    # family: "Source Code Pro"
    # style: Retina

  # The bold font face
  bold:
    family: Iosevka
    style: Medium
    # family: "Fira Code"
    # family: "Source Code Pro"

  # The italic font face
  italic:
    family: Iosevka
    style: "Light Italic"
    # style: "Light Oblique"
    # family: "Fira Code"
    # family: "Source Code Pro"
    # style: "Medium Italic"

  # Point size of the font
  size: 14.0

  # Offset is the extra space around each character. offset.y can be thought of
  # as modifying the linespacing, and offset.x as modifying the letter spacing.
  offset:
    x: 0
    y: 0

  # Glyph offset determines the locations of the glyphs within their cells with
  # the default being at the bottom. Increase the x offset to move the glyph to
  # the right, increase the y offset to move the glyph upward.
  glyph_offset:
    x: 0
    y: 0

  # Thin stroke font rendering (macOS only)
  #
  # Thin strokes are suitable for retina displays, but for non-retina you
  # probably want this set to false.
  #
  # macOS >= 10.14.x:
  #
  # If the font quality on non-retina display looks bad then set
  # `use_thin_strokes` to `true` and enable font smoothing by running the
  # following command:
  #   `defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO`
  #
  # This is a global setting and will require a log out or restart to take
  # effect.
  use_thin_strokes: true

# When true, bold text is drawn using the bright variant of colors.
draw_bold_text_with_bright_colors: false

# Use custom cursor colors. If true, display the cursor in the cursor.foreground
# and cursor.background colors, otherwise invert the colors of the cursor.
custom_cursor_colors: true

# Colors
colors:

  # Tomorrow (https://github.com/aarowill/base16-alacritty/blob/master/colors/base16-tomorrow.yml)
  # Default colors
  primary:
    background: '0xffffff'
    foreground: '0x4d4d4c'
  # Colors the cursor will use if `custom_cursor_colors` is true
  cursor:
    text: '0xffffff'
    cursor: '0x4d4d4c'
  # Normal colors
  normal:
    black:   '0xffffff'
    red:     '0xc82829'
    green:   '0x718c00'
    yellow:  '0xeab700'
    blue:    '0x4271ae'
    magenta: '0x8959a8'
    cyan:    '0x3e999f'
    white:   '0x4d4d4c'
  # Bright colors
  bright:
    black:   '0x8e908c'
    red:     '0xf5871f'
    green:   '0xe0e0e0'
    yellow:  '0xd6d6d6'
    blue:    '0x969896'
    magenta: '0x282a2e'
    cyan:    '0xa3685a'
    white:   '0x1d1f21'

  # # Tomorrow Night (https://github.com/aarowill/base16-alacritty/blob/master/colors/base16-tomorrow-night.yml)
  # # Default colors
  # primary:
  #   background: '0x1d1f21'
  #   foreground: '0xc5c8c6'
  # # Colors the cursor will use if `custom_cursor_colors` is true
  # cursor:
  #   text: '0x1d1f21'
  #   cursor: '0xc5c8c6'
  # # Normal colors
  # normal:
  #   black:   '0x1d1f21'
  #   red:     '0xcc6666'
  #   green:   '0xb5bd68'
  #   yellow:  '0xf0c674'
  #   blue:    '0x81a2be'
  #   magenta: '0xb294bb'
  #   cyan:    '0x8abeb7'
  #   white:   '0xc5c8c6'
  # # Bright colors
  # bright:
  #   black:   '0x969896'
  #   red:     '0xde935f'
  #   green:   '0x282a2e'
  #   yellow:  '0x373b41'
  #   blue:    '0xb4b7b4'
  #   magenta: '0xe0e0e0'
  #   cyan:    '0xa3685a'
  #   white:   '0xffffff'

  # Indexed Colors
  #
  # The indexed colors include all colors from 16 to 256.
  # When these are not set, they're filled with sensible defaults.
  #
  # Example:
  #   `- { index: 16, color: '0xff00ff' }`
  #
  # indexed_colors: []

# Visual Bell
#
# Any time the BEL code is received, Alacritty "rings" the visual bell. Once
# rung, the terminal background will be set to white and transition back to the
# default background color. You can control the rate of this transition by
# setting the `duration` property (represented in milliseconds). You can also
# configure the transition function by setting the `animation` property.
#
# Possible values for `animation`
# `Ease`
# `EaseOut`
# `EaseOutSine`
# `EaseOutQuad`
# `EaseOutCubic`
# `EaseOutQuart`
# `EaseOutQuint`
# `EaseOutExpo`
# `EaseOutCirc`
# `Linear`
#
# To completely disable the visual bell, set its duration to 0.
#
bell:
  animation: EaseOutExpo
  color: '0xffffff'
  duration: 0

# Background opacity
background_opacity: 1.0

# Key bindings
#
# Key bindings are specified as a list of objects. Each binding will specify a
# key and modifiers required to trigger it, terminal modes where the binding is
# applicable, and what should be done when the key binding fires. It can either
# send a byte sequence to the running application (`chars`), execute a
# predefined action (`action`) or fork and execute a specified command plus
# arguments (`command`).
#
# Bindings are always filled by default, but will be replaced when a new binding
# with the same triggers is defined. To unset a default binding, it can be
# mapped to the `None` action.
#
# Example:
#   `- { key: V, mods: Control|Shift, action: Paste }`
#
# Available fields:
#   - key
#   - mods (optional)
#   - chars | action | command (exactly one required)
#   - mode (optional)
#
# Values for `key`:
#   - `A` -> `Z`
#   - `F1` -> `F12`
#   - `Key1` -> `Key0`
#
#   A full list with available key codes can be found here:
#   https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
#
#   Instead of using the name of the keys, the `key` field also supports using
#   the scancode of the desired key. Scancodes have to be specified as a
#   decimal number.
#   This command will allow you to display the hex scancodes for certain keys:
#     `showkey --scancodes`
#
# Values for `mods`:
#   - Command
#   - Control
#   - Option
#   - Super
#   - Shift
#   - Alt
#
#   Multiple `mods` can be combined using `|` like this: `mods: Control|Shift`.
#   Whitespace and capitalization is relevant and must match the example.
#
# Values for `chars`:
#   The `chars` field writes the specified string to the terminal. This makes
#   it possible to pass escape sequences.
#   To find escape codes for bindings like `PageUp` ("\x1b[5~"), you can run
#   the command `showkey -a` outside of tmux.
#   Note that applications use terminfo to map escape sequences back to
#   keys. It is therefore required to update the terminfo when
#   changing an escape sequence.
#
# Values for `action`:
#   - Paste
#   - PasteSelection
#   - Copy
#   - IncreaseFontSize
#   - DecreaseFontSize
#   - ResetFontSize
#   - ScrollPageUp
#   - ScrollPageDown
#   - ScrollLineUp
#   - ScrollLineDown
#   - ScrollToTop
#   - ScrollToBottom
#   - ClearHistory
#   - Hide
#   - Quit
#   - ClearLogNotice
#   - SpawnNewInstance
#   - ToggleFullscreen
#   - None
#
# Values for `action` (macOS only):
#   - ToggleSimpleFullscreen: Enters fullscreen without occupying another space
#
# Values for `command`:
#   The `command` field must be a map containing a `program` string and
#   an `args` array of command line parameter strings.
#
#   Example:
#       `command: { program: "alacritty", args: ["-e", "vttest"] }`
#
# Values for `mode`:
#   - ~AppCursor
#   - AppCursor
#   - ~AppKeypad
#   - AppKeypad
#
key_bindings:
  - { key: V,        mods: Command,       action: Paste                        }
  - { key: C,        mods: Command,       action: Copy                         }
  - { key: Q,        mods: Command,       action: Quit                         }
  - { key: N,        mods: Command,       action: SpawnNewInstance             }
  - { key: Return,   mods: Command,       action: ToggleFullscreen             }

  - { key: Home,                          chars: "\x1bOH",   mode: AppCursor   }
  - { key: Home,                          chars: "\x1b[H",   mode: ~AppCursor  }
  - { key: End,                           chars: "\x1bOF",   mode: AppCursor   }
  - { key: End,                           chars: "\x1b[F",   mode: ~AppCursor  }
  - { key: Equals,   mods: Command,       action: IncreaseFontSize             }
  - { key: Minus,    mods: Command,       action: DecreaseFontSize             }
  - { key: Minus,    mods: Command|Shift, action: ResetFontSize                }
  - { key: PageUp,   mods: Shift,         chars: "\x1b[5;2~"                   }
  - { key: PageUp,   mods: Control,       chars: "\x1b[5;5~"                   }
  - { key: PageUp,                        chars: "\x1b[5~"                     }
  - { key: PageDown, mods: Shift,         chars: "\x1b[6;2~"                   }
  - { key: PageDown, mods: Control,       chars: "\x1b[6;5~"                   }
  - { key: PageDown,                      chars: "\x1b[6~"                     }
  - { key: Left,     mods: Shift,         chars: "\x1b[1;2D"                   }
  - { key: Left,     mods: Control,       chars: "\x1b[1;5D"                   }
  - { key: Left,     mods: Alt,           chars: "\x1b[1;3D"                   }
  - { key: Left,                          chars: "\x1b[D",   mode: ~AppCursor  }
  - { key: Left,                          chars: "\x1bOD",   mode: AppCursor   }
  - { key: Right,    mods: Shift,         chars: "\x1b[1;2C"                   }
  - { key: Right,    mods: Control,       chars: "\x1b[1;5C"                   }
  - { key: Right,    mods: Alt,           chars: "\x1b[1;3C"                   }
  - { key: Right,                         chars: "\x1b[C",   mode: ~AppCursor  }
  - { key: Right,                         chars: "\x1bOC",   mode: AppCursor   }
  - { key: Up,       mods: Shift,         chars: "\x1b[1;2A"                   }
  - { key: Up,       mods: Control,       chars: "\x1b[1;5A"                   }
  - { key: Up,       mods: Alt,           chars: "\x1b[1;3A"                   }
  - { key: Up,                            chars: "\x1b[A",   mode: ~AppCursor  }
  - { key: Up,                            chars: "\x1bOA",   mode: AppCursor   }
  - { key: Down,     mods: Shift,         chars: "\x1b[1;2B"                   }
  - { key: Down,     mods: Control,       chars: "\x1b[1;5B"                   }
  - { key: Down,     mods: Alt,           chars: "\x1b[1;3B"                   }
  - { key: Down,                          chars: "\x1b[B",   mode: ~AppCursor  }
  - { key: Down,                          chars: "\x1bOB",   mode: AppCursor   }
  - { key: Tab,      mods: Shift,         chars: "\x1b[Z"                      }
  - { key: F1,                            chars: "\x1bOP"                      }
  - { key: F2,                            chars: "\x1bOQ"                      }
  - { key: F3,                            chars: "\x1bOR"                      }
  - { key: F4,                            chars: "\x1bOS"                      }
  - { key: F5,                            chars: "\x1b[15~"                    }
  - { key: F6,                            chars: "\x1b[17~"                    }
  - { key: F7,                            chars: "\x1b[18~"                    }
  - { key: F8,                            chars: "\x1b[19~"                    }
  - { key: F9,                            chars: "\x1b[20~"                    }
  - { key: F10,                           chars: "\x1b[21~"                    }
  - { key: F11,                           chars: "\x1b[23~"                    }
  - { key: F12,                           chars: "\x1b[24~"                    }
  - { key: Back,                          chars: "\x7f"                        }
  - { key: Back,     mods: Alt,           chars: "\x1b\x7f"                    }
  - { key: Insert,                        chars: "\x1b[2~"                     }
  - { key: Delete,                        chars: "\x1b[3~"                     }

    # shortcuts for tmux. the leader key is control-b (0x02)
  - { key: W,        mods: Command,       chars: "\x02&"                       }  # close tab (kill)
  - { key: T,        mods: Command,       chars: "\x02c"                       }  # new tab
  - { key: RBracket, mods: Command|Shift, chars: "\x02n"                       }  # select next tab
  - { key: LBracket, mods: Command|Shift, chars: "\x02p"                       }  # select previous tab
  - { key: RBracket, mods: Command,       chars: "\x02o"                       }  # select next pane
  - { key: LBracket, mods: Command,       chars: "\x02;"                       }  # select last (previously used) pane
  - { key: F,        mods: Command,       chars: "\x02/"                       }  # search (upwards) (see tmux.conf)

mouse:
  # Click settings
  #
  # The `double_click` and `triple_click` settings control the time
  # alacritty should wait for accepting multiple clicks as one double
  # or triple click.
  double_click: { threshold: 300 }
  triple_click: { threshold: 300 }

  # If this is `true`, the cursor is temporarily hidden when typing.
  hide_when_typing: true

  # URL launcher
  # url:
    # This program is executed when clicking on a text which is recognized as a URL.
    # The URL is always added to the command as the last parameter.
    #
    # When set to `None`, URL launching will be disabled completely.
    #
    # Default:
    #   - (macOS) open
    #   - (Linux) xdg-open
    #   - (Windows) explorer
    # launcher:
    #   program: xdg-open
    #   args: []

    # These are the modifiers that need to be held down for opening URLs when clicking
    # on them. The available modifiers are documented in the key binding section.
    # modifiers: Control|Shift

selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>"

  # When set to `true`, selected text will be copied to the primary clipboard.
  save_to_clipboard: false

# Mouse bindings
#
# Available fields:
# - mouse
# - action
# - mods (optional)
#
# Values for `mouse`:
# - Middle
# - Left
# - Right
# - Numeric identifier such as `5`
#
# All available `mods` and `action` values are documented in the key binding
# section.
mouse_bindings:
  - { mouse: Middle, action: PasteSelection }

cursor:
  # Cursor style
  #
  # Values for 'style':
  #   - ▇ Block
  #   - _ Underline
  #   - | Beam
  style: Block

  # If this is `true`, the cursor will be rendered as a hollow box when the
  # window is not focused.
  unfocused_hollow: true

# dynamic_title: false

# Live config reload (changes require restart)
live_config_reload: true

debug:
  # Should display the render timer
  render_timer: false

  # Keep the log file after quitting Alacritty.
  persistent_logging: false

  # Log level
  #
  # Values for `log_level`:
  #   - OFF
  #   - ERROR
  #   - WARN
  #   - INFO
  #   - DEBUG
  #   - TRACE
  log_level: OFF

  # Print all received window events.
  print_events: false

  # Record all characters and escape sequences as test data.
  ref_test: false

# Shell
#
# You can set shell.program to the path of your favorite shell, e.g. /bin/fish.
# Entries in shell.args are passed unmodified as arguments to the shell.
shell:
  program: /usr/local/bin/fish
  args:
    - --command=tmux

# vim: nospell









# Configuration for Alacritty, the GPU enhanced terminal emulator.

# Import additional configuration files
#
# Imports are loaded in order, skipping all missing files, with the importing
# file being loaded last. If a field is already present in a previous import, it
# will be replaced.
#
# All imports must either be absolute paths starting with `/`, or paths relative
# to the user's home directory starting with `~/`.
#import:
#  - /path/to/alacritty.yml

# Any items in the `env` entry below will be added as
# environment variables. Some entries may override variables
# set by alacritty itself.
#env:
  # TERM variable
  #
  # This value is used to set the `$TERM` environment variable for
  # each instance of Alacritty. If it is not present, alacritty will
  # check the local terminfo database and use `alacritty` if it is
  # available, otherwise `xterm-256color` is used.
  #TERM: alacritty

#window:
  # Window dimensions (changes require restart)
  #
  # Number of lines/columns (not pixels) in the terminal. The number of columns
  # must be at least `2`, while using a value of `0` for columns and lines will
  # fall back to the window manager's recommended size.
  #dimensions:
  #  columns: 0
  #  lines: 0

  # Window position (changes require restart)
  #
  # Specified in number of pixels.
  # If the position is not set, the window manager will handle the placement.
  #position:
  #  x: 0
  #  y: 0

  # Window padding (changes require restart)
  #
  # Blank space added around the window in pixels. This padding is scaled
  # by DPI and the specified value is always added at both opposing sides.
  #padding:
  #  x: 0
  #  y: 0

  # Spread additional padding evenly around the terminal content.
  #dynamic_padding: false

  # Window decorations
  #
  # Values for `decorations`:
  #     - full: Borders and title bar
  #     - none: Neither borders nor title bar
  #
  # Values for `decorations` (macOS only):
  #     - transparent: Title bar, transparent background and title bar buttons
  #     - buttonless: Title bar, transparent background and no title bar buttons
  decorations: full

  # Startup Mode (changes require restart)
  #
  # Values for `startup_mode`:
  #   - Windowed
  #   - Maximized
  #   - Fullscreen
  #
  # Values for `startup_mode` (macOS only):
  #   - SimpleFullscreen
  #startup_mode: Windowed

  # Window title
  #title: Terminal

  # Allow terminal applications to change Alacritty's window title.
  #dynamic_title: true

  # Window class (Linux/BSD only):
  #class:
    # Application instance name
    #instance: Alacritty
    # General application class
    #general: Alacritty

  # GTK theme variant (Linux/BSD only)
  #
  # Override the variant of the GTK theme. Commonly supported values are `dark`
  # and `light`. Set this to `None` to use the default theme variant.
  #gtk_theme_variant: None

#scrolling:
  # Maximum number of lines in the scrollback buffer.
  # Specifying '0' will disable scrolling.
  #history: 10000

  # Scrolling distance multiplier.
  #multiplier: 3

# Font configuration
#font:
  # Normal (roman) font face
  #normal:
    # Font family
    #
    # Default:
    #   - (macOS) Menlo
    #   - (Linux/BSD) monospace
    #   - (Windows) Consolas
    #family: monospace

    # The `style` can be specified to pick a specific face.
    #style: Regular

  # Bold font face
  #bold:
    # Font family
    #
    # If the bold family is not specified, it will fall back to the
    # value specified for the normal font.
    #family: monospace

    # The `style` can be specified to pick a specific face.
    #style: Bold

  # Italic font face
  #italic:
    # Font family
    #
    # If the italic family is not specified, it will fall back to the
    # value specified for the normal font.
    #family: monospace

    # The `style` can be specified to pick a specific face.
    #style: Italic

  # Bold italic font face
  #bold_italic:
    # Font family
    #
    # If the bold italic family is not specified, it will fall back to the
    # value specified for the normal font.
    #family: monospace

    # The `style` can be specified to pick a specific face.
    #style: Bold Italic

  # Point size
  #size: 11.0

  # Offset is the extra space around each character. `offset.y` can be thought
  # of as modifying the line spacing, and `offset.x` as modifying the letter
  # spacing.
  #offset:
  #  x: 0
  #  y: 0

  # Glyph offset determines the locations of the glyphs within their cells with
  # the default being at the bottom. Increasing `x` moves the glyph to the
  # right, increasing `y` moves the glyph upward.
  #glyph_offset:
  #  x: 0
  #  y: 0

  # Thin stroke font rendering (macOS only)
  #
  # Thin strokes are suitable for retina displays, but for non-retina screens
  # it is recommended to set `use_thin_strokes` to `false`.
  #use_thin_strokes: true

# If `true`, bold text is drawn using the bright color variants.
#draw_bold_text_with_bright_colors: false

# Colors (Tomorrow Night)
#colors:
  # Default colors
  #primary:
  #  background: '#1d1f21'
  #  foreground: '#c5c8c6'

    # Bright and dim foreground colors
    #
    # The dimmed foreground color is calculated automatically if it is not
    # present. If the bright foreground color is not set, or
    # `draw_bold_text_with_bright_colors` is `false`, the normal foreground
    # color will be used.
    #dim_foreground: '#828482'
    #bright_foreground: '#eaeaea'

  # Cursor colors
  #
  # Colors which should be used to draw the terminal cursor.
  #
  # Allowed values are CellForeground/CellBackground, which reference the
  # affected cell, or hexadecimal colors like #ff00ff.
  #cursor:
  #  text: CellBackground
  #  cursor: CellForeground

  # Vi mode cursor colors
  #
  # Colors for the cursor when the vi mode is active.
  #
  # Allowed values are CellForeground/CellBackground, which reference the
  # affected cell, or hexadecimal colors like #ff00ff.
  #vi_mode_cursor:
  #  text: CellBackground
  #  cursor: CellForeground

  # Search colors
  #
  # Colors used for the search bar and match highlighting.
  #search:
    # Allowed values are CellForeground/CellBackground, which reference the
    # affected cell, or hexadecimal colors like #ff00ff.
    #matches:
    #  foreground: '#000000'
    #  background: '#ffffff'
    #focused_match:
    #  foreground: '#ffffff'
    #  background: '#000000'

    #bar:
    #  background: '#c5c8c6'
    #  foreground: '#1d1f21'

  # Keyboard regex hints
  #hints:
    # First character in the hint label
    #
    # Allowed values are CellForeground/CellBackground, which reference the
    # affected cell, or hexadecimal colors like #ff00ff.
    #start:
    #  foreground: '#1d1f21'
    #  background: '#e9ff5e'

    # All characters after the first one in the hint label
    #
    # Allowed values are CellForeground/CellBackground, which reference the
    # affected cell, or hexadecimal colors like #ff00ff.
    #end:
    #  foreground: '#e9ff5e'
    #  background: '#1d1f21'

  # Line indicator
  #
  # Color used for the indicator displaying the position in history during
  # search and vi mode.
  #
  # By default, these will use the opposing primary color.
  #line_indicator:
  #  foreground: None
  #  background: None

  # Selection colors
  #
  # Colors which should be used to draw the selection area.
  #
  # Allowed values are CellForeground/CellBackground, which reference the
  # affected cell, or hexadecimal colors like #ff00ff.
  #selection:
  #  text: CellBackground
  #  background: CellForeground

  # Normal colors
  #normal:
  #  black:   '#1d1f21'
  #  red:     '#cc6666'
  #  green:   '#b5bd68'
  #  yellow:  '#f0c674'
  #  blue:    '#81a2be'
  #  magenta: '#b294bb'
  #  cyan:    '#8abeb7'
  #  white:   '#c5c8c6'

  # Bright colors
  #bright:
  #  black:   '#666666'
  #  red:     '#d54e53'
  #  green:   '#b9ca4a'
  #  yellow:  '#e7c547'
  #  blue:    '#7aa6da'
  #  magenta: '#c397d8'
  #  cyan:    '#70c0b1'
  #  white:   '#eaeaea'

  # Dim colors
  #
  # If the dim colors are not set, they will be calculated automatically based
  # on the `normal` colors.
  #dim:
  #  black:   '#131415'
  #  red:     '#864343'
  #  green:   '#777c44'
  #  yellow:  '#9e824c'
  #  blue:    '#556a7d'
  #  magenta: '#75617b'
  #  cyan:    '#5b7d78'
  #  white:   '#828482'

  # Indexed Colors
  #
  # The indexed colors include all colors from 16 to 256.
  # When these are not set, they're filled with sensible defaults.
  #
  # Example:
  #   `- { index: 16, color: '#ff00ff' }`
  #
  #indexed_colors: []

# Bell
#
# The bell is rung every time the BEL control character is received.
#bell:
  # Visual Bell Animation
  #
  # Animation effect for flashing the screen when the visual bell is rung.
  #
  # Values for `animation`:
  #   - Ease
  #   - EaseOut
  #   - EaseOutSine
  #   - EaseOutQuad
  #   - EaseOutCubic
  #   - EaseOutQuart
  #   - EaseOutQuint
  #   - EaseOutExpo
  #   - EaseOutCirc
  #   - Linear
  #animation: EaseOutExpo

  # Duration of the visual bell flash in milliseconds. A `duration` of `0` will
  # disable the visual bell animation.
  #duration: 0

  # Visual bell animation color.
  #color: '#ffffff'

  # Bell Command
  #
  # This program is executed whenever the bell is rung.
  #
  # When set to `command: None`, no command will be executed.
  #
  # Example:
  #   command:
  #     program: notify-send
  #     args: ["Hello, World!"]
  #
  #command: None

# Background opacity
#
# Window opacity as a floating point number from `0.0` to `1.0`.
# The value `0.0` is completely transparent and `1.0` is opaque.
#background_opacity: 1.0

#selection:
  # This string contains all characters that are used as separators for
  # "semantic words" in Alacritty.
  #semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"

  # When set to `true`, selected text will be copied to the primary clipboard.
  #save_to_clipboard: false

#cursor:
  # Cursor style
  #style:
    # Cursor shape
    #
    # Values for `shape`:
    #   - ▇ Block
    #   - _ Underline
    #   - | Beam
    #shape: Block

    # Cursor blinking state
    #
    # Values for `blinking`:
    #   - Never: Prevent the cursor from ever blinking
    #   - Off: Disable blinking by default
    #   - On: Enable blinking by default
    #   - Always: Force the cursor to always blink
    #blinking: Off

  # Vi mode cursor style
  #
  # If the vi mode cursor style is `None` or not specified, it will fall back to
  # the style of the active value of the normal cursor.
  #
  # See `cursor.style` for available options.
  #vi_mode_style: None

  # Cursor blinking interval in milliseconds.
  #blink_interval: 750

  # If this is `true`, the cursor will be rendered as a hollow box when the
  # window is not focused.
  #unfocused_hollow: true

  # Thickness of the cursor relative to the cell width as floating point number
  # from `0.0` to `1.0`.
  #thickness: 0.15

# Live config reload (changes require restart)
#live_config_reload: true

# Shell
#
# You can set `shell.program` to the path of your favorite shell, e.g.
# `/bin/fish`. Entries in `shell.args` are passed unmodified as arguments to the
# shell.
#
# Default:
#   - (macOS) /bin/bash --login
#   - (Linux/BSD) user login shell
#   - (Windows) powershell
#shell:
#  program: /bin/bash
#  args:
#    - --login

# Startup directory
#
# Directory the shell is started in. If this is unset, or `None`, the working
# directory of the parent process will be used.
#working_directory: None

# Send ESC (\x1b) before characters when alt is pressed.
#alt_send_esc: true

#mouse:
  # Click settings
  #
  # The `double_click` and `triple_click` settings control the time
  # alacritty should wait for accepting multiple clicks as one double
  # or triple click.
  #double_click: { threshold: 300 }
  #triple_click: { threshold: 300 }

  # If this is `true`, the cursor is temporarily hidden when typing.
  #hide_when_typing: false

# Regex hints
#
# Terminal hints can be used to find text in the visible part of the terminal
# and pipe it to other applications.
#hints:
  # Keys used for the hint labels.
  #alphabet: "jfkdls;ahgurieowpq"

  # List with all available hints
  #
  # Each hint must have a `regex` and either an `action` or a `command` field.
  # The fields `mouse`, `binding` and `post_processing` are optional.
  #
  # The fields `command`, `binding.key`, `binding.mods`, `binding.mode` and
  # `mouse.mods` accept the same values as they do in the `key_bindings` section.
  #
  # The `mouse.enabled` field controls if the hint should be underlined while
  # the mouse with all `mouse.mods` keys held or the vi mode cursor is above it.
  #
  # If the `post_processing` field is set to `true`, heuristics will be used to
  # shorten the match if there are characters likely not to be part of the hint
  # (e.g. a trailing `.`). This is most useful for URIs.
  #
  # Values for `action`:
  #   - Copy
  #       Copy the hint's text to the clipboard.
  #   - Paste
  #       Paste the hint's text to the terminal or search.
  #   - Select
  #       Select the hint's text.
  #   - MoveViModeCursor
  #       Move the vi mode cursor to the beginning of the hint.
  #enabled:
  # - regex: "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)\
  #           [^\u0000-\u001F\u007F-\u009F<>\"\\s{-}\\^⟨⟩`]+"
  #   command: xdg-open
  #   post_processing: true
  #   mouse:
  #     enabled: true
  #     mods: None
  #   binding:
  #     key: U
  #     mods: Control|Shift

# Mouse bindings
#
# Mouse bindings are specified as a list of objects, much like the key
# bindings further below.
#
# To trigger mouse bindings when an application running within Alacritty
# captures the mouse, the `Shift` modifier is automatically added as a
# requirement.
#
# Each mouse binding will specify a:
#
# - `mouse`:
#
#   - Middle
#   - Left
#   - Right
#   - Numeric identifier such as `5`
#
# - `action` (see key bindings)
#
# And optionally:
#
# - `mods` (see key bindings)
#mouse_bindings:
#  - { mouse: Middle, action: PasteSelection }

# Key bindings
#
# Key bindings are specified as a list of objects. For example, this is the
# default paste binding:
#
# `- { key: V, mods: Control|Shift, action: Paste }`
#
# Each key binding will specify a:
#
# - `key`: Identifier of the key pressed
#
#    - A-Z
#    - F1-F24
#    - Key0-Key9
#
#    A full list with available key codes can be found here:
#    https://docs.rs/glutin/*/glutin/event/enum.VirtualKeyCode.html#variants
#
#    Instead of using the name of the keys, the `key` field also supports using
#    the scancode of the desired key. Scancodes have to be specified as a
#    decimal number. This command will allow you to display the hex scancodes
#    for certain keys:
#
#       `showkey --scancodes`.
#
# Then exactly one of:
#
# - `chars`: Send a byte sequence to the running application
#
#    The `chars` field writes the specified string to the terminal. This makes
#    it possible to pass escape sequences. To find escape codes for bindings
#    like `PageUp` (`"\x1b[5~"`), you can run the command `showkey -a` outside
#    of tmux. Note that applications use terminfo to map escape sequences back
#    to keys. It is therefore required to update the terminfo when changing an
#    escape sequence.
#
# - `action`: Execute a predefined action
#
#   - ToggleViMode
#   - SearchForward
#       Start searching toward the right of the search origin.
#   - SearchBackward
#       Start searching toward the left of the search origin.
#   - Copy
#   - Paste
#   - IncreaseFontSize
#   - DecreaseFontSize
#   - ResetFontSize
#   - ScrollPageUp
#   - ScrollPageDown
#   - ScrollHalfPageUp
#   - ScrollHalfPageDown
#   - ScrollLineUp
#   - ScrollLineDown
#   - ScrollToTop
#   - ScrollToBottom
#   - ClearHistory
#       Remove the terminal's scrollback history.
#   - Hide
#       Hide the Alacritty window.
#   - Minimize
#       Minimize the Alacritty window.
#   - Quit
#       Quit Alacritty.
#   - ToggleFullscreen
#   - SpawnNewInstance
#       Spawn a new instance of Alacritty.
#   - ClearLogNotice
#       Clear Alacritty's UI warning and error notice.
#   - ClearSelection
#       Remove the active selection.
#   - ReceiveChar
#   - None
#
# - Vi mode exclusive actions:
#
#   - Open
#       Perform the action of the first matching hint under the vi mode cursor
#       with `mouse.enabled` set to `true`.
#   - ToggleNormalSelection
#   - ToggleLineSelection
#   - ToggleBlockSelection
#   - ToggleSemanticSelection
#       Toggle semantic selection based on `selection.semantic_escape_chars`.
#
# - Vi mode exclusive cursor motion actions:
#
#   - Up
#       One line up.
#   - Down
#       One line down.
#   - Left
#       One character left.
#   - Right
#       One character right.
#   - First
#       First column, or beginning of the line when already at the first column.
#   - Last
#       Last column, or beginning of the line when already at the last column.
#   - FirstOccupied
#       First non-empty cell in this terminal row, or first non-empty cell of
#       the line when already at the first cell of the row.
#   - High
#       Top of the screen.
#   - Middle
#       Center of the screen.
#   - Low
#       Bottom of the screen.
#   - SemanticLeft
#       Start of the previous semantically separated word.
#   - SemanticRight
#       Start of the next semantically separated word.
#   - SemanticLeftEnd
#       End of the previous semantically separated word.
#   - SemanticRightEnd
#       End of the next semantically separated word.
#   - WordLeft
#       Start of the previous whitespace separated word.
#   - WordRight
#       Start of the next whitespace separated word.
#   - WordLeftEnd
#       End of the previous whitespace separated word.
#   - WordRightEnd
#       End of the next whitespace separated word.
#   - Bracket
#       Character matching the bracket at the cursor's location.
#   - SearchNext
#       Beginning of the next match.
#   - SearchPrevious
#       Beginning of the previous match.
#   - SearchStart
#       Start of the match to the left of the vi mode cursor.
#   - SearchEnd
#       End of the match to the right of the vi mode cursor.
#
# - Search mode exclusive actions:
#   - SearchFocusNext
#       Move the focus to the next search match.
#   - SearchFocusPrevious
#       Move the focus to the previous search match.
#   - SearchConfirm
#   - SearchCancel
#   - SearchClear
#       Reset the search regex.
#   - SearchDeleteWord
#       Delete the last word in the search regex.
#   - SearchHistoryPrevious
#       Go to the previous regex in the search history.
#   - SearchHistoryNext
#       Go to the next regex in the search history.
#
# - macOS exclusive actions:
#   - ToggleSimpleFullscreen
#       Enter fullscreen without occupying another space.
#
# - Linux/BSD exclusive actions:
#
#   - CopySelection
#       Copy from the selection buffer.
#   - PasteSelection
#       Paste from the selection buffer.
#
# - `command`: Fork and execute a specified command plus arguments
#
#    The `command` field must be a map containing a `program` string and an
#    `args` array of command line parameter strings. For example:
#       `{ program: "alacritty", args: ["-e", "vttest"] }`
#
# And optionally:
#
# - `mods`: Key modifiers to filter binding actions
#
#    - Command
#    - Control
#    - Option
#    - Super
#    - Shift
#    - Alt
#
#    Multiple `mods` can be combined using `|` like this:
#       `mods: Control|Shift`.
#    Whitespace and capitalization are relevant and must match the example.
#
# - `mode`: Indicate a binding for only specific terminal reported modes
#
#    This is mainly used to send applications the correct escape sequences
#    when in different modes.
#
#    - AppCursor
#    - AppKeypad
#    - Search
#    - Alt
#    - Vi
#
#    A `~` operator can be used before a mode to apply the binding whenever
#    the mode is *not* active, e.g. `~Alt`.
#
# Bindings are always filled by default, but will be replaced when a new
# binding with the same triggers is defined. To unset a default binding, it can
# be mapped to the `ReceiveChar` action. Alternatively, you can use `None` for
# a no-op if you do not wish to receive input characters for that binding.
#
# If the same trigger is assigned to multiple actions, all of them are executed
# in the order they were defined in.
#key_bindings:
  #- { key: Paste,                                       action: Paste          }
  #- { key: Copy,                                        action: Copy           }
  #- { key: L,         mods: Control,                    action: ClearLogNotice }
  #- { key: L,         mods: Control, mode: ~Vi|~Search, chars: "\x0c"          }
  #- { key: PageUp,    mods: Shift,   mode: ~Alt,        action: ScrollPageUp,  }
  #- { key: PageDown,  mods: Shift,   mode: ~Alt,        action: ScrollPageDown }
  #- { key: Home,      mods: Shift,   mode: ~Alt,        action: ScrollToTop,   }
  #- { key: End,       mods: Shift,   mode: ~Alt,        action: ScrollToBottom }

  # Vi Mode
  #- { key: Space,  mods: Shift|Control, mode: ~Search,    action: ToggleViMode            }
  #- { key: Space,  mods: Shift|Control, mode: Vi|~Search, action: ScrollToBottom          }
  #- { key: Escape,                      mode: Vi|~Search, action: ClearSelection          }
  #- { key: I,                           mode: Vi|~Search, action: ToggleViMode            }
  #- { key: I,                           mode: Vi|~Search, action: ScrollToBottom          }
  #- { key: C,      mods: Control,       mode: Vi|~Search, action: ToggleViMode            }
  #- { key: Y,      mods: Control,       mode: Vi|~Search, action: ScrollLineUp            }
  #- { key: E,      mods: Control,       mode: Vi|~Search, action: ScrollLineDown          }
  #- { key: G,                           mode: Vi|~Search, action: ScrollToTop             }
  #- { key: G,      mods: Shift,         mode: Vi|~Search, action: ScrollToBottom          }
  #- { key: B,      mods: Control,       mode: Vi|~Search, action: ScrollPageUp            }
  #- { key: F,      mods: Control,       mode: Vi|~Search, action: ScrollPageDown          }
  #- { key: U,      mods: Control,       mode: Vi|~Search, action: ScrollHalfPageUp        }
  #- { key: D,      mods: Control,       mode: Vi|~Search, action: ScrollHalfPageDown      }
  #- { key: Y,                           mode: Vi|~Search, action: Copy                    }
  #- { key: Y,                           mode: Vi|~Search, action: ClearSelection          }
  #- { key: Copy,                        mode: Vi|~Search, action: ClearSelection          }
  #- { key: V,                           mode: Vi|~Search, action: ToggleNormalSelection   }
  #- { key: V,      mods: Shift,         mode: Vi|~Search, action: ToggleLineSelection     }
  #- { key: V,      mods: Control,       mode: Vi|~Search, action: ToggleBlockSelection    }
  #- { key: V,      mods: Alt,           mode: Vi|~Search, action: ToggleSemanticSelection }
  #- { key: Return,                      mode: Vi|~Search, action: Open                    }
  #- { key: K,                           mode: Vi|~Search, action: Up                      }
  #- { key: J,                           mode: Vi|~Search, action: Down                    }
  #- { key: H,                           mode: Vi|~Search, action: Left                    }
  #- { key: L,                           mode: Vi|~Search, action: Right                   }
  #- { key: Up,                          mode: Vi|~Search, action: Up                      }
  #- { key: Down,                        mode: Vi|~Search, action: Down                    }
  #- { key: Left,                        mode: Vi|~Search, action: Left                    }
  #- { key: Right,                       mode: Vi|~Search, action: Right                   }
  #- { key: Key0,                        mode: Vi|~Search, action: First                   }
  #- { key: Key4,   mods: Shift,         mode: Vi|~Search, action: Last                    }
  #- { key: Key6,   mods: Shift,         mode: Vi|~Search, action: FirstOccupied           }
  #- { key: H,      mods: Shift,         mode: Vi|~Search, action: High                    }
  #- { key: M,      mods: Shift,         mode: Vi|~Search, action: Middle                  }
  #- { key: L,      mods: Shift,         mode: Vi|~Search, action: Low                     }
  #- { key: B,                           mode: Vi|~Search, action: SemanticLeft            }
  #- { key: W,                           mode: Vi|~Search, action: SemanticRight           }
  #- { key: E,                           mode: Vi|~Search, action: SemanticRightEnd        }
  #- { key: B,      mods: Shift,         mode: Vi|~Search, action: WordLeft                }
  #- { key: W,      mods: Shift,         mode: Vi|~Search, action: WordRight               }
  #- { key: E,      mods: Shift,         mode: Vi|~Search, action: WordRightEnd            }
  #- { key: Key5,   mods: Shift,         mode: Vi|~Search, action: Bracket                 }
  #- { key: Slash,                       mode: Vi|~Search, action: SearchForward           }
  #- { key: Slash,  mods: Shift,         mode: Vi|~Search, action: SearchBackward          }
  #- { key: N,                           mode: Vi|~Search, action: SearchNext              }
  #- { key: N,      mods: Shift,         mode: Vi|~Search, action: SearchPrevious          }

  # Search Mode
  #- { key: Return,                mode: Search|Vi,  action: SearchConfirm         }
  #- { key: Escape,                mode: Search,     action: SearchCancel          }
  #- { key: C,      mods: Control, mode: Search,     action: SearchCancel          }
  #- { key: U,      mods: Control, mode: Search,     action: SearchClear           }
  #- { key: W,      mods: Control, mode: Search,     action: SearchDeleteWord      }
  #- { key: P,      mods: Control, mode: Search,     action: SearchHistoryPrevious }
  #- { key: N,      mods: Control, mode: Search,     action: SearchHistoryNext     }
  #- { key: Up,                    mode: Search,     action: SearchHistoryPrevious }
  #- { key: Down,                  mode: Search,     action: SearchHistoryNext     }
  #- { key: Return,                mode: Search|~Vi, action: SearchFocusNext       }
  #- { key: Return, mods: Shift,   mode: Search|~Vi, action: SearchFocusPrevious   }

  # (Windows, Linux, and BSD only)
  #- { key: V,              mods: Control|Shift, mode: ~Vi,        action: Paste            }
  #- { key: C,              mods: Control|Shift,                   action: Copy             }
  #- { key: F,              mods: Control|Shift, mode: ~Search,    action: SearchForward    }
  #- { key: B,              mods: Control|Shift, mode: ~Search,    action: SearchBackward   }
  #- { key: C,              mods: Control|Shift, mode: Vi|~Search, action: ClearSelection   }
  #- { key: Insert,         mods: Shift,                           action: PasteSelection   }
  #- { key: Key0,           mods: Control,                         action: ResetFontSize    }
  #- { key: Equals,         mods: Control,                         action: IncreaseFontSize }
  #- { key: Plus,           mods: Control,                         action: IncreaseFontSize }
  #- { key: NumpadAdd,      mods: Control,                         action: IncreaseFontSize }
  #- { key: Minus,          mods: Control,                         action: DecreaseFontSize }
  #- { key: NumpadSubtract, mods: Control,                         action: DecreaseFontSize }

  # (Windows only)
  #- { key: Return,   mods: Alt,           action: ToggleFullscreen }

  # (macOS only)
  #- { key: K,              mods: Command, mode: ~Vi|~Search, chars: "\x0c"                 }
  #- { key: K,              mods: Command, mode: ~Vi|~Search, action: ClearHistory          }
  #- { key: Key0,           mods: Command,                    action: ResetFontSize         }
  #- { key: Equals,         mods: Command,                    action: IncreaseFontSize      }
  #- { key: Plus,           mods: Command,                    action: IncreaseFontSize      }
  #- { key: NumpadAdd,      mods: Command,                    action: IncreaseFontSize      }
  #- { key: Minus,          mods: Command,                    action: DecreaseFontSize      }
  #- { key: NumpadSubtract, mods: Command,                    action: DecreaseFontSize      }
  #- { key: V,              mods: Command,                    action: Paste                 }
  #- { key: C,              mods: Command,                    action: Copy                  }
  #- { key: C,              mods: Command, mode: Vi|~Search,  action: ClearSelection        }
  #- { key: H,              mods: Command,                    action: Hide                  }
  #- { key: H,              mods: Command|Alt,                action: HideOtherApplications }
  #- { key: M,              mods: Command,                    action: Minimize              }
  #- { key: Q,              mods: Command,                    action: Quit                  }
  #- { key: W,              mods: Command,                    action: Quit                  }
  #- { key: N,              mods: Command,                    action: SpawnNewInstance      }
  #- { key: F,              mods: Command|Control,            action: ToggleFullscreen      }
  #- { key: F,              mods: Command, mode: ~Search,     action: SearchForward         }
  #- { key: B,              mods: Command, mode: ~Search,     action: SearchBackward        }

#debug:
  # Display the time it takes to redraw each frame.
  #render_timer: false

  # Keep the log file after quitting Alacritty.
  #persistent_logging: false

  # Log level
  #
  # Values for `log_level`:
  #   - Off
  #   - Error
  #   - Warn
  #   - Info
  #   - Debug
  #   - Trace
  #log_level: Warn

  # Print all received window events.
  #print_events: false
