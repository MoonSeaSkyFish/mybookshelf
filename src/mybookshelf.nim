# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import mybookshelfpkg/submodule
import jester
import strutils
import uri

#when isMainModule:
#echo(getWelcomeMessage())
var Cnt = 0
echo "FOOO"

echo(myTest())
var ss = encodeUrl("http://192.168.0.100:5555/box/100/isbn/EAN")
var txt: string = "<a href=\"pic2shop://scan?callback=" & ss & "\">hererer</a>"

echo txt

# 登録(isbn, noisbn)、一覧、棚番登録、削除、変更
router main_router:
  get "/":
    echo "aaddabbb"
    resp(txt)
  get "/ean/":
    echo "xxx"
    inc(Cnt)
    resp("hello <>" & $Cnt)
  get "/list/@name":
    resp("list {name}")
  get "/box/@box/isbn/@isbn":
    echo "box:", @"box", ":isbn:", @"isbn"
    resp(txt)
  get "/bookid/@bookid":
    resp("")
  get "/shrlfid/@shelfid":
    resp("")
  get "/remove/@isbn/@foo":
    var aa = @"isbn"
    var bb = @"foo"
    var x = aa & "=" & bb
    resp(x)
  get "/400":
    echo("aabb")
var
  port = Port(5555)
  setting = newSettings(port = port)
  server = initJester(main_router, setting)

server.serve()

## pic2shop://scan?callback='+encodeURIComponent(location.origin+location.pathname+'?r=EAN')
