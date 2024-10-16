if [[ "$d_host" != localhost ]]; then

  local pipe=$up_chosen_path/tunnel/pipe result= \
    command_successful=f \
    pipe_replay_state=${pipe_replay_state:-} \

  if [[ ! -e ${pipe}_in || ! -e ${pipe}_out ]]; then
    log_fatal "Missing pipe: $pipe. Maybe try to clean build this cell: $(readlink $up_chosen_path/tunnel)"
    fail1
  fi

  command=$d_command \
  prep_background_communication || fail

  local result
  command=$d_command \
  timeout=${d_timeout:-10} \
  run_pipe_command || fail

  if [[ "$command_successful" != t ]]; then
    log_fatal "Command failed to execute."
    fail1
  fi

else # localhost
  eval "$d_command" &>$out_path/command-output || fail
fi

echo "$result" >$out_path/command-output || fail

update_successful=t 

