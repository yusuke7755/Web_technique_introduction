# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new
# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"goya"のデータを cgi['goya_kadai2']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['goya_kadai2']
  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>品質が悪いもの（false）のgoyaの情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}