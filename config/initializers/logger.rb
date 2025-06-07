require 'logger'
require 'active_support/logger'

# ロガーの設定を上書き
module ActiveSupport
  module LoggerThreadSafeLevel
    def local_level
      @local_level
    end

    def local_level=(level)
      @local_level = level
    end
  end
end

# ロガーの設定
if ENV["RAILS_LOG_TO_STDOUT"].present?
  logger = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = proc do |severity, datetime, progname, msg|
    "#{datetime}: #{severity} #{msg}\n"
  end
  Rails.logger = logger
end 