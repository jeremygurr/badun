local target=$out_path/output.tab

local row_index row dim_count=${#all_dims[*]}
local row_count=$((${#coordinates[*]} / dim_count))

echo "env region dc zone host_group shard replica jump_host host host_path" >$target || fail
begin_for (( row_index = 0; row_index < row_count; row_index++ )); doo
  row_start=$((row_index * dim_count))
  row=${coordinates[*]:$row_start:$dim_count}
  echo "$row" >>$target || fail
end_for

update_successful=t
