# -*- encoding: utf-8 -*-

#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#
default['jenkins_demo']['jenkins_port'] = 8080

default['jenkins_demo']['jenkins_plugins'] = {
  'thinBackup' => '1.9',
  # TODO
  # 'command-launcher' => '1.0',
  'bouncycastle-api' => '2.16.2',
  'credentials' => '2.1.16',
  'plain-credentials' => '1.4',
  'slack' => '2.3',
  'script-security' => '1.35',
  'matrix-auth' => '2.2'
}

########################################
default['jenkins_demo']['default_username'] = ''
default['jenkins_demo']['default_password'] = ''

# TODO: improve the security
default['jenkins_demo']['chef_private_key'] = \
'-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEA6fIwUKxZXgKqEE6HCM94eEEeQ+n9mGpKn+CiKExI97mQtio4
uzB/4A7qVXfBYaa2jbPZzD6bDvGco88vgeDuRB5tNh/sRBD3T7L9CxNIGp9gMMsu
tRprwI5MEUsDDFXMKo5ZinpRe9fud5UBOmEHK0vjRVSgLVCGYdv/iXaBKY3feH8a
4gUuTzkdbUtoUMAUTfNyevhUfLRKSWjr5+f7krYYTqJpM7KUAL9e2dYMjkj3He7g
iM4uiPtAQnMYcsyevNgpM0uKnp6+pPzTMSkSNp3uIK6aQ4lR80lEfq8fRwqzsIuJ
dRT/+iJpd6XF8+GSyOt/tEh1RPiEKiGHLpmZGQIDAQABAoIBAQDFsipuIhcrQKki
OpoWMe0mAjFnRtdM85W4YYXm9AA9h4zow+lJFoUZfME+FINQ2CcwvClzVfyGtlqe
ezk0UjZHTkcQFA3+vy+fJCx+LX8jMEeDNFB2Lqub/yP9ARzEUcTEuaKlSRSOyTz1
xO9SvCfoyKp4Ljll0cSd8eGR8pjX2TSfJ85aFAcP1CHGa/qGdxhSrbL2PMXaNFIT
27ZEUo4FVqcwRFN6JuO4sAlnyg8axXlXNLpwPzW1Zi7auS9nAO9bDEIhP4YfFwWs
/iV7KBs/bryez94XS68b3MUXoZWS+1nP8ivBSOCH0mWy5/PhR4esih2EhXk/hi3P
dp6aX4p5AoGBAPrmS+4lrvnvk2EOj3vqSergd31XBTM6NRKSsIYCtlaXsVjMym/i
UdqcLqha4IEW3mucmpD3MBsTqshHGTI+67+tU/G23kThV/3U3a+jSR10FjgACPRd
8VhxrhTBvKjcw0uKeMl9uE0eb/2q8uVtX/8InOCvEfNGFCcszLsYFBr3AoGBAO6z
qhWt8y/HkqWgBcbDJKx+T050nM9fkkBk1ILZn/GMEU828aEvKSwa8wzcx1gPo8Uu
TP2SS0K0vnQv75UfyafgxFMVlELQrRTLHJqFQrCGikgBLNwHjRdvHfNujoBXbv+9
g4LVFqHv0/kVRc1kXhdEwBCZm29rCDVusKK0C1hvAoGBAOAY4qkLL4Y93j1KbA4Z
7XvEkfV5zEM9Mjosm06XDZW6V8Ug5Y+ZbdL8vQ/SW8PxUSh87/GbV3RX1KqeFnsy
iA7kGZ5D37NWMumdP4SpK50LGu1Z2qWpYu/EWeBgSsnopObL/6a4i+0VyqGgFuOl
FaENaFGnDTlk1otHEHXrw8lxAoGBAITL11fwSlbOhLs3537ImeKM8roHDiYgWVER
x1h0khLjhc24F31Aq3sqEwWY3h4TtVzBgXugo9Ycj8g70uH3qUyIMzC11KHHTkM/
LE6azJtAfjXI0Zgna0saOmNvoj+sZMhKOpvSyKCWuCrettKpf98aFHAnxN2bghmX
1xTtbVJpAoGBAKnqvADsNFaI1Ak7tdfJJ+chxnxXd1k6Mly44Jsp6oako4Nl2Uiw
3xL4JGed+QBmjFh+n4hR9T7J65fUFvBixBEAhDSXcRHWL84xTQWLtdHK4+zDWGJt
n2DMrFzhp1H6neUFMBeNOw+fQuhPj6OcLrs4dRdyQhVRp0ZOJyLMS39e
-----END RSA PRIVATE KEY-----'

default['jenkins_demo']['chef_public_key'] = \
  'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDp8jBQrFleAqoQTocIz3h4QR5'\
  'D6f2Yakqf4KIoTEj3uZC2Kji7MH/gDupVd8FhpraNs9nMPpsO8Zyjzy+B4O5EHm'\
  '02H+xEEPdPsv0LE0gan2Awyy61GmvAjkwRSwMMVcwqjlmKelF71+53lQE6YQcrS'\
  '+NFVKAtUIZh2/+JdoEpjd94fxriBS5POR1tS2hQwBRN83J6+FR8tEpJaOvn5/uS'\
  'thhOomkzspQAv17Z1gyOSPcd7uCIzi6I+0BCcxhyzJ682CkzS4qenr6k/NMxKRI'\
  '2ne4grppDiVHzSUR+rx9HCrOwi4l1FP/6Iml3pcXz4ZLI63+0SHVE+IQqIYcumZ'\
  'kZ chef@mytest.com'
