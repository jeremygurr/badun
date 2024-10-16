if [[ "${d_host_path:-}" ]]; then
  values=( "${d_host_path%/*}" )
  if [[ "$values" == "$d_host_path" ]]; then
    values=
  fi
fi
