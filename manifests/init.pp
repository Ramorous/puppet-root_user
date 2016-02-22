# Class: root_user
#
# This module will allow you to configure the root user's password
#
# Parameters:
#    class_enabled  (Boolean: default [false])
#    - Enables/Disables the process
#    password (String: default undefined)
#    - The password
#    enc_type (String: default SHA-512)
#    - Choice of MD5, SHA-256, SHA-512
#    enc_salt (String default "root_user")
#    - Salt for Password Encryption
#
class root_user (
  $class_enabled = false,
  $password      = undef,
  $enc_type      = 'SHA-512',
  $enc_salt      = 'Saltines',
) {
  # Verify if target host is Linux
  if $::kernel == 'Linux' {
    # Perform Validations
    if is_string($class_enabled) {
      $class_enabled_real = str2bool($class_enabled)
    } else {
      $class_enabled_real = $class_enabled
    }
    if ! is_string($password) {
      fail( 'password variable is not a string' )
    }
    if !( $enc_type in ['MD5','SHA-256','SHA-512'] ) {
      fail( 'enc_type must be MD5/SHA-256/SHA-512' )
    }
    if ! is_string($enc_salt) {
      fail( 'enc_salt variable is not a string' )
    }

    # Check if Class is disabled (Helps to disable some hosts)
    if $class_enabled_real == true {
      user { 'root':
        ensure => present,
        password => pw_hash($password, $enc_type, $enc_salt),
      }
    } else {
      notice('Class disabled.')
    }
  }
}
