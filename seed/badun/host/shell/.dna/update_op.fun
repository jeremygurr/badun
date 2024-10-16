if [[ "$d_host" != localhost ]]; then

  local pipe=$up_chosen_path/tunnel/pipe 

  if [[ ! -e ${pipe}_in || ! -e ${pipe}_out ]]; then
    log_fatal "Missing pipe: $pipe. Maybe try to clean build this cell: $(readlink $up_chosen_path/tunnel)"
    fail1
  fi

  echo "Connecting tunnel"

  local c out_fd in_fd
  exec {out_fd}<>${pipe}_out || fail
  exec {in_fd}<>${pipe}_in || fail
  defer "exec $out_fd>$- $in_fd>$-"

  cat <&$out_fd & || fail
  local pid=$!
  defer "kill $pid"

  echo "Remote shell started. "
  echo "Use q to exit shell, but leave the tunnel open. "
  echo "Use 'exit' to close down remote shell. "
  
  while true; do
    read -e -p "${d_host} ${CYAN}\$${RESET} " c
    case $c in
      q|quit)
        echo "Leaving debug shell."
        break
        ;;
      *)
        echo "$c" >&$in_fd || fail
        ;;
    esac
  done

else # localhost
  echo "Doesn't make sense to open a shell to local host this way. Just open a normal shell."
  fail1
fi

update_successful=t 

