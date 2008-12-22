require 'open-uri'

namespace :thin do
  def thin(command)
    system "sudo thin -s 2 -C config.yml -R config.ru #{command}"
  end

  desc 'Start Thin'
  task(:start => :sassify) { thin :start }

  desc 'Stop Thin'
  task(:stop) { thin :stop }

  desc 'Restart Thin'
  task :restart => [:stop, :start]
end

directory 'data'

desc 'Download an online yml of the zoo'
task(:getzoo => :data) do
  yml = open('http://edit.sunfox.org/zoorouxgami.yml/txt').read
  open('data/zoo.yml', 'w') { |f| f << yml }
end

desc 'Turn the sass stylesheets into css'
task :sassify do
  system "sass views/stylesheet.sass > public/stylesheet.css"
end


