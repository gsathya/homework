require 'socket'

def run()
  
  server = TCPServer.new('localhost',2000)

  puts "Server running on #{server.addr.join(':')}"
  while true
    Thread.start(server.accept) do |sock|
      puts "#{sock} connected at #{Time.now}"
      
      until sock.eof? do 
        @msg = sock.gets.strip
        puts "User entered : #{@msg}"
        
        if @msg.match /hi|hello|hey/i
          sock.puts 'Hello!'
        end
        
        if @msg.match /bye|ciao/i
          sock.puts 'Bye!' 
        end
        
        if @msg.match /my name is (.*)/i 
          @name = @msg.match(/my name is (.*)/i).captures
          sock.puts "Hello #{@name} !"
        end
        
        if @msg.match /help/i 
          sock.puts "Commands are -\nHello\nBye\nMy name is foo\nQuit\nKill Server\n"
        end
        
        if @msg.match /quit/i 
          puts "User quit"
          server.close 
        end
      end
      
      puts "#{sock} closed at #{Time.now}" 
      sock.close
      
    end
  end 
end


if __FILE__ == $0
  
  begin
    run
  rescue IOError
    puts "Server Closed!"
  end
end

        
         