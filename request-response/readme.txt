https://github.com/nats-io/nats.rb
https://github.com/nats-io/nats-pure.rb

bundle
chmod +x run_docker_nats.sh
./run_docker_nats.sh

ruby responder.rb
ruby requester.rb
