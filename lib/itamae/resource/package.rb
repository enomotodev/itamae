require 'itamae'

module Itamae
  module Resource
    class Package < Base
      define_attribute :action, default: :install
      define_attribute :name, type: String, default_name: true
      define_attribute :version, type: String

      def install_action
        unless run_specinfra(:check_package_is_installed, name, version)
          run_specinfra(:install_package, name, version)
          updated!
        end
      end
    end
  end
end

