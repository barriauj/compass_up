require 'net/sftp'
require 'gpgme'
require 'veil'

namespace :feeds do
  
  desc "Update feeds."
  task :update => [:download, :decrypt, :delete_pgp]
  
  desc "Download latest files from SFTP server."
  task :download do
    
    host = ENV["SFTP_HOST"]
    username = ENV["SFTP_USERNAME"]
    password = ENV["SFTP_PASSWORD"]
    
    2.times { puts }
    puts "Downloading feeds from #{host} "
    puts "                    to #{Rails.root}/downloads"
    puts
    
    Net::SFTP.start(host, username, password: password) do |sftp|
      sftp.dir.[]("/", "*.pgp").group_by { |e| e.name.gsub(/\d/, "") }.each do |group, entries|
        file = entries.sort_by! { |e| e.attributes.mtime }.last.name
        puts "    Downloading #{file}"
        sftp.download!("/#{file}", "#{Rails.root}/downloads/#{file}")
      end
    end
  end
  
  task :decrypt do
    2.times { puts }
    puts "Decrypting . . ."
    veil = Veil.new(:gpg_home => ENV["GPG_HOME"])
    Dir.glob("#{Rails.root}/downloads/*.pgp") do |file|
      puts file
      output_file = file.slice(0,file.rindex('.'))
      output_file = output_file.slice(0,output_file.rindex('.'))
      veil.decrypt(:from_file => file, :to_file => output_file, :passphrase => ENV["GPG_PASSPHRASE"])
    end
  end
  
  task :delete_pgp do
    Dir.glob("#{Rails.root}/downloads/*.pgp") do |file|
      File.delete(file)
    end
  end
  
end