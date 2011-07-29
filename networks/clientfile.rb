require 'socket'

def run()
  
  client = TCPSocket.new('localhost',2000)
  
  puts "Client is connected from #{client.addr[2]} to #{client.peeraddr[2]} at #{Time.now}"

  
    client.puts("hello")
    line = client.gets.chop
    puts line
    client.close
end

if __FILE__ == $0
  begin
    run
  rescue IOError
    puts "IOError!"
  end
end

 