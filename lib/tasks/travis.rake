namespace :travis do
  task :default => ['travis:before_script', :test]

  task :before_script => ['travis:create_database_config', 'db:create', 'db:migrate', 'db:seed']

  task :create_database_config do
    File.open(File.join(Rails.root, 'config', 'database.yml'), 'w+') do |file|
      file.write(<<TEXT)
development:
  adapter: sqlite3
  database: ":memory:"
  timeout: 500

test:
  adapter: sqlite3
  database: ":memory:"
  timeout: 500
TEXT
    end
  end
end

task :travis => ['travis:default']
