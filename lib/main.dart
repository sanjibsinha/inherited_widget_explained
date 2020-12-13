import 'package:flutter/material.dart';

void main() {
  runApp(InheritedWidgetApp());
}

class InheritedWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget Explained',
      debugShowCheckedModeBanner: false,
      home: InheritedWidgetPage(),
    );
  }
}

class InheritedWidgetPage extends StatefulWidget {
  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Family Tree',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
      ),
      body: GrandParent(),
    );
  }
}

class GrandParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _childrenList();
  }
}

Widget _childrenList() => ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Text(
          'I am the Grandparent, although I am a Ghost now! I had two sons.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        FatherClass(),
        SizedBox(
          height: 10.0,
        ),
        UncleClass(),
      ],
    );

class FatherClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Father has one child.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
          ),
        ),
        IAmTheOnlyChildOfMyFather(),
      ],
    ));
  }
}

class UncleClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Uncle has no child',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
        ),
      ),
    );
  }
}

class IAmTheOnlyChildOfMyFather extends StatefulWidget {
  @override
  _IAmTheOnlyChildOfMyFatherState createState() =>
      _IAmTheOnlyChildOfMyFatherState();
}

class _IAmTheOnlyChildOfMyFatherState extends State<IAmTheOnlyChildOfMyFather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Text(
        'I am the only descendant of my father.',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
    );
  }
}
