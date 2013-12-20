module Lint
  module Linter
    extend self

    def context
      @context ||= ExecJS.compile(File.read(File.join(File.dirname(__FILE__), 'assets', 'javascripts', 'jslint.js')))
    end

    def config
      {
        regexp: true,
        nomen: true,
        vars: true,
        sloppy: true,
        browser: true,
        plusplus: true,
        devel: true,
        undef: true,
        todo: true,
        badnew: true,
        bitwise: true,
        stupid: true,
        predef: ['Viking', '_', 'Backbone', '$', 'jQuery']
      }
    end

    def lint(file)
      raise 'No JavaScript engine available.' if !ExecJS.runtime
      context.exec(<<-JS)
        JSLINT(#{File.read(file).inspect}, #{MultiJson.dump(config)});
        return JSLINT.errors;
      JS
    end

    def colorize(string, color)
      result = '\x1b['
      result += case color
      when 'bold' then '1'
      when 'red' then '31'
      when 'green' then '32'
      when 'yellow' then '33'
      when 'blue' then '34'
      when 'magenta' then '35'
      when 'cyan' then '36'
      when 'white' then '37'
      when 'grey' then '90'
      when 'gray' then '90'
      end
      result += 'm'

      result + string + '\x1b[0m'
    end

  end
end

