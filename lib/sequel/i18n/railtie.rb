module Sequel
  module I18n 
    class Railtie < ::Rails::Railtie 
      initializer 'sequel-i18n' do |_app|
        ::Sequel::I18n::Validation.load
      end
    end
  end
end
