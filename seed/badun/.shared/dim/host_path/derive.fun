local j=${d_jump_host:-}
local f=${d_host:-}
if [[ "$f" && "$j" ]]; then
  if [[ "$j" && "$j" != $empty_member ]]; then
    values=( "$j/$f" )
  else
    values=( "$f" )
  fi
fi

