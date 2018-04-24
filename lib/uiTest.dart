import 'package:flutter/material.dart';

void main() => runApp(new uiTest());

//相当于main 函数
class uiTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //创建图标
    Column buildButtonColumn(IconData icon,String label){
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,

        children:[
          new Icon(icon,color: color),
          new Container(
            margin: new EdgeInsets.only(top: 8.0),

            child: new Text(label,style: new TextStyle(
                fontSize: 20.0,//字体大小
                fontWeight: FontWeight.w400,//
                color: color,
            ),),

          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    return new MaterialApp(
      
      title: 'ui demo',
      theme: new ThemeData(primaryColor: Colors.blue),
      home:  buttonSection,
    );



  }


}