import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());
  runApp(MaterialApp(
    title: "Todo List",
    home: ToDo(),
  ));
}

class ToDoItem {
  String _title = "";
  bool _isRed = false;

  String get title => (_title == null) ? "-" : _title;

  bool get isRed => _isRed;

  set isRed(bool isRed) => isRed ? false : true;

  ToDoItem(this._title);
}

class ToDoTile extends StatelessWidget {
  ToDoTile(this._item);

  final ToDoItem _item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: new Text(_item.title),
      trailing: new Icon(Icons.arrow_right),
    );
  }
}

class ToDo extends StatefulWidget {
  @override
  _ToDo createState() => _ToDo();
}

class _ToDo extends State<ToDo> {
  List<ToDoItem> _todoItems = [];

  final titleController = TextEditingController();

  void _addTodoItem(String title) {
    if (title
        .trim()
        .length > 0) {
      setState(() {
        _todoItems.add(new ToDoItem(title));
      });
    }
  }
  void _pushDetailTodoScreen() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                appBar: new AppBar(
                  title: new Text('옴팡이의 할일 추가'),
                  backgroundColor: Colors.amber,
                ),
                body: new TextField(
                  autofocus: true,
                  onSubmitted: (val) {
                    _addTodoItem(val);
                    Navigator.pop(context);
                  },
                  decoration: new InputDecoration(
                    hintText: "할일을 적어보아요 !",
                    contentPadding: const EdgeInsets.all(16.0),
                    filled: true,
                    fillColor: Colors.grey[60],
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30.0),
                    //   borderSide: BorderSide.none,
                    // ),
                  ),
                ),
              );
            })
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('옴팡이의 할일'),
              backgroundColor: Colors.amber,
            ),
            body: Container(
              color: Colors.amber,
              child: Column(
                children: <Widget>[
                  // new TextField(
                  //   autofocus: true,
                  //   onSubmitted: (val) {
                  //     _addTodoItem(val);
                  //     Navigator.pop(context);
                  //   },
                  //   decoration: new InputDecoration(
                  //     hintText: "할일을 적어보아요 !",
                  //     contentPadding: const EdgeInsets.all(16.0),
                  //     filled: true,
                  //     fillColor: Colors.grey[60],
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30.0),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(right: 220, top: 30, bottom: 30),
                    child: Text("할일 ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      padding: EdgeInsets.only(left: 10, bottom: 200),
                      alignment: Alignment(0.0,0.0),
                      height: 250,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15)),
                        border: Border.all(
                          color: Colors.amberAccent, width: 1)
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                                child: TextField(
                                  controller: titleController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "옴팡이의 할일을 적어주세요~",
                                    hintStyle: TextStyle(color: Colors.grey[500]),
                                  ),
                                  cursorColor: Colors.teal[900],
                                  onSubmitted: (val) {
                                    _addTodoItem(titleController.text);
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ]
              ),
            )
          );
        })
    );
  }

  ListView _buildTodoList() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _todoItems.length,
      reverse: true,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ToDoTile(_todoItems[index]);
        // return Container(
        //   height: 30,
        //   color: Colors.amber[50],
        //   child: Center(child: Text(_todoItems[index].title)),
        // );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('옴팡이의 Todo :)'),
        backgroundColor: Colors.amber,
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: '할일 추가',
        child: new Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
