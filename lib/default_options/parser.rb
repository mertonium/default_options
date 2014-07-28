module DefaultOptions
  class Parser
    def initialize(orides, &block)
      @defaults = {}
      overrides(orides)
      instance_eval(&block)
    end

    def overrides(orides)
      @overrides = orides
    end

    def method_missing(method_name, *args)
      if args.size > 0
        @defaults[method_name] = args.first
      else
        if @overrides.has_key? method_name
          @overrides[method_name]
        else
          @defaults[method_name]
        end
      end
    end
  end


end
