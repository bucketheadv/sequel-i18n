class Sequel::Model
  plugin :after_initialize
  def after_initialize 
    p "hello world"
  end
end
