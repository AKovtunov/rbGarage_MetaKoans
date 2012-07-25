
class Module
  def attribute(attr)
    #settin @a variable
    instance_variable_set("@#{attr}", nil)
    #creating methods for it
    define_method "#{attr}=".to_sym do |args|
      instance_variable_set("@#{attr}", args)
    end
    #creating methods for it
    define_method "#{attr}?".to_sym do
      if instance_variable_defined? "@#{attr}"
        true else false
      end
    end

    define_method "#{attr}".to_sym do
      #@a <- It's working!
      eval("@#{attr}")    #<-Bad method, but it's working too!
      #"@#{attr}" #<- String, so it doesnt work. If we will use .to_f, when its bad and doesnt work, cause str to fixn = 0
    end
  end
end
=begin for testing
c = Class::new {
  attribute 'a'
}

o = c::new


puts o.a = 42
puts 42.class
puts o.a == 42
puts o.a
puts "1" == 1
=end

