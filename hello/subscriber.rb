require 'nats/client'

EM.run do
  NATS.start(servers: ['nats://localhost:4222']) do |nc|
    nc.subscribe('test') do |msg|
      puts "Received message: #{msg}"
      NATS.stop
    end
  end
end
