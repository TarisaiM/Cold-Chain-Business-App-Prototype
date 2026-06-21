
//currentdata_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aqua_track/tracked_data.dart';

/// A widget that displays the most recent tracked data readings.
class CurrentReadings extends StatelessWidget {
  final TrackedData? latestData;

  const CurrentReadings({super.key, required this.latestData});

  @override
  Widget build(BuildContext context) {
    if (latestData == null) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Current Readings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          _buildReadingRow(
            'Temperature',
            '${latestData!.temperature.toStringAsFixed(1)}°C',
            Icons.thermostat,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildReadingRow(
            'Humidity',
            '${latestData!.humidity.toStringAsFixed(1)}%',
            Icons.water_drop,
            Colors.blue,
          ),
          const SizedBox(height: 24),
          _buildLastUpdated(latestData!.dateTime),
        ],
      ),
    );
  }

  Widget _buildReadingRow(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLastUpdated(DateTime dateTime) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.access_time,
            size: 16,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            'Last Updated: ${DateFormat('yyyy-MM-dd HH:mm').format(dateTime)}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}