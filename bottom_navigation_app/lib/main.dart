import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "bottom Nav app",
      home: MainPage(),
    ));

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> myWidget = <Widget>[
      const MyOption('Welcome To Home',Color(0xFF3944F7)),
    const MyOption('Welcome to About',Color(0xFFB4161B)),
      const MyOption('Welcome to Setting',Color(0xFF3DBE29)),
  ];

  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF35BDD0),
        title: const Text("Bottom Navigation App"),
      ),
      body: Center(
        child: myWidget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

class MyOption extends StatelessWidget {
  
  final String title;
  final Color color;
  
   // ignore: use_key_in_widget_constructors
   const MyOption(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
         ),
        height: 100,
        width: double.infinity,
        child:  Center(
          child: Text( title, style: const TextStyle(fontSize: 40, color: Colors.white)),
        ),
      ),
    );
  }
}
