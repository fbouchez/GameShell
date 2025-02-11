#!/usr/bin/env bash

. alt_history_start.sh

add_cmd "cat \"$(gettext 'west').txt\""
add_cmd "cat \"$(gettext 'west').txt\""
add_cmd "cat \"$(gettext 'west').txt\""
add_cmd "cat \"$(gettext 'west').txt\""
add_cmd gsh check
gsh assert check false
. alt_history_stop.sh

. alt_history_start.sh
add_cmd "cat *"
add_cmd gsh check
gsh assert check true
. alt_history_stop.sh

. alt_history_start.sh
add_cmd "cat \"$(gettext 'west').txt\""
add_cmd "cat \"$(gettext 'south').txt\""
add_cmd "cat \"$(gettext 'east').txt\""
add_cmd "cat \"$(gettext 'north').txt\""
add_cmd gsh check
gsh assert check true
. alt_history_stop.sh

. alt_history_start.sh
add_cmd "cat \"$(gettext 'south').txt\""
add_cmd "cat \"$(gettext 'west').txt\""
add_cmd "cat \"$(gettext 'north').txt\""
add_cmd "cat \"$(gettext 'east').txt\""
add_cmd gsh check
gsh assert check true
. alt_history_stop.sh

. alt_history_start.sh
add_cmd "cat \"$(gettext 'north').txt\""
add_cmd "cat \"$(gettext 'east').txt\""
add_cmd "cat \"$(gettext 'south').txt\""
add_cmd "cat \"$(gettext 'west').txt\""
add_cmd gsh check
gsh assert check true
. alt_history_stop.sh

. alt_history_start.sh
add_cmd "cat \"$(gettext 'east').txt\""
add_cmd "cat \"$(gettext 'north').txt\""
add_cmd "cat \"$(gettext 'west').txt\""
add_cmd "cat \"$(gettext 'south').txt\""
add_cmd gsh check
gsh assert check true
. alt_history_stop.sh
