import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Displays a Google Map with an animated route and location markers.
class MapRoutePage extends StatefulWidget {
  const MapRoutePage({super.key});

  @override
  State<MapRoutePage> createState() => _MapRoutePageState();
}

class _MapRoutePageState extends State<MapRoutePage>
    with TickerProviderStateMixin {
  // Controller used to interact with the Google Map.
  late GoogleMapController _mapController;

  // List of coordinates representing the route path.
  late List<LatLng> _routePoints;
  
  late AnimationController _animationController;

  // Stores all polylines displayed on the map.
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};
  late LatLng _currentLocation;

  @override
  void initState() {
    super.initState();

    // Define route coordinates.
    _routePoints = [
      const LatLng(0.237392, 32.627872), // Wonder World (Start Point)
      const LatLng(0.243662, 32.641588), // First water point
      const LatLng(0.2562, 32.6448), // Second water point
      const LatLng(0.256395, 32.637483), // Third water point
      const LatLng(0.255789, 32.632501), // Fourth water point
      const LatLng(0.251789, 32.632501), // Final destination (Munyonyo)
    ];

    // Set initial camera position to the first route point.
    _currentLocation = _routePoints[0];

    // Animation runs for 5 seconds while drawing the route.
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    // Update polyline whenever animation value changes.
    _animationController.addListener(_updatePolylinePoints);
    _addMarkers();

    // Delay slightly before starting the animation.
    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController.forward();
    });
  }

  /// Creates markers for all route points.
  void _addMarkers() {
    // Add starting point marker in green.
    _markers.add(
      Marker(
        markerId: const MarkerId('start'),
        position: _routePoints[0],
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ),
      ),
    );

    // Add remaining route points as red markers.
    for (int i = 1; i < _routePoints.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId('point$i'),
          position: _routePoints[i],
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
        ),
      );
    }
  }

  /// Updates the visible route path based on animation progress.
  void _updatePolylinePoints() {
    final List<LatLng> currentPoints = [];
    final int totalPoints = _routePoints.length;

    // Determine how many route segments should currently be visible.
    final pointsToShow =
        ((_animationController.value) * (totalPoints - 1)).floor();

    // Always include the starting point.
    currentPoints.add(_routePoints[0]);

    // Add route points progressively as the animation advances.
    for (int i = 0; i < pointsToShow; i++) {
      if (i + 1 < totalPoints) {
        final startPoint = _routePoints[i];
        final endPoint = _routePoints[i + 1];

        // Smoothly animate the current segment using interpolation.
        if (i == pointsToShow - 1) {
          final segmentProgress =
              (_animationController.value * (totalPoints - 1)) % 1;

          final lat = startPoint.latitude +
              (endPoint.latitude - startPoint.latitude) * segmentProgress;

          final lng = startPoint.longitude +
              (endPoint.longitude - startPoint.longitude) * segmentProgress;

          currentPoints.add(LatLng(lat, lng));
        } else {
          currentPoints.add(endPoint);
        }
      }
    }

    // Update the displayed polyline.
    setState(() {
      _polylines.clear();

      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: currentPoints,
          color: Colors.blue,
          width: 5,

          // Creates a dashed line effect.
          patterns: [
            PatternItem.dash(20),
            PatternItem.gap(10),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // Clean up animation controller when widget is removed.
    _animationController.dispose();
    super.dispose();
  }

  /// Called when the Google Map is fully initialized.
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  /// Restarts the route drawing animation.
  void _restartAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Tracking'),
        backgroundColor: Colors.blue,
      ),

      // Main map widget.
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 13,
        ),
        onMapCreated: _onMapCreated,
        polylines: _polylines,
        markers: _markers,
        mapType: MapType.normal,
      ),

      // Button to replay the route animation.
      floatingActionButton: FloatingActionButton(
        onPressed: _restartAnimation,
        child: const Icon(Icons.replay),
      ),
    );
  }
}
