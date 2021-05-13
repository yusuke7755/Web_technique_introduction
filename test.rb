require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
#server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'web_test.html.erb')
#server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
# この一行を追記
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')

# 課題の追加機能
server.mount('/goya_kadai1.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_kadai1.rb')
server.mount('/goya_kadai2.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_kadai2.rb')

server.start
