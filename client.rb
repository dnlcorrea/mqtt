require 'rubygems'
require 'mqtt'

# Publish example
client = MQTT::Client.connect('mqtt://localhost', 1883)

puts "Nick: "

nick = readline()

loop do
  message = readline()
  client.publish("chat", "[#{nick}] #{message}")
end
