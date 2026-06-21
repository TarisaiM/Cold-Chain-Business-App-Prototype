//main.dart
import 'package:flutter/material.dart';
//Import application screens
import 'package:aqua_track/screens/inspector_form/inspection_screen1.dart';
import 'package:aqua_track/screens/current_data_monitor.dart';
import 'package:aqua_track/screens/map_screen.dart';

void main() {
  runApp( const AquaApp());
}

//root widget of the application
class AquaApp extends StatelessWidget {
  const AquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaTrack Logistics',
      //Application theme configuration
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //App colour scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.lightBlue,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
      //named routes for navigation between screens
      routes: {
        '/home': (context) => const HomePage(),
        '/data': (context) => const TrackedDataMonitor(),
        '/map': (context) => const MapRoutePage(),
        '/inspector': (context) => const InspectorScreen(),
      },
    );
  }
}
//Dashboard screen displayed after app launch
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//top application bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AquaTrack Logistics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings
            },
          ),
        ],
      ),
//Dashboard layout with navigation cards
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1.5, // Makes each card wider than tall
        mainAxisSpacing: 16.0, // Space between cards vertically
        padding: const EdgeInsets.all(24.0),
        children: const [
          DashboardCard(
            title: 'Current Data',
            icon: Icons.data_usage,
            route: '/data',
          ),
          DashboardCard(
            title: 'Map View',
            icon: Icons.map,
            route: '/map',
          ),
          DashboardCard(
            title: 'Inspector',
            icon: Icons.assignment,
            route: '/inspector',
          ),
        ],
      ),
    );
  }
}
//reuse of card widget used for navigation
class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      color: Colors.white54, // Light grey background
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


