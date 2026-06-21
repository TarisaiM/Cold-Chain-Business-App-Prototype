// inspector_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aqua_track/screens/inspector_form/inspection_screen2.dart';

// // Add color constants at the top of the file after imports
// const formBackgroundColor = Color(0xFF4A90E2); // Main blue background
// const inputBackgroundColor = Color(0xFF5B9DE3); // Lighter blue for inputs
// const inputBorderColor = Color(0xFF78B6FF); // Even lighter blue for borders
// const textColor = Colors.white;
// const hintTextColor = Colors.white70;
// class InspectorScreen extends StatefulWidget {
//   const InspectorScreen({super.key});
//
//   @override
//   State<InspectorScreen> createState() => _InspectorScreenState();
// }
//
// class _InspectorScreenState extends State<InspectorScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _dateController = TextEditingController();
//   final _supplierController = TextEditingController();
//   final _boatRegController = TextEditingController();
//   final _districtController = TextEditingController();
//   final _landingSiteController = TextEditingController();
//   final _truckRegController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF4A90E2),
//       appBar: AppBar(
//         title: const Text('Inspection Form'),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Department of Fisheries Resources',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 const Text(
//                   'Local Fish Health Inspection Certificate',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Compiled History Record',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 _buildTextField(
//                   controller: _dateController,
//                   label: 'DD / MM / YYYY',
//                   suffixIcon: Icons.calendar_today,
//                   onTap: () async {
//                     final date = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2018),
//                       lastDate: DateTime(2030),
//                     );
//                     if (date != null) {
//                       _dateController.text = DateFormat('dd/MM/yyyy').format(date);
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _supplierController,
//                   label: 'Name of Supplier',
//                   suffixIcon: Icons.business,
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _boatRegController,
//                   label: 'Boat Registration Number',
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   'Accompanying Certificate',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 _buildTextField(
//                   controller: _districtController,
//                   label: 'District Name',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _landingSiteController,
//                   label: 'Landing Site Name',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _truckRegController,
//                   label: 'Truck Registration Number',
//                   suffixIcon: Icons.local_shipping,
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Collect form data
//                         final formData = {
//                           'date': _dateController.text,
//                           'supplier': _supplierController.text,
//                           'boatRegistration': _boatRegController.text,
//                           'district': _districtController.text,
//                           'landingSite': _landingSiteController.text,
//                           'truckRegistration': _truckRegController.text,
//                         };
//
//                         // Navigate to fish details page
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => InspectionScreen2(
//                               previousFormData: formData,
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue[900],
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Next',
//                       style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     IconData? suffixIcon,
//     VoidCallback? onTap,
//   }) {
//     return TextFormField(
//       controller: controller,
//       onTap: onTap,
//       readOnly: onTap != null,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white70),
//         suffixIcon: suffixIcon != null
//             ? Icon(suffixIcon, color: Colors.white70)
//             : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.white70),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.white70),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.white),
//         ),
//       ),
//       style: const TextStyle(color: Colors.white),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'This field is required';
//         }
//         return null;
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _dateController.dispose();
//     _supplierController.dispose();
//     _boatRegController.dispose();
//     _districtController.dispose();
//     _landingSiteController.dispose();
//     _truckRegController.dispose();
//     super.dispose();
//   }
// }

//white form
class InspectorScreen extends StatefulWidget {
  const InspectorScreen({super.key});

  @override
  State<InspectorScreen> createState() => _InspectorScreenState();
}

class _InspectorScreenState extends State<InspectorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _supplierController = TextEditingController();
  final _boatRegController = TextEditingController();
  final _districtController = TextEditingController();
  final _landingSiteController = TextEditingController();
  final _truckRegController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Inspection Form'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Department of Fisheries Resources',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'Local Fish Health Inspection Certificate',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Compiled History Record',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _dateController,
                  label: 'DD / MM / YYYY',
                  suffixIcon: Icons.calendar_today,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      _dateController.text = DateFormat('dd/MM/yyyy').format(date);
                    }
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _supplierController,
                  label: 'Name of Supplier',
                  suffixIcon: Icons.business,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _boatRegController,
                  label: 'Boat Registration Number',
                ),
                const SizedBox(height: 24),
                const Text(
                  'Accompanying Certificate',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _districtController,
                  label: 'District Name',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _landingSiteController,
                  label: 'Landing Site Name',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _truckRegController,
                  label: 'Truck Registration Number',
                  suffixIcon: Icons.local_shipping,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final formData = {
                          'date': _dateController.text,
                          'supplier': _supplierController.text,
                          'boatRegistration': _boatRegController.text,
                          'district': _districtController.text,
                          'landingSite': _landingSiteController.text,
                          'truckRegistration': _truckRegController.text,
                        };
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InspectionScreen2(
                              previousFormData: formData,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? suffixIcon,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: onTap != null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: Colors.grey)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      style: const TextStyle(color: Colors.black87),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _supplierController.dispose();
    _boatRegController.dispose();
    _districtController.dispose();
    _landingSiteController.dispose();
    _truckRegController.dispose();
    super.dispose();
  }
}