require 'socket'

def run()
  
  @socket = TCPSocket.new('localhost',4040)
  
  puts "Client is connected from #{@socket.addr[2]} to #{@socket.peeraddr[2]} at #{Time.now}"
  
  #@commands = ARGF.argv
  while true do
=begin 
    @commands = ["hi","bye"]
    
    @commands.each do |command|
      
      puts "#{command} sent to Server"
      @socket.write command
      
      until @socket.eof? do
        puts "Waiting for server to respond "
        @answer = @socket.gets.strip
        puts "Server : #{@answer}"
      end
    end
=end

    while(gets())
      @socket.write($_)
      puts(@socket.gets)
    end
    
    puts "Client #{socket} is closed at #{Time.now}"
    @socket.close
  end
end

if __FILE__ == $0
  run
end

 