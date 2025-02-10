#!/usr/bin/env sh

# This file is required. It is sourced when checking the goal of the mission
# has been achieved.
# It should end with a command returning 0 on success, and something else on
# failure.
# It should "unset" any local variable it has created, and any "global
# variable" that were only used for the mission. (The function _mission_check
# is automatically unset.)
#
# It typically looks like

_mission_check() {
  # ppc=$(. fc-lnr.sh | sed -n '1,5p;5q')
  ppc=$(. fc-lnr.sh 4)

  echo "ppc is $ppc"

  view=""
  while read -r pc; do
    if [ "$pc" =~ "cat*" ]; then
      view="$view\n$(eval $pc)"
      # echo '###############'
      # echo "$view"
    fi
  done <<< "$ppc"


  view_ref=""
  for d in "north" "south" "east" "west"; do
    view_ref="$view_ref\n$(cat $MISSION_DIR/ascii-art/$d.txt)"
  done

  # commands can be in any order, as long as all directions are present
  view=$(echo "$view" | sort)
  view_ref=$(echo "$view_ref" | sort)

  # echo "Sorted view ref:"
  # echo "XXXX${view_ref}XXXX"
  # echo "Sorted view to check:"
  # echo "XXXX${view}XXXX"

  if [ "$view" == "$view_ref" ]; then
    return 0
  else
    echo "$(gettext "The last four commands do not show all directions.")"
    return 1
  fi
}
_mission_check
