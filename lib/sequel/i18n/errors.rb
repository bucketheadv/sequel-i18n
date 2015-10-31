class Sequel::Model::Errors
  attr_accessor :model_name
  def full_messages
    inject([]) do |m, kv|
      att, errors = *kv
      attr_name = model_name.to_s.downcase
      att.is_a?(Array) ? Array(att).map! { |v| i18n(attr_name, v) } : att = i18n(attr_name,att)
      errors.each {|e| m << (e.is_a?(::Sequel::LiteralString) ? e : "#{Array(att).join(ATTRIBUTE_JOINER)} #{e}")}
      m
    end
  end

  private
  def i18n(m_name, m_v)
    begin
      I18n.t!("#{m_name}.attributes.#{m_v}")
    rescue
      m_v
    end
  end
end
