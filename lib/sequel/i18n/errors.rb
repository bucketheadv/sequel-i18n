class Sequel::Model::Errors
  attr_accessor :model_name
  def full_messages
    inject([]) do |m, kv|
      att, errors = *kv
      attr_name = model_name.to_s.downcase
      att.is_a?(Array) ? Array(att).map! { |v| I18n.t("#{attr_name}.attributes.#{v}")} : att = I18n.t("#{attr_name}.attributes.#{att}")
      errors.each {|e| m << (e.is_a?(::Sequel::LiteralString) ? e : "#{Array(att).join(ATTRIBUTE_JOINER)} #{e}")}
      m
    end
  end
end
