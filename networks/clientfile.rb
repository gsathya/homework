require 'socket'

def run()
  
  client = TCPSocket.new('localhost',2000)
  
  puts "Client is connected from #{client.addr[2]} to #{client.peeraddr[2]} at #{Time.now}"
  
  line = client.gets.strip
  puts "Server : "+line
  
  while true 
    print "Client : "
    line = $stdin.gets.strip
    client.puts(line)
    
    if line == "quit"
      break
    end
    
    line = client.gets.strip
    puts "Server : "+line
  end
  
  client.close
  
end

if __FILE__ == $0
  begin
    run
  rescue IOError
    puts "IOError!"
  end
end

 