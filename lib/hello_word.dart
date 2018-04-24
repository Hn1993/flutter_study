import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new TestDemo());

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
    return new MaterialApp(

      title: "Startup Name Generator",
      theme: new ThemeData(
        primaryColor: Colors.blueGrey
      ),
      home: new RandomWords(),

    );

  }
}


class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

//class RandomWordsState extends State<RandomWords>{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    final wordPair=new WordPair.random();
//    return new Text(wordPair.asPascalCase);
//  }
//}

class RandomWordsState2 extends State<RandomWords>{
  final _suggestions = <WordPair>[];

  final _biggerFont=const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),

      itemBuilder: (context,i){
        if(i.isOdd){
          return new Divider();
        }

        final index = i ~/ 2;
        if(index>_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },

    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}


class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),

        actions: <Widget>[new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }

  //跳转到下一界面
  Widget _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );

        },
      ),
    );
  }

  //生成一个list
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        _suggestions.addAll(generateWordPairs().take(10));
        final index = i ~/ 2;
//        if (index >= _suggestions.length) {
//          _suggestions.addAll(generateWordPairs().take(10));
//        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  //设置list item的内容
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.deepPurple : null,
      ),

        /***
         * lsit item 的点击事件
         */
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      }

    );
  }
}