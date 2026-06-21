// currentdata_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aqua_track/tracked_data.dart';
/// Displays the latest temperature and humidity readings
/// received from the tracked device.
class CurrentReadings extends StatelessWidget {
  /// Most recent sensor data.
  final TrackedData? latestData;

  const CurrentReadings({super.key, required this.latestData});

  @override
  Widget build(BuildContext context) {
    // Show a placeholder message when no data is available.
    if (latestData == null) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      // Prevent the widget from becoming too wide on larger screens.
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(20),

      // Card-like styling.
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
          // Section title.
          const Text(
            'Current Readings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 24),
          // Temperature reading row.
          _buildReadingRow(
            'Temperature',
            '${latestData!.temperature.toStringAsFixed(1)}°C',
            Icons.thermostat,
            Colors.orange,
          ),

          const SizedBox(height: 16),
          // Humidity reading row.
          _buildReadingRow(
            'Humidity',
            '${latestData!.humidity.toStringAsFixed(1)}%',
            Icons.water_drop,
            Colors.blue,
          ),
          const SizedBox(height: 24),
          // Display timestamp of the latest reading.
          _buildLastUpdated(latestData!.dateTime),
        ],
      ),
    );
  }
  /// Creates a row displaying a sensor reading with:
  /// - an icon
  /// - a label
  /// - the current value
  Widget _buildReadingRow(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        // Colored icon container.
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
        // Reading label and value.
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
  /// Displays the date and time when the latest sensor
  /// reading was received.
  Widget _buildLastUpdated(DateTime dateTime) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Clock icon.
          const Icon(
            Icons.access_time,
            size: 16,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          // Formatted timestamp.
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