// // 화면 이동 연습
// class First extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("First Page"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: new Text("Go To Second",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
//           color: Colors.amber[900],
//           onPressed: () {
//             // push에 전달되는 두번째 매개변수는 Route<T> Class
//             Navigator.push(context,
//                 MaterialPageRoute<void>(builder: (BuildContext context) {
//               return Second();
//             }));
//
//             /**
//             // 화살표 문법 적용
//             Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) => Second()));
//             // of 메소드 호출이 불편
//             Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) => Second()));
//             **/
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class Second extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("Second Page"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: new Text("Back To First",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
//               color: Colors.amber[200],
//               onPressed: () {
//                 // push에 전달되는 두번째 매개변수는 Route<T> Class
//                 Navigator.pop(context);
//                 // Navigator.of(context).pop();
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // Custom 위젯 만들기
// // Widget titleSection = new Container(
// //   padding: const EdgeInsets.all(32),
// //   decoration: new BoxDecoration(color: Colors.amber[50]),
// //   child: Row(
// //     children: [
// //       Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.only(bottom: 8),
// //                 child: new Text(
// //                   'Hello :)',
// //                   style: TextStyle(fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               new Text(
// //                 // 'My name is Sun Ah!',
// //                 'My name is Sun Ah!',
// //                 style: TextStyle(color: Colors.grey),
// //               )
// //             ],
// //           )
// //       ),
// //       new Icon(
// //         Icons.favorite_rounded,
// //         color: Colors.pink,
// //       ),
// //       Padding(padding: EdgeInsets.all(2)),
// //       new Text(
// //         '$_count',
// //         style: TextStyle(
// //           fontSize: 20,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       )
// //     ],
// //   ),
// // );
// Widget textSection = new Container(
//   padding: const EdgeInsets.all(32),
//   child: new Text(
//     'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//     'Alps. Situated 1,578 meters above sea level, it is one of the '
//     'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//     'half-hour walk through pastures and pine forest, leads you to the '
//     'lake, which warms to 20 degrees Celsius in the summer. Activities '
//     'enjoyed here include rowing, and riding the summer toboggan run.',
//     softWrap: true,
//   ),
// );
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyApp createState() => _MyApp();
// }
//
// class _MyApp extends State<MyApp> {
//   // This widget is the root of your application.
//
//   // int _count = 0;
//   bool _isSelected = true;
//   int _count = 0;
//
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         new Icon(
//           icon,
//           color: color,
//         ),
//         Container(
//           // margin: const EdgeInsets.all(10),
//           padding: const EdgeInsets.all(10),
//           child: new Text(
//             label,
//             style: TextStyle(
//                 fontSize: 12, fontWeight: FontWeight.bold, color: color),
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Color _color = Colors.pink;
//     // bool _isSelected = true;
//
//     void _toggleFavorite() {
//       setState(() {
//         if (_isSelected) {
//           _count -= 1;
//           _isSelected = false;
//         } else {
//           _count += 1;
//           _isSelected = true;
//         }
//       });
//     }
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'MyApp',
//       home: Scaffold(
//         appBar: AppBar(
//           title: new Text('Hi OMPANGI'),
//           backgroundColor: Colors.amber,
//           shadowColor: Colors.black,
//         ),
//         body: new ListView(
//           children: [
//             Image.asset('images/ompang.jpg',
//                 width: 400, height: 300, fit: BoxFit.cover),
//             Container(
//               padding: const EdgeInsets.all(32),
//               decoration: new BoxDecoration(color: Colors.amber[50]),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: new Text(
//                           'Hello :)',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       new Text(
//                         // 'My name is Sun Ah!',
//                         'My name is Sun Ah!',
//                         style: TextStyle(color: Colors.grey),
//                       )
//                     ],
//                   )),
//                   new IconButton(
//                     icon: _isSelected
//                         ? Icon(Icons.favorite)
//                         : Icon(Icons.favorite_border),
//                     // _isSelected?Icons.favorite_rounded:Icons.favorite_border,
//                     color: Colors.pink,
//                     onPressed: _toggleFavorite,
//                   ),
//                   Padding(padding: EdgeInsets.all(2)),
//                   new Text(
//                     '$_count',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildButtonColumn(Colors.teal[800], Icons.add_call, 'CALL'),
//                   _buildButtonColumn(Colors.teal[800], Icons.near_me, 'ROUTE'),
//                   _buildButtonColumn(Colors.teal[800], Icons.share, 'SHARE'),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(32),
//               child: new Text(
//                 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
//                 softWrap: true,
//               ),
//             )
//           ],
//         ),
//         floatingActionButton: new FloatingActionButton(
//           // child: new Icon(Icons.add_a_photo),
//           child: new Icon(Icons.favorite_rounded, color: Colors.pink),
//           onPressed: () {
//             setState(() {
//               _count++;
//             });
//             print('$_count');
//           },
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15.0))),
//           backgroundColor: Colors.green[900],
//         ),
//         bottomNavigationBar: new BottomNavigationBar(
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.access_alarm), title: new Text('Alarm')),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.verified), title: new Text('Event')),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.table_chart), title: new Text('Chart'))
//           ],
//           unselectedItemColor: Colors.grey,
//           selectedItemColor: Colors.amber,
//         ),
//       ),
//     );
//   }
// }
