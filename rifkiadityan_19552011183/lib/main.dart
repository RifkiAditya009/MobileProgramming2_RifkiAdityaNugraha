import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:rifkiadityan_19552011183/pages/dashboard_screen.dart';
import 'package:rifkiadityan_19552011183/pages/datepick_screen.dart';
import 'package:rifkiadityan_19552011183/pages/timepick_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: const <Widget>[
            DashboardScreen(),
            DatepickScreen(),
            TimepickScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          // ignore: unused_label
          _selectedIndex:
          index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              activeColor: Colors.blueAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.date_range),
              title: Text('Date'),
              activeColor: Colors.redAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.timer),
              title: Text('Time'),
              activeColor: Colors.greenAccent)
        ],
      ),
    );
  }
}
