class Sequel::Model
  plugin :after_initialize
  after_initialize {
    p "hello world"
  }
end
