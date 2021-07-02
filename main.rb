#!/usr/bin/env ruby

require 'rubygems'
require 'mqtt'


MQTT::Client.connect('mqtt://localhost', 1883) do |client|

   client.subscribe('chat/public')

   Thread.new do
     client.get do |topic,message|
       puts message
     end
   end

   #client.publish 'chat/public', "#{nick} is in the house!"

   print "Type your nick: "
   nick = gets.chomp

   loop do
     message = gets
     client.publish 'chat/public', "#{nick}: #{message}"
   end

  rescue Interrupt
    puts "exiting...\n"
end
