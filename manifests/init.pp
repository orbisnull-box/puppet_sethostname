class sethostname (
  $fqdn,
) {
  validate_string($fqdn)

  contain  'sethostname::set'
}

