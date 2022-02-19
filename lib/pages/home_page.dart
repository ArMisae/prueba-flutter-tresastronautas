import 'package:flutter/material.dart';
import 'package:prueba_flutter_nasa/pages/components/body.dart';
import 'package:prueba_flutter_nasa/widgets/bottom_navybar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 250,
        centerTitle: true,
        leading: logo(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                settingsButton(Icons.notifications_none_rounded),
                settingsButton(Icons.settings_outlined),
              ],
            ),
          )
        ],
      ),
      body: const Body(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(
              Icons.home_outlined,
            ),
            title: const Text('Home'),
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.calendar_today_rounded),
            title: const Text('Calendar'),
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.search),
            title: const Text(
              'Search',
            ),
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text('Favorites'),
          ),
        ],
      ),
    );
  }

  IconButton settingsButton(IconData icon) {
    return IconButton(
      splashRadius: 10,
      onPressed: () {},
      padding: const EdgeInsets.all(5),
      icon: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white),
        child: Icon(
          icon,
          color: Colors.black,
          size: 25,
        ),
      ),
    );
  }

  Padding logo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ClipRRect(
        child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1200px-NASA_logo.svg.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
