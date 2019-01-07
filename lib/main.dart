import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ar = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  Color _determine(int a) {
    if (ar[a] == 0)
      return Colors.grey;
    else if (ar[a] == 1)
      return Colors.green;
    else
      return Colors.red;
  }

  void _compute() {
    int k = _winnerCheck();
    print("Winner output $k");
    if (k == 0) {
      int c = new Random().nextInt(8);
      if (ar[c] == 0) {
        ar[c] = 2;
        setState(() {});
      } else
        _compute();
    } else{ 
      if (k == 1) 
      print("USER WINS!");
      else if(k == 2)
      print("COMP WINS!");
      else
      print("DRAW!");
      ar = [0,0,0,0,0,0,0,0,0,];
      setState(() {});
    }
  }

  int _winnerCheck() {
    int uI = 9, cI = 9;
    for (int i = 0; i < 4; i++) {
      //find first indices of user blocks
      if (ar[i] == 1) {
        uI = i;
        break;
      }
    }
    for (int i = 0; i < 4; i++) {
      //find first indices of computer blocks
      if (ar[i] == 2) {
        cI = i;
        break;
      }
    }
    print("uI = $uI \ncI = $cI");

    if (ar[0] == 1 &&
        ((ar[1] == 1 && ar[2] == 1) ||
            (ar[3] == 1 && ar[6] == 1) ||
            (ar[4] == 1 && ar[8] == 1))) return 1;
    if (ar[1] == 1 && ar[4] == 1 && ar[7] == 1) return 1;
    if (ar[2] == 1 &&
        ((ar[4] == 1 && ar[6] == 1) || (ar[5] == 1 && ar[8] == 1))) return 1;
    if (ar[3] == 1 && ar[4] == 1 && ar[5] == 1) return 1;

    if (ar[0] == 2 &&
        ((ar[1] == 2 && ar[2] == 2) ||
            (ar[3] == 2 && ar[6] == 2) ||
            (ar[4] == 2 && ar[8] == 2))) return 2;
    if (ar[1] == 2 && ar[4] == 2 && ar[7] == 2) return 2;
    if (ar[2] == 2 &&
        ((ar[4] == 2 && ar[6] == 2) || (ar[5] == 2 && ar[8] == 2))) return 2;
    if (ar[3] == 2 && ar[4] == 2 && ar[5] == 2) return 2;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: new Table(
          children: [
            TableRow(
              children: [
                FlatButton(
                  color: _determine(0),
                  onPressed: () {
                    if(ar[0]==0)
                    ar[0] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
                FlatButton(
                  color: _determine(1),
                  onPressed: () {
                                        if(ar[1]==0)

                    ar[1] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
                FlatButton(
                  color: _determine(2),
                  onPressed: () {
                                        if(ar[2]==0)

                    ar[2] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
              ],
            ),
            TableRow(
              children: [
                FlatButton(
                  color: _determine(3),
                  onPressed: () {
                                        if(ar[0]==3)

                    ar[3] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
                FlatButton(
                  color: _determine(4),
                  onPressed: () {
                                        if(ar[4]==0)

                    ar[4] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
                FlatButton(
                  color: _determine(5),
                  onPressed: () {
                                        if(ar[5]==0)

                    ar[5] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
              ],
            ),
            TableRow(
              children: [
                FlatButton(
                  color: _determine(6),
                  onPressed: () {
                                        if(ar[6]==0)

                    ar[6] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
                FlatButton(
                  color: _determine(7),
                  onPressed: () {
                                        if(ar[7]==0)

                    ar[7] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
                FlatButton(
                  color: _determine(8),
                  onPressed: () {
                                        if(ar[8]==0)

                    ar[8] = 1;
                    setState(() {});

                    _compute();
                  },
                ),
              ],
            )
          ],
          defaultColumnWidth: FixedColumnWidth(50.0),
          border: TableBorder.all(),
        ),
        // color: Colors.amber,
      )),
    );
  }
}
