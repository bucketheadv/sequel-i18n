class Sequel::Model::Errors
  attr_accessor :model_name
  def full_messages
    inject([]) do |m, kv|
      att, errors = *kv
      att.is_a?(Array) ? Array(att).map! { |v| I18n.t("attributes.#{v}")} : att = I18n.t("attributes.#{att}")
      errors.each {|e| m << (e.is_a?(::Sequel::LiteralString) ? e : "#{Array(att).join(ATTRIBUTE_JOINER)} #{e}")}
      m
    end
  end
end
