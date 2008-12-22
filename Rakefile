ZOO_YML = 'http://edit.sunfox.org/zoorouxgami.yml/txt'
THIN = 'sudo thin -s 2 -C config.yml -R config.ru'


task(:start => :getzoo) do
  system "#{THIN} start"
end

task :stop do
  system "#{THIN} stop"
end

task :restart => [:stop, :start]

task :getzoo do
  system "curl #{ZOO_YML} > data/zoo.yml"
end

