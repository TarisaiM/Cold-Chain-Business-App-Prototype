
// lib/screens/fish_details_screen.dart
import 'package:flutter/material.dart';
import 'package:aqua_track/screens/inspector_form/certificate_screen.dart';

// class InspectionScreen2 extends StatefulWidget {
//   final Map<String, String> previousFormData;
//
//   const InspectionScreen2({
//     super.key,
//     required this.previousFormData,
//   });
//
//   @override
//   State<InspectionScreen2> createState() => _FishDetailsScreenState();
// }
//
// class _FishDetailsScreenState extends State<InspectionScreen2> {
//   final _formKey = GlobalKey<FormState>();
//   final _speciesController = TextEditingController();
//   final _weightController = TextEditingController();
//   final _quantityController = TextEditingController();
//   final _temperatureController = TextEditingController();
//   final _inspectorController = TextEditingController();
//   final _designationController = TextEditingController();
//   final _signatureController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF4A90E2),
//       appBar: AppBar(
//         title: const Text('Inspection Form'),
//         backgroundColor: Color(0xFF4A90E2),
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
//                 const SizedBox(height: 24),
//                 const Text(
//                   '| Accompanying Certificate',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _speciesController,
//                   label: 'Species of Fish',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _weightController,
//                   label: 'Weight of Fish',
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildTextField(
//                         controller: _quantityController,
//                         label: 'Quantity of Fish',
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: _buildTextField(
//                         controller: _temperatureController,
//                         label: 'Temperature',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   '|| Attestation',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'I the undersigned inspector hereby certify that the fish has been inspected and found organoleptically wholesome and acceptable for human consumption.',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _inspectorController,
//                   label: 'Name of Inspector',
//                   suffixIcon: Icons.person,
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _designationController,
//                   label: 'Designation',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildTextField(
//                   controller: _signatureController,
//                   label: 'Digital Signature',
//                   suffixIcon: Icons.edit_document,
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     // In FishDetailsScreen, update the ElevatedButton onPressed callback:
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Combine both forms' data
//                         final combinedFormData = {
//                           ...widget.previousFormData,
//                           'species': _speciesController.text,
//                           'weight': _weightController.text,
//                           'quantity': _quantityController.text,
//                           'temperature': _temperatureController.text,
//                           'inspector': _inspectorController.text,
//                           'designation': _designationController.text,
//                         };
//
//                         // Navigate to certificate details
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CertificateDetailsScreen(
//                               formData: combinedFormData,
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
//                       'Submit Inspection',
//                       style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Center(
//                   child: Text(
//                     'AquaTrack logistics',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
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
//   }) {
//     return TextFormField(
//       controller: controller,
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
//     _speciesController.dispose();
//     _weightController.dispose();
//     _quantityController.dispose();
//     _temperatureController.dispose();
//     _inspectorController.dispose();
//     _designationController.dispose();
//     _signatureController.dispose();
//     super.dispose();
//   }
//}

class InspectionScreen2 extends StatefulWidget {
  final Map<String, String> previousFormData;

  const InspectionScreen2({
    super.key,
    required this.previousFormData,
  });

  @override
  State<InspectionScreen2> createState() => _FishDetailsScreenState();
}

class _FishDetailsScreenState extends State<InspectionScreen2> {
  final _formKey = GlobalKey<FormState>();
  final _speciesController = TextEditingController();
  final _weightController = TextEditingController();
  final _quantityController = TextEditingController();
  final _temperatureController = TextEditingController();
  final _inspectorController = TextEditingController();
  final _designationController = TextEditingController();
  final _signatureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Inspection Form'),
        backgroundColor: Colors.blue,
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
                const SizedBox(height: 24),
                const Text(
                  '| Accompanying Certificate',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _speciesController,
                  label: 'Species of Fish',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _weightController,
                  label: 'Weight of Fish',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _quantityController,
                        label: 'Quantity of Fish',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _temperatureController,
                        label: 'Temperature',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  '|| Attestation',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'I the undersigned inspector hereby certify that the fish has been inspected and found organoleptically wholesome and acceptable for human consumption.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _inspectorController,
                  label: 'Name of Inspector',
                  suffixIcon: Icons.person,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _designationController,
                  label: 'Designation',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _signatureController,
                  label: 'Digital Signature',
                  suffixIcon: Icons.edit_document,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final combinedFormData = {
                          ...widget.previousFormData,
                          'species': _speciesController.text,
                          'weight': _weightController.text,
                          'quantity': _quantityController.text,
                          'temperature': _temperatureController.text,
                          'inspector': _inspectorController.text,
                          'designation': _designationController.text,
                        };

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CertificateDetailsScreen(
                              formData: combinedFormData,
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
                      'Submit Inspection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'AquaTrack logistics',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
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
  }) {
    return TextFormField(
      controller: controller,
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
    _speciesController.dispose();
    _weightController.dispose();
    _quantityController.dispose();
    _temperatureController.dispose();
    _inspectorController.dispose();
    _designationController.dispose();
    _signatureController.dispose();
    super.dispose();
  }
}