d_command=

local file
for file in $d_files; do
  d_command+="echo '---------- start $file ----------'; cat $file; echo '---------- end $file ----------'; "
done

fresh=${top_fresh:-}
risk_tolerance=3 # Since we know we are only executing safe read only commands, we can allow host-execute to run

