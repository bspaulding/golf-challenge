namespace :travis do
  task :create_database_config do
    File.open(File.join(Rails.root, 'config', 'database.yml'), 'w+') do |file|
      file.write(<<TEXT)
test:
  adapter: sqlite3
  database: ":memory:"
  timeout: 500
TEXT
    end
  end
end
