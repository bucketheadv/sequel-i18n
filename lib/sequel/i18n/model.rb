class Sequel::Model
  plugin :instance_hooks
  
  initialize_hook {
    p "Hello world!"
  }
end
