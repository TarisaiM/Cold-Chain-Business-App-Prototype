// inspector_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aqua_track/screens/inspector_form/inspection_screen2.dart';

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
