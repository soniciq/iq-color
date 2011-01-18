$:.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'lib'))

require 'test/unit'
require 'rubygems'
begin
  require 'redgreen'
rescue LoadError
end
require 'mocha'
require 'shoulda'

require 'iq/color'

class Class
  def publicize_private_methods
    saved_private_instance_methods = self.private_instance_methods
    self.class_eval { public *saved_private_instance_methods }
    yield self
    self.class_eval { private *saved_private_instance_methods }
  end
  
  def publicize_protected_methods
    saved_protected_instance_methods = self.protected_instance_methods
    self.class_eval { public *saved_protected_instance_methods }
    yield self
    self.class_eval { protected *saved_protected_instance_methods }
  end
end