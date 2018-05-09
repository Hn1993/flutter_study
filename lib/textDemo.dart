import 'package:flutter/material.dart'; //1.引用dart
import 'package:flutter/gestures.dart'; //2.引用手势识别  点击事件之类的

void main() => runApp(new TextDemo());



class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: "TextDemo",
      theme: new ThemeData(
          primaryColor: Colors.blueGrey
      ),
      home: new DemoText(),

    );

  }
}


//3.新建 demoText 函数入口
class DemoText extends StatefulWidget {

  //4.约定几个字体样式
  final TextStyle _protocolFont = new TextStyle(fontSize: 16.0);
  final TextStyle _inheritBigFont = new TextStyle(inherit: true, fontSize: 24.0);
  final TextStyle _notInheritBigFont = new TextStyle(inherit: false, fontSize: 24.0);

  @override
  DemoTextState createState() {
    return new DemoTextState();
  }
}

//5.在DemoTextState 写主逻辑
class DemoTextState extends State<DemoText>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('textDemo'),
      ),
      body: new Builder(builder: builderBody),
    );
  }

  //6.新建builderBody方法
  Widget builderBody(BuildContext context) {
    //7.当协议被点击时  弹出snackBar
    final TapGestureRecognizer recognizer = new TapGestureRecognizer();
    recognizer.onTap = () {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('协议被点击!'),
      ));
    };

    //8.定义一根白色的线条
    final Divider divider = new Divider(color: Colors.white, height: 2.0);

    //9.body 里的子View
    return new Container(
      color: Colors.grey,//背景
      alignment: Alignment.center,//居中

      child: new Column(
        children: <Widget>[
          new Text('inherit true', style: widget._inheritBigFont),

          new Text('inherit false', style: widget._notInheritBigFont),

          divider,

          new Text(
            '龙骑士囧雪诺JohnSnow',
            style: new TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
                decoration: TextDecoration.underline),
          ),

          divider,

          new RichText(
            text: new TextSpan(
              text: '我已阅读',
              style: widget._protocolFont,
              children: <TextSpan>[
                new TextSpan(
                    text: '《从flutter入门到放弃》',
                    style: new TextStyle(color: Colors.redAccent),
                    recognizer: recognizer),
              ],
            ),
          )],
      ),//10.类似android 里的新建布局(Column,Row)分别代表竖向，横向

    );


  }


}


