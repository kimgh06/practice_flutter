import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(MyApp());
}

class Fruits{
  String name, price, when;
  Fruits(this.name, this.price, this.when);
}

class MyApp extends StatelessWidget {
  final List<Fruits> items = [
    Fruits('name1', 'price1', 'when1'),
    Fruits('name2', 'price2', 'when2'),
    Fruits('name3', 'price3', 'when3'),
    Fruits('name4', 'price4', 'when4'),
    Fruits('name5', 'price5', 'when5'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of Fruits'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final fruit = items[index];
            return ListTile(
              title: Text(fruit.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text('Price: ${fruit.price}, When: ${fruit.when}',
                style: TextStyle(color: Colors.green),),
            );
          },
        ),
      ),
    );
  }
}

class Navigate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
        '/checklist': (context) => ChecklistPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Logger logger = Logger();

  logger.d('homepage'); // 디버그 레벨 로그
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('메뉴'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Details'),
              onTap: () {
                Navigator.pushNamed(context, '/details');
              },
            ),
            ListTile(
              title: Text('Checklist'),
              onTap: () {
                Navigator.pushNamed(context, '/checklist');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '제목: Home Page',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20),
            Text(
              '내용: 이것은 홈 페이지입니다.\n'
                  '홈 페이지에서는 네비게이터를 통해\n'
                  '사이드 네비게이션 메뉴를 열 수 있습니다.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('메뉴'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Details'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Checklist'),
              onTap: () {
                Navigator.pushNamed(context, '/checklist');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '제목: Details Page',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20),
            Text(
              '내용: 이것은 Details 페이지입니다.\n'
                  'Details 페이지에서는 네비게이터를 통해\n'
                  '사이드 네비게이션 메뉴를 열 수 있습니다.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<bool> checklistItems = [
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('메뉴'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Details'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Checklist'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: checklistItems.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text('항목 ${index + 1}'),
            value: checklistItems[index],
            onChanged: (newValue) {
              setState(() {
                checklistItems[index] = newValue!;
              });
            },
          );
        },
      ),
    );
  }
}
