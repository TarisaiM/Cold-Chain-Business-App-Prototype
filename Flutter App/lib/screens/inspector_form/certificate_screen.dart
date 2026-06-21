// lib/screens/certificate_details_screen.dart
import 'package:flutter/material.dart';
/// Screen that displays inspection certificate details
/// and provides actions like printing, sharing, and downloading.
class CertificateDetailsScreen extends StatelessWidget {
  /// Form data passed from previous screen (inspector, landing site, etc.)
  final Map<String, String> formData;
  
  const CertificateDetailsScreen({
    super.key,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main background color of the screen
      backgroundColor: const Color(0xFF4A90E2),

      appBar: AppBar(
        title: const Text('Inspection Form'),
        backgroundColor: const Color(0xFF4A90E2),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [

            // Certificate Details Card
            Card(
              color: Colors.grey[300],

              child: Padding(
                padding: const EdgeInsets.all(16.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section header with icon
                    const Row(
                      children: [
                        Icon(Icons.article_outlined, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Certificate Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    
                    // Certificate number + date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Certificate ID section
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Certificate Number:',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              'FHI-GHN-ZYX',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        // Completion date section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Date Completed:',
                              style: TextStyle(fontSize: 14),
                            ),
                            // Displays current timestamp (formatted manually)
                            Text(
                              DateTime.now().toString().substring(0, 16),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    
                    // Inspector + Landing site
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Inspector information
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Inspector:',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              formData['inspector'] ?? 'John Doe',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Landing site information
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Landing Site:',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              formData['landingSite'] ?? 'Victoria Landing 3',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Action buttons section
            _buildActionButton('Print Certificate', Icons.print),
            const SizedBox(height: 8),
            _buildActionButton('Email Certificate', Icons.email),
            const SizedBox(height: 8),
            _buildActionButton('Download Certificate', Icons.download),
            const SizedBox(height: 8),
            _buildActionButton('Share', Icons.share),

            const SizedBox(height: 24),
            // Inspection completion status
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Inspection Complete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),

            const SizedBox(height: 16),
            // Post-inspection instructions
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(
                  'Share the certificate with relevant authorities',
                ),
                _buildBulletPoint('Keep a copy for your records'),
                _buildBulletPoint('Proceed with fish transportation'),
              ],
            ),

            const Spacer(),
            // Footer branding
            const Text(
              'AquaTrack Logistics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// Builds a reusable action button used for certificate actions
  static Widget _buildActionButton(String label, IconData icon) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(icon),

        onTap: () {
          // TODO: Implement certificate action (print, share, email, etc.)
        },
      ),
    );
  }
  /// Builds a bullet point item for instructions list
  static Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 4),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          // Instruction text
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
