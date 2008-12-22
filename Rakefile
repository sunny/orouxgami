task :start do
  system %(sudo thin -s 2 -C config.yml -R config.ru start)
end

task :stop do
  system %(sudo thin -s 2 -C config.yml -R config.ru stop)
end

task :restart => [:stop, :start]
