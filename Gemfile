source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt"
gem "bootstrap"
gem "carrierwave", "1.2.2"
gem "coffee-rails", "4.2.2"
gem "config"
gem "devise"
gem "faker", "1.7.3"
gem "figaro"
gem "kaminari"
gem "jbuilder", "2.7.0"
gem "jquery-rails", "4.3.1"
gem "kaminari"
gem "puma", "3.9.1"
gem "rails", "5.1.4"
gem "ransack"
gem "ratyrate"
gem "sass-rails", "5.0.6"
gem "sidekiq"
gem "turbolinks", "5.0.1"
gem "uglifier", "3.2.0"
gem "omniauth"
gem "omniauth-facebook", "4.0.0"
gem "social-share-button", github: "huacnlee/social-share-button"

group :development, :test do
  gem "byebug", "9.0.6", platform: :mri
  gem "sqlite3", "1.3.13"
end

group :development do
  gem "listen", "3.1.5"
  gem "spring", "2.0.2"
  gem "spring-watcher-listen", "2.0.1"
  gem "web-console", "3.5.1"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
