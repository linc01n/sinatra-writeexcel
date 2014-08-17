require 'sinatra/base'

module Sinatra
    module WriteExcel
        module Helpers
            def writeexcel(template = nil, options = {}, locals = {}, &block)
                options, template = template, nil if template.is_a?(Hash)
                template = lambda { block } if template.nil?
                options[:layout] = false
                render :writeexcel, template, options, locals
            end
        end

        def self.registered(app)
            app.helpers WriteExcel::Helpers
        end
    end

    register WriteExcel
end

module Tilt
    class WriteexcelTemplate < Template
        def initialize_engine
            return if defined? ::Spreadsheet::Workbook
            require_template_library 'writeexcel'
        end

        def prepare
        end

        def evaluate(scope, locals, &block)
            workbook = ::Spreadsheet::Workbook.new

            if data.respond_to?(:to_str)
                locals[:workbook] = workbook
                super(scope, locals, &block)
            elsif data.kind_of?(Proc)
                data.call(workbook)
            end

            workbook.write(str = StringIO.new('', 'r+'))
            str.string
        end

        def precompiled_template(locals)
            data.to_str
        end
    end

    register 'writeexcel', WriteexcelTemplate
end
