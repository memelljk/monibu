namespace :gems do
  namespace :necessary do
    desc 'install necessary gems'
    task :install do
      require 'bundler/cli'
      require 'bundler/cli/add'
      GEMS = ['annotate', 'pry']
      Bundler::CLI::Add.new({}, GEMS).run
    end
  end
end
