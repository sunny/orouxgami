THIN = 'sudo thin -s 2 -C config.yml -R config.ru'

task :start do
  system "#{THIN} start"
end

task :stop do
  system "#{THIN} stop"
end

task :restart do
  system "#{THIN} restart"
end

