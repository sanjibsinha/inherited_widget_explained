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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          setState(() {});
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
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
            'Father has one child. He has blue eyes.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                color: Colors.blue),
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
          'Uncle has red eye!',
          style: TextStyle(fontSize: 25.0, color: Colors.red),
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
      child: EyeColor(
        color: Colors.green,
        child: Builder(
          builder: (BuildContext innerContext) {
            return Column(
              children: [
                Text(
                  'I am the only child of my parents and I have green eyes like a Frog.',
                  style: TextStyle(
                      color: EyeColor.of(innerContext).color,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class EyeColor extends InheritedWidget {
  const EyeColor({
    Key key,
    @required this.color,
    @required Widget child,
  })  : assert(color != null),
        assert(child != null),
        super(key: key, child: child);

  final Color color;

  static EyeColor of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EyeColor>();
  }

  @override
  bool updateShouldNotify(EyeColor old) => color != old.color;
}
