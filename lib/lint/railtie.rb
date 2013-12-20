module Lint
  require 'rails'

  class Railtie < Rails::Railtie
    rake_tasks { load 'tasks/lint_tasks.rake' }
  end

end
