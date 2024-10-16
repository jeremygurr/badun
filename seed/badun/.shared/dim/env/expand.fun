problem=
case "$value" in
  '')
    problem="Missing required parameter: env"
  ;;
  e31)
    values=( e3 )
    add_cord 'env=e3 region=us dc=1 zone=a' || fail
  ;;
  e32)
    values=( e3 )
    add_cord 'env=e3 region=us dc=2 zone=a' || fail
  ;;
  e33)
    values=( e3 )
    add_cord 'env=e3 region=us dc=2 zone=b' || fail
  ;;
  e3|e2|e1)
    values=( "$value" )
  ;;
  *)
    problem="Invalid value for dim: env ($value)"
  ;;
esac
