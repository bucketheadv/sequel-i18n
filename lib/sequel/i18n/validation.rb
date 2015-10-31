require "sequel/plugins/validation_helpers"
class Sequel::I18n::Validation 
  class << self 
    def load 
      validation_options = ::Sequel::Plugins::ValidationHelpers::DEFAULT_OPTIONS.dup
      [:integer, :not_null, :numeric, :presence, :unique].each do |type|
        validate_block(type) do 
          begin
            I18n.t!("errors.#{type.to_s}")
          rescue StandardError => _
            validation_options[type][:message].call
          end
        end
      end
      [:format, :length_range, :exact_length, :max_length, :min_length, :type, :includes].each do |type|
        validate_block(type) do |arg|
          begin
            ::I18n.t!("errors.#{type.to_s}", arg: arg) 
          rescue StandardError => _
            validation_options[type][:message].call(arg)
          end
        end
      end
      validate_block(:schema_types) do |arg|
        begin
          ::I18n.t!("errors.schema_types", schema_type: arg)
        rescue StandardError => _
          validation_options[type][:schema_types].call(arg)
        end
      end
    end

    def validate_block(field, &block)
      ::Sequel::Plugins::ValidationHelpers::DEFAULT_OPTIONS.merge!(
        field => {message: block}
      )
    end
  end
end
