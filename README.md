## Описание

Аналог сайта olx  
Пользователи могут создавать объявления с картинками,
просматривать, редактировать, оставлять комментарии и т.п.

## Запуск  
Для разворачивания своей копии выполните команды:  
`git clone git@github.com:exwarvlad/test-analog-olx.git`  
`bundle install --without production`  
`bundle exec rake db:migrate`  
`rails s`

Для production среды желательно указать ключи в среде переменных с Amazon S3:  
`S3_ACCESS_KEY`  
`S3_SECRET_KEY`  
`S3_BUCKET_NAME` 
 
## Требуемые библиотеки

```ruby
gem 'rails', '~> 4.2.6'

gem 'devise'
gem 'devise-i18n'
gem 'russian'

gem 'twitter-bootstrap-rails'

gem 'jquery-rails'

gem 'carrierwave'

gem 'rmagick'

gem 'fog-aws'

group :production do
  gem 'pg'
  gem 'uglifier', '>= 1.3.0'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
end
```