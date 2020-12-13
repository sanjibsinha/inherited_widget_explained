import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  var age = new ChangeAge(age: 55);
  @override
  Widget build(BuildContext context) {
    return ChangingAge(
      age: age,
      child: Scaffold(
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
            setState(() {
              age.changeAge();
            });
          },
          child: Icon(Icons.adb),
          backgroundColor: Colors.green,
        ),
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

class FatherClass extends GrandParent {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Father has one child and he was born with blue eyes. However ' +
                'you can change his age by clicking the add button below.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.blue),
          ),
        ),
        IAmTheOnlyChildOfMyFather(),
      ],
    ));
  }
}

class UncleClass extends GrandParent {
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

class IAmTheOnlyChildOfMyFather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChangeAge myAge = ChangingAge.of(context).age;
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          EyeColor(
            color: Colors.green,
            child: Builder(
              builder: (BuildContext innerContext) {
                Color eyeColor = EyeColor.of(innerContext).color;
                return Column(
                  children: [
                    Text(
                      'I am the only child of my parents of age ' +
                          '${myAge.age}' +
                          ' I have green eyes like a Frog. So the text is green.' +
                          ' Click the button to raise my age.',
                      style: TextStyle(
                          color: eyeColor,
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
        ],
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

class ChangingAge extends InheritedWidget {
  const ChangingAge({
    Key key,
    @required this.age,
    @required Widget child,
  })  : assert(age != null),
        super(key: key, child: child);

  final ChangeAge age;

  static ChangingAge of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChangingAge>();
  }

  @override
  bool updateShouldNotify(ChangingAge old) => age != old.age;
}

class ChangeAge {
  int age;
  ChangeAge({this.age});
  void changeAge() {
    age += 5;
  }
}
