require 'spec_helper'
describe 'resolv_conf' do

  #
  # RedHat
  #
  context "RedHat" do
    let :facts do
      {
        :os => {
          "family"      => "RedHat",
        }
      }
    end
    context "catalog compiles" do
      it { should compile}
    end

    context 'with default values for all parameters' do
      it { should contain_class('resolv_conf') }
    end

    context 'correct permissions' do
      it { should contain_file('/etc/resolv.conf').with(
        {
          :owner => "root",
          :group => "0",
          :mode  => "0644",
        }
      )}
    end

  end

  #
  # AIX
  #
  context "AIX" do
    let :facts do
      {
        :os => {
          "family"      => "AIX",
        }
      }
    end
    context "catalog compiles" do
      it { should compile}
    end

    context 'with default values for all parameters' do
      it { should contain_class('resolv_conf') }
    end

    context 'correct permissions' do
      it { should contain_file('/etc/resolv.conf').with(
        {
          :owner => "root",
          :group => "0",
          :mode  => "0644",
        }
      )}
    end
  end

  #
  # Solaris
  #
  context "Solaris" do
    let :facts do
      {
        :operatingsystem => "SunOS",
        :os => {
          "family"      => "Solaris",
        }
      }
    end
    context "catalog compiles" do
      it { should compile}
    end

    context 'with default values for all parameters' do
      it { should contain_class('resolv_conf') }
    end

    context 'correct permissions' do
      it { should contain_file('/etc/resolv.conf').with(
        {
          :owner => "root",
          :group => "0",
          :mode  => "0644",
        }
      )}
    end

  end
  #
  # FreeBSD
  #
  context "FreeBSD" do
    let :facts do
      {
        :operatingsystem => "FreeBSD",
        :os => {
          "family"      => "FreeBSD",
        }
      }
    end
    context "catalog compiles" do
      it { should compile}
    end

    context 'with default values for all parameters' do
      it { should contain_class('resolv_conf') }
    end

    context 'correct permissions' do
      it { should contain_file('/etc/resolv.conf').with(
        {
          :owner => "root",
          :group => "0",
          :mode  => "0644",
        }
      )}
    end

  end

  #
  # Suse
  #
  context "Suse" do
    let :facts do
      {
        :operatingsystem => "Suse",
        :os => {
          "family"      => "Suse",
        }
      }
    end
    context "catalog compiles" do
      it { should compile}
    end

    context 'with default values for all parameters' do
      it { should contain_class('resolv_conf') }
    end

    context 'correct permissions' do
      it { should contain_file('/etc/resolv.conf').with(
        {
          :owner => "root",
          :group => "0",
          :mode  => "0644",
        }
      )}
    end

  end

end
