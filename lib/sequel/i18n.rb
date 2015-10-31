require "sequel/i18n/version"
require "sequel/i18n/errors"
require "sequel/i18n/model"
require "sequel/i18n/validation"

module Sequel
  module I18n
    # Your code goes here...
  end
end

if defined?(Padrino)
  Padrino.after_load do 
    Sequel::I18n::Validation.load
  end
end
