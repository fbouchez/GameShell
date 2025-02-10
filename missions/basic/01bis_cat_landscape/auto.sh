#!/usr/bin/env sh

. alt_history_start.sh

add_cmd "cat \"$(gettext 'west').txt\""
add_cmd "cat \"$(gettext 'south').txt\""
add_cmd "cat \"$(gettext 'north').txt\""
add_cmd "cat \"$(gettext 'east').txt\""

gsh check
