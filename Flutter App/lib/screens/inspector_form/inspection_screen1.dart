// inspector_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aqua_track/screens/inspector_form/inspection_screen2.dart';
/// First step of the inspection form.
/// Collects basic inspection and transport details before proceeding.
class InspectorScreen extends StatefulWidget {
  const InspectorScreen({super.key});
  @override
  State<InspectorScreen> createState() => _InspectorScreenState();
}
class _InspectorScreenState extends State<InspectorScreen> {
  // Global form key used for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for form input fields
  final _dateController = TextEditingController();
  final _supplierController = TextEditingController();
  final _boatRegController = TextEditingController();
  final _districtController = TextEditingController();
  final _landingSiteController = TextEditingController();
  final _truckRegController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screen background
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

                // Header section
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
                
                // Date field (with date picker)
                _buildTextField(
                  controller: _dateController,
                  label: 'DD / MM / YYYY',
                  suffixIcon: Icons.calendar_today,

                  onTap: () async {
                    // Opens date picker dialog
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                    );

                    // Format selected date
                    if (date != null) {
                      _dateController.text =
                          DateFormat('dd/MM/yyyy').format(date);
                    }
                  },
                ),

                const SizedBox(height: 16),

                // Supplier name input
                _buildTextField(
                  controller: _supplierController,
                  label: 'Name of Supplier',
                  suffixIcon: Icons.business,
                ),

                const SizedBox(height: 16),

                // Boat registration input
                _buildTextField(
                  controller: _boatRegController,
                  label: 'Boat Registration Number',
                ),

                const SizedBox(height: 24),

                // =========================
                // Second section header
                // =========================
                const Text(
                  'Accompanying Certificate',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 20),

                // District input
                _buildTextField(
                  controller: _districtController,
                  label: 'District Name',
                ),

                const SizedBox(height: 16),

                // Landing site input
                _buildTextField(
                  controller: _landingSiteController,
                  label: 'Landing Site Name',
                ),

                const SizedBox(height: 16),

                // Truck registration input
                _buildTextField(
                  controller: _truckRegController,
                  label: 'Truck Registration Number',
                  suffixIcon: Icons.local_shipping,
                ),

                const SizedBox(height: 24),

                // Navigation button
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      // Validate form before proceeding
                      if (_formKey.currentState!.validate()) {
                        // Collect form values into a map
                        final formData = {
                          'date': _dateController.text,
                          'supplier': _supplierController.text,
                          'boatRegistration': _boatRegController.text,
                          'district': _districtController.text,
                          'landingSite': _landingSiteController.text,
                          'truckRegistration': _truckRegController.text,
                        };

                        // Navigate to next inspection screen
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

  /// Reusable text field builder used across the form
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? suffixIcon,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,

      // If onTap is provided (e.g. date picker), make field read-only
      onTap: onTap,
      readOnly: onTap != null,

      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),

        // Optional suffix icon
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.grey) : null,

        // Border styles
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

      // Basic validation: field must not be empty
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
    // Clean up controllers to prevent memory leaks
    _dateController.dispose();
    _supplierController.dispose();
    _boatRegController.dispose();
    _districtController.dispose();
    _landingSiteController.dispose();
    _truckRegController.dispose();

    super.dispose();
  }
}
