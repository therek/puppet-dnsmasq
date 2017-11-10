require 'facterdb'

shared_context 'unsupported archlinux' do
  context 'on archilinux-3-x86_64' do
  let(:facts) do
    FacterDB.get_facts({
      :operatingsystem        => 'Archlinux',
      :operatingsystemrelease => '3.17.1-1-ARCH',
      :architecture           => 'x86_64',
    }).first
  end
  it { is_expected.to raise_error(Puppet::Error, /Unsupported OS/) }
end
end
