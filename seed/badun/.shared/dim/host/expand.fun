problem=
case "$value" in
  '')
    if [[ "${d_host_path:-}" ]]; then
      values=( ${d_host_path##*/} )
    else
      problem="Missing required parameter: host"
    fi
  ;;
  *)
    values=( "$value" )
  ;;
esac
