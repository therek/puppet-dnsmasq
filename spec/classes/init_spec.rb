require 'spec_helper_puppet'
require 'shared_unsupported_os'

describe 'dnsmasq', :type => :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }
      let(:params) do
        {
          dhcp_range:      '192.168.0.101,192.168.0.199',
          dhcp_route:      '192.168.0.254',
          internal_domain: 'local',
          upstream:        '8.8.8.8',
        }
      end

      it { is_expected.to contain_class('dnsmasq')}
      it { is_expected.to contain_package('dnsmasq').with_ensure('present')}
      it { is_expected.to contain_service('dnsmasq').with(
        ensure:  'running',
        enable:  true,
        require: 'Package[dnsmasq]',
        )}
      it { is_expected.to contain_file('/etc/dnsmasq.conf').with(
        ensure:  'file',
        notify:  'Service[dnsmasq]',
        )}
      ['/etc/dnsmasq.d/dhcp.conf', '/etc/dnsmasq.local.zone'].each do |file|
        it { is_expected.to contain_file(file).with(
          ensure: 'file',
          mode:   '0644',
          owner:  'root',
          group:  'root',
        )}
      end
    end
  end
end
