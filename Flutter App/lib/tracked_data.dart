// tracked_data.dart
//asynchronous operation and exception handling
import 'dart:async';
import 'dart:io';

//package for making API request
import 'package:http/http.dart' as http;
import 'dart:convert'; // JSON encode/decode support
import 'package:intl/intl.dart'; //date formatting package

//Class representing a single tracked sensor reading
class TrackedData {
  final DateTime dateTime;
  final double temperature;
  final double humidity;
  final double? latitude;  // Added for map integration
  final double? longitude; // Added for map integration

  ///constructor for creating a TrackedData object
  const TrackedData({
    required this.dateTime,
    required this.temperature,
    required this.humidity,
    this.latitude,
    this.longitude,
  });

  /// Factory constructor that creates a TrackedData object
  /// from JSON data received from the API
  factory TrackedData.fromJson(Map<String, dynamic> json) {
    return TrackedData(
      dateTime: DateTime.parse(json['timestamp']),
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
    );
  }
}
//service class that retrieves tracking data from API
class TrackedDataService {
  //URL of backend API where you get data from the database based on device stored coordinates
  static const _baseUrl = 'InsertyourAPI';
  //formatter to convert dates api compatible format
  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  static Future<List<TrackedData>> fetchData(DateTime startDate) async {
    try {
      final response = await http.get(
          Uri.parse('$_baseUrl/get_data?start_date=${_dateFormatter.format(startDate)}')
      ).timeout(const Duration(seconds: 10)); //request time out
//check if api request was successful
      if (response.statusCode == 200) {
        //decode json response
        final jsonData = json.decode(response.body);
        final List<TrackedData> allData = (jsonData['items'] as List)
            .map((item) => TrackedData.fromJson(item))
            .toList();
//filter data to include records after startdate
        return allData.where((data) => data.dateTime.isAfter(startDate)).toList();
      } else {
        throw HttpException('Server returned ${response.statusCode}'); //exception if server returns an error status code
      }
    } on TimeoutException {
      throw const HttpException('Request timed out');
    } catch (e) {
      throw HttpException('Failed to load data: $e');
    }
  }
}
