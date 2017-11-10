# Puppet module: dnsmasq

[![Build Status](https://travis-ci.org/therek/puppet-dnsmasq.svg?branch=master)](https://travis-ci.org/therek/puppet-dnsmasq)

A simple Puppet module for configuring DNSMasq, a DNS caching and DHCP service.

    class { 'dnsmasq':
      dhcp_range      => '192.168.0.101,192.168.0.199',
      dhcp_route      => '192.168.0.254',
      internal_domain => 'example.local',
      upstream        => '8.8.8.8',
    }
