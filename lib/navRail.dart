import 'package:flutter/material.dart';
import 'package:timywebapp/pages/channelInfo.dart';
import 'package:timywebapp/pages/dashboard.dart';
import 'package:timywebapp/pages/schedule.dart';
import 'package:timywebapp/pages/shows.dart';
import 'package:timywebapp/authentication/auth_service.dart';

class NavRail extends StatefulWidget {
  @override
  _NavRailState createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;
  final AuthService _auth = AuthService();

  final position = [
    Dashboard(),
    ChannelInfo(),
    Shows(),
    Schedule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Timytime')),
        backgroundColor: Colors.grey[900],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              color: Colors.white,
              label: Text('Logout'),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 100,
            child: NavigationRail(
              backgroundColor: Colors.grey[900],
              elevation: 4,
              labelType: NavigationRailLabelType.all,
              groupAlignment: -0.5,
              destinations: [
                NavigationRailDestination(
                    label: Text('Dashboard'),
                    icon: Icon(
                      Icons.stacked_bar_chart,
                      color: Colors.white,
                    )),
                NavigationRailDestination(
                    label: Text('Channel Info'),
                    icon: Icon(
                      Icons.tv,
                      color: Colors.white,
                    )),
                NavigationRailDestination(
                    label: Text('Shows'),
                    icon: Icon(
                      Icons.shop,
                      color: Colors.white,
                    )),
                NavigationRailDestination(
                    label: Text('Schedule'),
                    icon: Icon(
                      Icons.schedule,
                      color: Colors.white,
                    )),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              child: position[_selectedIndex],
            ),
          )
        ],
      ),
    );
  }
}
