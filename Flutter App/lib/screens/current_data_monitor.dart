
import 'package:flutter/material.dart';
import 'package:aqua_track/tracked_data.dart';
import 'currentdata_widget.dart';

/// The main widget for displaying current readings.
class TrackedDataMonitor extends StatefulWidget {
  const TrackedDataMonitor({super.key});

  @override
  _TrackedDataMonitorState createState() => _TrackedDataMonitorState();
}

class _TrackedDataMonitorState extends State<TrackedDataMonitor> {
  TrackedData? currentData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  /// Fetches the most recent greenhouse data from the API.
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Fetch last 24 hours of data and get the most recent reading
      final data = await TrackedDataService.fetchData(
        DateTime.now().subtract(const Duration(hours: 24)),
      );
      setState(() {
        currentData = data.isNotEmpty ? data.last : null;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to load data. Please try again later.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Current Readings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchData,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: fetchData,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            CurrentReadings(latestData: currentData),
          ],
        ),
      ),
    );
  }
}