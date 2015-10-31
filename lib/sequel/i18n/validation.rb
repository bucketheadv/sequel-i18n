require "sequel/plugins/validation_helpers"
class Sequel::I18n::Validation 
  class << self 
    def load 
      [:format, :integer, :length_range,:not_null, :numeric, :presence, :unique].each do |type|
        begin
          message = ::I18n.t!("errors.#{type.to_s}")
          validate_no_params(type, message)
        rescue StandardError => _
        end
      end
      [:exact_length, :max_length, :min_length, :type, :includes].each do |type|
          begin
            ::I18n.t!("errors.#{type.to_s}") # To ensure the exception before return
            validate_has_block(type) do |arg|
              ::I18n.t!("errors.#{type.to_s}", arg: arg)
            end
          rescue StandardError => _
          end
      end
      validate_has_block(:schema_types) do |arg|
        begin
          ::I18n.t!("errors.schema_types", schema_type: arg)
        rescue StandardError => _
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
