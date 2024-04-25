import 'package:flutter/material.dart';
import 'package:valorant_fantasy/views/fantasy_page/fantasy_dashboard.dart';
import 'package:valorant_fantasy/views/home_page/home_page.dart';
import 'package:valorant_fantasy/views/setting_page/settings_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBarView(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget tabBarView() {
    return TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [HomePage(), FantasyDashboard(), SettingsPage()]);
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad),
          label: "Fantasy",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.redAccent,
      backgroundColor: Color.fromARGB(255, 1, 38, 67),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontSize: 14),
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onItemClicked,
    );
  }
}
