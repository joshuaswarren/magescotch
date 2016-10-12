module VagrantApp
  class Config < BasicObject
    @@options = ::Hash.new

    def self.option(option, default)
      @@options[option] = default
      class_eval do
        define_method option do |value = nil|
          access(option, value)
        end
      end
      self
    end

    def initialize
      @config = ::Hash.new
      @shell = []
    end

    def set(key, value)
       @config[key] = value
    end

    def get(key)
       unless @@options.key?(key)
         raise 'Undefined configuration option: ' + key
       end

       unless @config.key?(key)
          return @@options[key]
       end

       @config[key]
    end

    # Configuration flag check
    def flag?(key, inverse = false)
      result = true
      if key.instance_of?(::Array)
        for sub_key in key
          result &&= flag?(sub_key, inverse)
        end
      elsif !key.nil?
        result = (get(key) === true)

        if inverse
          result = !result
        end
      end

      result
    end

    def access(key, value = nil)
      unless value === nil
        set(key, value)
      end

      get(key)
    end

    def self.method_missing(method, value = nil)
      access(method, value)
    end

    def load(file)
      unless ::File::exists?(file)
        return false
      end

      instance_eval ::File.read(file), file
    end

    def shell_add(script, flags = nil, inverse = false)
      @shell << {file: script, flags: flags, inverse: inverse}
      self
    end

    def shell_list
      scripts = @shell.select do |info|
        flag?(info[:flags])
      end
      scripts.collect do |info|
        info[:file]
      end
    end
  end
end
