if [[ ! "${hostname:-}" ]]; then
  log_fatal "Internal error: missing hostname"
  fail1
fi

local target=$out_path/export/data.tab
mkdir -p $out_path/export || fail
echo "host ip" >$target || fail
local host nsArray nsLength

begin_for host in "${hostname[@]}"; doo
  nsArray=( $(nslookup $host) )
  nsLength=$(echo ${#nsArray[@]})
  echo $host ${nsArray[$nsLength-1]} >>$target || fail
end_for

update_successful=t
