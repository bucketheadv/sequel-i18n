Padrino.after_load do 
  ::Sequel::I18n::Validation.load
end
