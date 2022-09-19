import 'package:coffee_masters/pages/offerspage.dart';
import 'package:flutter/material.dart';

import 'pages/menupage.dart';
import 'pages/orderpage.dart';

void main() {
  runApp(const MyApp());
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var name = "";
  @override
  Widget build(BuildContext context) {
    var myStyle = const TextStyle(fontSize: 20);
    return Column(children: [
      Row(
        children: [
          Text("Hello $name", style: myStyle),
          Text("!!!", style: myStyle),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
      )
    ]);
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Hello World');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = Text("Hello World");

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = const MenuPage();
        break;
      case 1:
        currentWidgetPage = const OffersPage();
        break;
      case 2:
        currentWidgetPage = const OrderPage();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logo.png"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow.shade400,
          unselectedItemColor: Colors.brown.shade50,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Menu"),
            // BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: "Coffee"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer), label: "Offers"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Order"),
            // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: currentWidgetPage,
    );
  }
}
