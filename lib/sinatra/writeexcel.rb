require 'sinatra/writeexcel/version'
require 'sinatra/base'

module Sinatra
  module WriteExcel
    module Helpers
      def writeexcel(template = nil, options = {}, locals = {}, &block)
        headers(
          'Content-Type' => 'application/vnd.ms-excel',
          'Content-Disposition' => "attachment; filename=#{options[:filename] || template}.xls"
        )
        options, template = template, nil if template.is_a?(Hash)
        template = -> { block } if template.nil?
        options[:layout] = false
        render :rxls, template, options, locals
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
      return if defined? ::Writeexcel::Workbook
      require_template_library 'writeexcel'
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      blob = StringIO.new('')
      workbook = WriteExcel.new(blob)

      if data.respond_to?(:to_str)
        locals[:workbook] = workbook
        super(scope, locals, &block)
      elsif data.is_a?(Proc)
        data.call(workbook)
      end
      workbook.close
      blob.string
    end

    def precompiled_template(_locals)
      data.to_str
    end
  end

  register 'rxls', WriteexcelTemplate
end
