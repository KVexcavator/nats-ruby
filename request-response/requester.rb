# requester.rb
require 'nats/client'
require 'json'

ids_to_request = [1, 2, 3, 4, 5]

EM.run do
  NATS.start(servers: ['nats://localhost:4222']) do |nc|
    ids_to_request.each do |id|
      nc.request('user.body', id.to_s) do |response|
        parsed_response = JSON.parse(response)
        puts parsed_response
      end
    end
  end
end
