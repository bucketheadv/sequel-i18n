require "sequel/i18n/version"
require "sequel/i18n/errors"
require "sequel/i18n/model"
require "sequel/i18n/validation"

module Sequel
  module I18n
    # Your code goes here...
  end
end

require "sequel/i18n/railtie" if defined?(Rails)
Sequel::I18n::Validation.load if defined?(Padrino)
