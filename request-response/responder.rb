# responder.rb
require 'nats/client'
require 'json'

data = {
  1 => { id: 1, name: 'Pol', email: 'pol@email.local' },
  2 => { id: 2, name: 'Ivan', email: 'ivan@email.local' },
  3 => { id: 3, name: 'Grigory', email: 'grigory@email.local' },
  4 => { id: 4, name: 'Arman', email: 'arman@email.local' },
  5 => { id: 5, name: 'Vasya', email: 'vasya@email.local' }
}

EM.run do
  NATS.start(servers: ['nats://localhost:4222']) do |nc|
    nc.subscribe('user.body') do |msg, reply|
      id = msg.to_i
      response = data[id] || { error: 'ID not found' }
      nc.publish(reply, response.to_json)
    end
  end
end
