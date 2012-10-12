namespace :db do
  desc "Backup the database"
  task :backup, :roles => :db do
    run "mkdir -p #{current_path}/backups"
    run "cd #{current_path}; pg_dump -U #{user} #{application}_production -f backups/#{Time.now.utc.strftime('%Y%m%d%H%M%S')}.sql"
  end

  desc "Backup the database and download the script"
  task :download, :roles => :app do
    db
    timestamp = Time.now.utc.strftime('%Y%m%d%H%M%S') 
    run "mkdir -p backups"
    run "cd #{current_path}; tar -cvzpf #{timestamp}_backup.tar.gz backups"
    get "#{current_path}/#{timestamp}_backup.tar.gz", "#{timestamp}_backup.tar.gz"
  end

  desc "Dumps target database into development db"
  task :sync do
    db = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '../database.yml'))).result)
    production = db['production']

    file  = "#{application}.sql.bz2"
    remote_file = "#{shared_path}/log/#{file}"
    run "pg_dump --clean --no-owner --no-privileges -U#{production['username']} -h#{production['host']} #{production['database']} | bzip2 > #{file}" do |ch, stream, out|
      ch.send_data "#{production['password']}\n" if out =~ /^Password:/
      puts out
    end
    puts rsync = "rsync #{user}@masqueunacasa.net:#{file} tmp"
    `#{rsync}`
    development = db['development']
    puts depackage = "bzcat tmp/#{file} | psql -U#{development['username']} #{development['database']}"
    `#{depackage}`
  end
end

