require 'lint/linter'

namespace :assets do

  desc 'Run JSLint'
  task :lint do
     Rails.configuration.assets
     files = Rails.configuration.assets.map { |dir| Dir.glob(File.join(dir, '**', '*.js')) }

    files.each do |file|
      print '%-75s ' % file[Rails.root.to_s.length..-1]
      errors = Linter.lint(file)

      if errors.empty?
        puts Linter.colorize('PASS', 'green')
      else
        puts Linter.colorize('FAIL', 'red')

        errors.each_with_index do |error, i|
          next unless error
          puts "    ##{i} #{Linter.colorize(error['reason'], 'yellow')}"
          if error['evidence']
            print "    #{' ' * "##{i} ".length}"
            print error['evidence'].strip
            print ' ' + Linter.colorize("\\\\ Line #{error['line']}, #{error['character']}", 'gray') + "\n\n"
          end
        end
      end

      fail('Error linting JavaScript files.') if !errors.empty?
    end
  end

end
