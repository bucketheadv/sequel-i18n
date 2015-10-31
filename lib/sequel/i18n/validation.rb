require "sequel/plugins/validation_helpers"
class Sequel::I18n::Validation 
  class << self 
    def load 
      [:format, :integer, :length_range,:not_null, :numeric, :presence, :unique].each do |type|
        begin
          message = ::I18n.t!("sequel.errors.#{type.to_s}")
          validate_no_params(type, message)
        rescue StandardError => e
          p e
        end
      end
      [:exact_length, :max_length, :min_length, :type].each do |type|
        validate_has_block(type) do |arg|
          begin
            ::I18n.t!("sequel.errors.#{type.to_s}", arg: arg)
          rescue StandardError => e
            p e
          end
        end
      end
    end

    def validate_no_params(field, message)
      ::Sequel::Plugins::ValidationHelpers::DEFAULT_OPTIONS.merge!(
        field => {message: message}
      )
    end

    def validate_has_block(field, &block)
      ::Sequel::Plugins::ValidationHelpers::DEFAULT_OPTIONS.merge!(
        field => {message: block}
      )
    end
  end
end
