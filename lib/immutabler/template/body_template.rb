require_relative 'template'

module Immutabler
  module Template
    class BodyTemplate < BaseTemplate
      attr_accessor :name, :models

      def initialize(name, models)
        self.template_file = File.expand_path("#{__dir__}/../../../templates/body_template.hbs")
        self.name = name
        self.models = models

        helper(:dict) do |context, arg, block|
          body = "@{\n"

          if arg
            body << arg.map{|m|
              "@\"#{m.destination_name}\" : @\"#{m.origin_name}\""
            }.join(",\n")
          end

          body << "\n};"
        end

        helper(:enum_mapping_dict) do |context, arg, block|
          body = "@{\n"

          if arg
            body << arg.map{|m|
              "@\"#{m.origin_name}\" : @(#{m.destination_name})"
            }.join(",\n")
          end

          body << "\n};"
        end

      end

      def render
        template.call(models: models, name: name)
      end
    end
  end
end