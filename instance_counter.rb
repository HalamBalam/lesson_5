module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    
    def instances
      @instances
    end

    def instances=(value)
      @instances = value
    end

  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances = 0 if self.class.instances.nil?
      self.class.instances += 1
    end 
  end

end