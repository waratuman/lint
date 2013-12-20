require 'execjs'
require 'multi_json'

module Lint
end

require 'lint/linter'
require 'lint/railtie' if defined?(Rails)
