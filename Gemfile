source 'https://rubygems.org'

ruby '3.1.2'
gem 'rails', '~> 7.1.1'
gem 'puma', '>= 5.0'
gem 'tzinfo-data', platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem 'rack-cors'

group :development, :test do
  gem 'debug', platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
end

group :development do
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

#
# ↓↓↓↓↓↓↓意図的に入れているもの↓↓↓↓↓↓↓
#

#
# ddtrace
#
# Datadog Trace Client
#
# - ddtraceはDatadogのRuby用トレースクライアント
# - Webサーバ、DB、マイクロサービス間を流れる request を trace するために使用される
# - Developper はボトルネックや厄介な request を可視化可能
#
# Gem: https://rubygems.org/gems/ddtrace
# GitHub: https://github.com/DataDog/dd-trace-rb
#
# 導入方法
# https://docs.datadoghq.com/tracing/trace_collection/dd_libraries/ruby/#instrument-your-application
#
gem 'ddtrace', '1.15.0', require: 'ddtrace/auto_instrument'

#
# dogstatsd-ruby
#
# - Datadog用のメトリクスサーバ: DogStatsD用のRubyクライアント
#
# Gem: https://rubygems.org/gems/dogstatsd-ruby
# GitHub: https://github.com/DataDog/dogstatsd-ruby
#
gem 'dogstatsd-ruby', '5.6.1'

#
# lograge
#
# logを構造化する
#
# Gem: https://rubygems.org/gems/lograge
# GitHub: https://github.com/roidrage/lograge
#
gem 'lograge', '0.14.0'
