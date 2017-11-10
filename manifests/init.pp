# @summary Class that installs and configures DNSMasq.
#
# Class and installs and configures DNSMasq server.
#
# @example Resource-like declaration
#   class { 'dnsmasq':
#     dhcp_range      => '192.168.0.101,192.168.0.199',
#     dhcp_route      => '192.168.0.254',
#     internal_domain => 'local',
#     upstream        => '8.8.8.8',
#   }
#
# @param upstream            Upstream DNS server to forward queries.
# @param dhcp_range          DHCP address range available for lease.
# @param dhcp_route          Router IP address for DHCP.
# @param internal_domain     Internal domain name.
# @param listen_addr         IP Address(es) to listen on.
# @param listen_iface        Network interface(s) to listen on.
# @param listen_except_iface Network interface to not listen on.
# @param dhcp_lease          DHCP lease time.
# @param config_dir          Configuration directory.
# @param debug_dhcp          Turn on DHCP debug logging.
# @param debug_dns           Turn on DNS debug logging.
#
class dnsmasq (
  $upstream,
  $dhcp_range,
  $dhcp_route,
  $internal_domain,
  $listen_addr         = undef,
  $listen_iface        = undef,
  $listen_except_iface = undef,
  $dhcp_lease          = '5m',
  $config_dir          = '/etc/dnsmasq.d',
  $debug_dhcp          = false,
  $debug_dns           = false,
){
  package { 'dnsmasq':
    ensure => present,
  }

  service { 'dnsmasq':
    ensure  => running,
    enable  => true,
    require => Package['dnsmasq'],
  }

  file { '/etc/dnsmasq.conf':
    ensure  => file,
    content => template('dnsmasq/dnsmasq.conf.erb'),
    notify  => Service['dnsmasq'],
  }

  file { ["${config_dir}/dhcp.conf", "/etc/dnsmasq.${internal_domain}.zone"]:
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
}
