class Sequel::Model
  plugin :after_initialize
  def after_initialize 
    self.errors.model_name = self.class.name
  end
end
