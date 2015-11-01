require "sequel/i18n/version"
require "sequel/i18n/errors"
require "sequel/i18n/model"
require "sequel/i18n/validation"

module Sequel
  module I18n
    # Your code goes here...
  end
end

if defined?(Rails)
  require "sequel/i18n/railtie"
end

if defined?(Padrino)
  require "sequel/i18n/padrino"
end
