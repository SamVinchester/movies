class DSLHash

  def self.build &block
    if block_given?
      # Создаем инстанс контекста
      context = DSLHashContext.new
      # Запускаем в нем наш хеш
      context.instance_eval &block
      # Возвращаем внутренний хеш
      return context.inner_hash
    else
      raise "No block given"
    end
  end

  class DSLHashContext
    # Геттер для inner_hash
    attr_reader :inner_hash
    
    def initialize
      # Объявляем пустой хеш
      @inner_hash = {}
    end
    
    def method_missing name, *args, &block
      if block_given?
        context = DSLHashContext.new
        context.instance_eval &block
        result = context.inner_hash
      else
        if args.size == 0
          raise "No block or args given"
        elsif args.size == 1
          result = args[0]
        else
          result = args
        end
      end
      @inner_hash[name] = result
    end
  end
end

h = DSLHash.build do
  first_name "Andrey"
  last_name "Viktorov"
  
  social do
    vk "andvandv"
    github "4ndv"
    medium "@andv"
  end
  
  tags "Krasnoyarsk", "Ruby", "Hello, world"
end

puts h