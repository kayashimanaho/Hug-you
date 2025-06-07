require 'logger'

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

Rails.logger = Logger.new(STDOUT)
Rails.logger.formatter = proc do |severity, datetime, progname, msg|
  "#{datetime}: #{severity} #{msg}\n"
end 