from rich.text import Text
from datetime import datetime
import os

# NOTE: See rich style documentation for details

#################################
#             UTILS             #
#################################


def colored(text: str, color: str):
    return f"[{color}]{text}[/]"


def get_status(status):
    return colored(f" {status} ", "r " + blue)


def get_message(message):
    return " " + message


def get_clock() -> Text:
    return Text(f"{datetime.now().time().strftime(' %X ')}", "r " + cyan)


def get_username():
    try:
        username = os.getlogin()
    except OSError:
        uid = os.getuid()
        import pwd

        username = pwd.getpwuid(uid).pw_name
    return Text(f" {username} ", "r " + blue)


#################################
#            COLORS             #
#################################

dark_black = "#252a34"
transparent = "#000000"
white = "#e5e9f0"
grey = "#d8dee9"
red = "#bf616a"
frost_green = "#8fbcbb"
cyan = "#88c0d0"
green = "#a3be8c"
yellow = "#ebcb8b"
blue = "#81a1c1"
magenta = "#b48ead"
orange = "#d08770"

#################################
#            GENERAL            #
#################################
BACKGROUND = transparent
BAR_BACKGROUND = transparent
WORKSPACES_BACKGROUND = transparent
TODOS_BACKGROUND = transparent
BORDER_DIM = grey + " 50%"
BORDER_LIT = blue
BORDER_TITLE_DIM = grey, dark_black
BORDER_TITLE_LIT = white, blue
SEARCH_COLOR = red
YANK_COLOR = blue
SAVE_ON_ESCAPE = False
USE_DAY_FIRST = True
DATE_FORMAT = "%d %h"
TIME_FORMAT = "%H:%M"

#################################
#          DASHBOARD            #
#################################
legend = {"B": cyan, "O": orange, "G": green, "M": magenta, "R": red}
legend = {i + "]": j + "]" for i, j in legend.items()}

regex_style = {
    "U": red,
    "Y": grey,
    "6": blue,
    "a": blue,
    "#": yellow,
    r"(?<=\()[^()\n]+(?=\))": white,
}


def change(s: str):
    for i, j in legend.items():
        s = s.replace(i, j)

    return s


def stylize(art):
    art = "\n".join([change(i) for i in art])
    art = Text.from_markup(art)
    for i, j in regex_style.items():
        art.highlight_regex(i, j)

    return art


art = [
    r'[B]             _              _         _             [/B][R]     ___  [/R]',
    r'[B]   ()       | |            | |       | |            [/B][R]   //   \ [/R]',
    r'[B]   /\  __,  | |     _  _   | |       | |   __   __  [/B][R]  /   __/ [/R]',
    r'[B]  /  \/  |  |/ \   / |/ |  |/_) |   ||/ \_/  \_/  \_[/B][R]  \     \ [/R]',
    r'[B] /(__/\_/|_/|   |_/  |  |_/| \_/ \_/|/\_/ \__/ \__/ [/B][R]   \\___/ [/R]',
    r'[B]                                   /|               [/B][R]          [/R]',
    r'[B]                                   \|               [/B][R]          [/R]',
]

ART = stylize(art)
NL = " \n"
SEP = colored("─" * 60, "d " + grey)
DASHBOARD = [ART, "Completed: {done}",]
no_search_results = ["🔍", colored("No results found!", red)]


#################################
#           WORKSPACE           #
#################################
WORKSPACE = {
    "editing": cyan,
    "pointer": "|>",
    "children_hint": colored(" [{count}]", green),
    "start_expanded": True,
}
EMPTY_WORKSPACE = [
    ":(",
    "No workspaces yet?",
    f"Press {colored('a', cyan)} to add some!",
]

#################################
#            TODOS              #
#################################


COLUMN_ORDER = ["description", "due", "urgency"]  # order of columns
TODO = {
    "color_todos": False,
    "editing": cyan,
    "pointer": "·",
    "children_hint": colored(
        " ({done}/{total})", green
    ),  # vars: remaining, done, total
    # "children_hint": "[b magenta]({remaining}!)[/b magenta]",
    "due_icon": "? ",
    "effort_icon": "+",
    "effort_color": yellow,
    "recurrence_icon": "!",
    "recurrence_color": blue,
    "tags_color": red,
    "completed_icon": "",
    "pending_icon": " ",
    "overdue_icon": "!",
    "urgency1_icon": "1",
    "urgency2_icon": "2",
    "urgency3_icon": "3",
    "urgency4_icon": "4",
    "urgency1_color": "white",    
    "urgency2_color": "green",
    "urgency3_color": "yellow",
    "urgency4_color": "red",
    "start_expanded": True,
    "initial_urgency": 2,
}

EMPTY_TODO = [
    ":(",
    "Wow so Empty!?",
    "Add some todos to get started!",
]

#################################
#          STATUS BAR           #
#################################
bar = {
    "A": [(get_status, 0.1)],
    "C": [(get_clock, 1)],
}

#################################
#          KEYBINDING           #
#################################
keybindings = {
    "switch pane": "<tab>",
    "sort menu toggle": "<ctrl+s>",
    "start search": ["/", "S"],
    "remove item": "xx",
    "edit effort": "e",
    "edit recurrence": "r",
}
