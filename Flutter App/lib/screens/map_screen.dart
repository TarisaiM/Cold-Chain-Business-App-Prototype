// //this works
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapRoutePage extends StatefulWidget {
//   const MapRoutePage({super.key});
//
//   @override
//   State<MapRoutePage> createState() => _MapRoutePageState();
// }
//
// class _MapRoutePageState extends State<MapRoutePage> with TickerProviderStateMixin {
//   late GoogleMapController _mapController;
//   late List<LatLng> _routePoints;
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   final Set<Polyline> _polylines = {};
//   final Set<Marker> _markers = {};
//   late LatLng _currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     _routePoints = [
//       const LatLng(0.237392, 32.627872),//the Marina
//       const LatLng(0.243662, 32.641588),
//       const LatLng(0.2562, 32.6448), // Lake Victoria
//       const LatLng(0.256395, 32.637483), // Gaba landing site
//       const LatLng(0.289967, 32.606389), // Entebbe (End)
//     ];
//
//     _currentLocation = _routePoints[0]; // Starting location
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     );
//
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//
//     _animationController.forward(from: 0);
//     _drawRoute();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//     setState(() {
//       // Add markers for each point along the route
//       for (int i = 0; i < _routePoints.length; i++) {
//         _markers.add(Marker(
//           markerId: MarkerId('point$i'),
//           position: _routePoints[i],
//           icon: i == 0
//               ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
//               : i == _routePoints.length - 1
//               ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
//               : BitmapDescriptor.defaultMarker,
//         ));
//       }
//     });
//   }
//
//   void _drawRoute() {
//     setState(() {
//       _polylines.add(Polyline(
//         polylineId: const PolylineId('route'),
//         points: _routePoints,
//         color: const Color.fromRGBO(0, 102, 255, 1.0),
//         width: 6,
//         patterns: [PatternItem.dash(20), PatternItem.gap(10)], // Optional: adds dashed pattern
//         geodesic: true, // Makes the line follow Earth's curvature
//       ));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Interactive Map Route in Uganda')),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: _currentLocation,
//           zoom: 12,
//         ),
//         onMapCreated: _onMapCreated,
//         polylines: _polylines,
//         markers: _markers,
//         mapType: MapType.normal,
//         onCameraMove: (CameraPosition position) {
//           setState(() {
//             _currentLocation = position.target;
//           });
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _drawRoute,
//         child: const Icon(Icons.directions),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoutePage extends StatefulWidget {
  const MapRoutePage({super.key});

  @override
  State<MapRoutePage> createState() => _MapRoutePageState();
}

class _MapRoutePageState extends State<MapRoutePage> with TickerProviderStateMixin {
  late GoogleMapController _mapController;
  late List<LatLng> _routePoints;
  late AnimationController _animationController;
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};
  late LatLng _currentLocation;

  @override
  void initState() {
    super.initState();
    _routePoints = [
      const LatLng(0.237392, 32.627872), // Wonder World
      const LatLng(0.243662, 32.641588), // First water point
      const LatLng(0.2562, 32.6448),     // Second water point
      const LatLng(0.256395, 32.637483), // Third water point
      const LatLng(0.255789, 32.632501), // Fourth water point
      const LatLng(0.251789, 32.632501), // Final destination on land (Munyonyo)
    ];

    _currentLocation = _routePoints[0];
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animationController.addListener(_updatePolylinePoints);
    _addMarkers();

    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController.forward();
    });
  }

  void _addMarkers() {
    // Add first point as green
    _markers.add(
      Marker(
        markerId: const MarkerId('start'),
        position: _routePoints[0],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );

    // Add red markers for all remaining points
    for (int i = 1; i < _routePoints.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId('point$i'),
          position: _routePoints[i],
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }
  }

  void _updatePolylinePoints() {
    final List<LatLng> currentPoints = [];
    final int totalPoints = _routePoints.length;

    // Calculate how many segments to show based on animation value
    final pointsToShow = ((_animationController.value) * (totalPoints - 1)).floor();

    // Always add the first point
    currentPoints.add(_routePoints[0]);

    // Add intermediate points based on animation progress
    for (int i = 0; i < pointsToShow; i++) {
      if (i + 1 < totalPoints) {
        final startPoint = _routePoints[i];
        final endPoint = _routePoints[i + 1];

        // If this is the last segment being animated, interpolate between points
        if (i == pointsToShow - 1) {
          final segmentProgress = (_animationController.value * (totalPoints - 1)) % 1;
          final lat = startPoint.latitude + (endPoint.latitude - startPoint.latitude) * segmentProgress;
          final lng = startPoint.longitude + (endPoint.longitude - startPoint.longitude) * segmentProgress;
          currentPoints.add(LatLng(lat, lng));
        } else {
          currentPoints.add(endPoint);
        }
      }
    }

    setState(() {
      _polylines.clear();
      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: currentPoints,
          color: Colors.blue,
          width: 5,
          patterns: [PatternItem.dash(20), PatternItem.gap(10)],
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: _restartAnimation,
        child: const Icon(Icons.replay),
      ),
    );
  }
}