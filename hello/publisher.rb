require 'nats/client'

EM.run do
  NATS.start(servers: ['nats://localhost:4222']) do |nc|
    nc.publish('test', 'Hello, NATS!') do
      puts 'Message published!'
      NATS.stop
    end
  end
end
