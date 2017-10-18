module Immutabler
  module DSL
    class Model
      attr_accessor :name, :base, :base_immutable, :gen_equatable, :builder_base, :props

      def initialize(name, base, base_immutable, gen_equatable, builder_base, props)
        @name = name
        @base = base
        @base_immutable = base_immutable
        @gen_equatable = gen_equatable 
        @builder_base = builder_base
        @props = props
      end
    end
  end
end
