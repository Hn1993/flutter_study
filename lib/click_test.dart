import 'package:flutter/material.dart';

void main() => runApp(new MyScaffold());//入口



class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return new MaterialApp(
      // ignore: undefined_named_parameter
      title: "Startup Name Generator",
      // ignore: undefined_named_parameter
      theme: new ThemeData(
          primaryColor: Colors.blueGrey
      ),
      home: new TutorialHome(),
    );
  }
}


class ClickTest extends StatefulWidget {
  @override
  createState() => new ClickTestState();
}

class ClickTestState extends State<ClickTest>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('ClickTest'),
      ),
      body:new Container(
        margin: const EdgeInsets.only(top: 100.0,left: 20.0),
        padding: const EdgeInsets.all( 8.0),
        decoration: new BoxDecoration(color: Colors.blue[500]),
        height: 100.0,
        width: 200.0,
        //color: Colors.red,


        child: new Row(
          children: <Widget>[
            new IconButton(
                icon:new Icon( Icons.add ),
                iconSize:50.0,
                onPressed: null),
            new Expanded(
              flex: 200,
              child: new Center(
                child: new Text('1111'),
              )

            ),

          ],

        ),
      )
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: new Center(
        child: new Text('Hello, world!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}