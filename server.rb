require 'socket'

server = TCPServer.new(9393)

socket = server.accept

while true do

  socket.puts "What do you say?"

  they_said = socket.gets.chomp

  break if they_said == 'q'

  socket.puts "You said: #{they_said}. Goodbye!"

end

socket.close
