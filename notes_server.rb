require 'socket'
require_relative './notes.rb'

notes = []

server = TCPServer.new(9393)

socket = server.accept

while true do

  socket.puts "What do you want to do?"

  choice = socket.gets.chomp

  case choice
  when 'add'
    socket.puts "What do you want to add?"
    note = socket.gets.chomp
    notes << Notes.new(note)
    socket.puts "Sucessfully added new note!"
  when 'show'
    notes.each do |c|
      socket.puts c.body
    end
  when 'q'
    break
  else
    socket.puts "try again!"
  end

end

socket.close
