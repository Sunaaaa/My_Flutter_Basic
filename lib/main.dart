import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Custom 위젯 만들기
Widget titleSection = new Container(
  padding: const EdgeInsets.all(32),
  decoration: new BoxDecoration(color: Colors.amber),
  child: Row(
    children: [
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: new Text(
              'Hello :)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          new Text(
            'My name is Sun Ah!',
            style: TextStyle(color: Colors.grey),
          )
        ],
      )),
      new Icon(
        Icons.favorite_rounded,
        color: Colors.pink,
      ),
      new Text('50')
    ],
  ),
);
Widget textSection = new Container(
  padding: const EdgeInsets.all(32),
  child: new Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);


int _count = 0;

class LikeCount extends StatefulWidget{
  @override
  _LikeCount createState() => _LikeCount();
}

class _LikeCount extends State<LikeCount>{

  @override
  Widget build(BuildContext context) {
    return new Text('$_count');
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(
          icon,
          color: color,
        ),
        Container(
          // margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: new Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: color),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Hi OMPANGI'),
          backgroundColor: Colors.amber,
          shadowColor: Colors.black,
        ),
        body: new ListView(
          children: [
            Image.asset(
              'images/ompang.jpg',
              width: 400,
              height: 300,
              fit: BoxFit.cover
            ),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: new BoxDecoration(color: Colors.amber[50]),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: new Text(
                          'Hello :)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Text(
                        'My name is Sun Ah!',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )),
                  new Icon(
                    Icons.favorite_rounded,
                    color: Colors.pink,
                  ),
                  new Text('50')
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButtonColumn(Colors.teal[800], Icons.add_call, 'CALL'),
                  _buildButtonColumn(Colors.teal[800], Icons.near_me, 'ROUTE'),
                  _buildButtonColumn(Colors.teal[800], Icons.share, 'SHARE'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: new Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
                softWrap: true,
              ),
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          // child: new Icon(Icons.add_a_photo),
          child: new Icon(Icons.favorite_rounded, color: Colors.pink),
          onPressed: () => {
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Colors.green[900],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), title: new Text('Alarm')),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified), title: new Text('Event')),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart), title: new Text('Chart'))
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.amber,
        ),
      ),
    );
  }
}
