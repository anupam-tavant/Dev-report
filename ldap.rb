require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new
ldap.host = "10.129.135.231"
ldap.port = 389
ldap.auth "mariammal.m@tavant.com", "MyKingdom@19"
if ldap.bind
  puts "Success"
else
  puts "Failure"
  puts ldap.get_operation_result
end

