ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

# ロガーの設定を追加
require 'logger'
require 'active_support/logger'

# ロガーの設定を上書き
ActiveSupport::Logger.send(:include, ActiveSupport::LoggerThreadSafeLevel)
