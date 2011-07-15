require 'socket'

def run()
  
  server = TCPServer.new('localhost',4040)

  puts "Server running on #{server.addr.join(':')}"
  while true
    Thread.start(server.accept) do |sock|
      puts "#{sock} connected at #{Time.now}"
      
      until sock.eof? do 
        @msg = sock.gets.strip
        #sock.write(@msg)
        puts "User entered : #{@msg}"
        
        if @msg.match /hi|hello|hey/i
          sock.write 'Hello!'
        end
        
        if @msg.match /bye|ciao/i
          sock.write 'Bye!' 
        end
        
        if @msg.match /my name is (.*)/i 
          @name = @msg.match(/my name is (.*)/i).captures
          sock.write "Hello #{@name} !"
        end
        
        if @msg.match /help/i 
          sock.write "Commands are -\nHello\nBye\nMy name is foo\nQuit\nKill Server\n"
        end
        
        if @msg.match /quit/i 
          puts "User quit"
          sock.close
        end
        
        if @msg.match(/kill server/i)
          puts "Killing server"
          puts "Process id is #{Process.pid}"
          puts "Process group id is #{Process.getpgid(Process.ppid())}"
          echo `kill -9 #{Process.pid}`
        end
      end
      
      puts "#{sock} closed at #{Time.now}" 
      sock.close
    end
  end
end


if __FILE__ == $0
  run
end

        
         