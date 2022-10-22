namespace :qwerty do
  desc 'Calc checksum'
  task :checksum do
    require 'digest'

    md5 = Dir["./lib/monibu/qwerty/**/*.rb"].sort.inject("") do |acc, file|
      Digest::MD5.hexdigest(acc + File.read(file))
    end

    File.write('./lib/checksum/qwerty.md5', md5)
  end

  namespace :checksum do
    desc 'Test checksum'
    task :test do
      before = File.read('./lib/checksum/qwerty.md5')
      Rake::Task["qwerty:checksum"].invoke
      after = File.read('./lib/checksum/qwerty.md5')
      raise("#{before} is not #{after}") unless before == after
    end
  end
end
