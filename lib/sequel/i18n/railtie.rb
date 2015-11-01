module Sequel
  module I18n 
    class Railtie < ::Rails::Railtie 
      initializer 'sequel-i18n' do |_app|
        ::Sequel::I18n::Validation.load
        ::I18n.load_path += Dir[File.expand_path("./config/locales/**/*.yml", Rails.root)]
      end
    end
  end
end
