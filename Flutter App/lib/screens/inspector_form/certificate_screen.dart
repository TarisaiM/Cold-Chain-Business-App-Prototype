// lib/screens/certificate_details_screen.dart
import 'package:flutter/material.dart';

class CertificateDetailsScreen extends StatelessWidget {
  final Map<String, String> formData;

  const CertificateDetailsScreen({
    super.key,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF4A90E2),
      appBar: AppBar(
        title: const Text('Inspection Form'),
        backgroundColor:  Color(0xFF4A90E2),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Date Completed:',
                              style: TextStyle(fontSize: 14),
                            ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
            // Action Buttons
            _buildActionButton('Print Certificate', Icons.print),
            const SizedBox(height: 8),
            _buildActionButton('Email Certificate', Icons.email),
            const SizedBox(height: 8),
            _buildActionButton('Download Certificate', Icons.download),
            const SizedBox(height: 8),
            _buildActionButton('Share', Icons.share),
            const SizedBox(height: 24),
            // Inspection Complete Section
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint('Share the certificate with relevant authorities'),
                _buildBulletPoint('Keep a copy for your records'),
                _buildBulletPoint('Proceed with fish transportation'),
              ],
            ),
            const Spacer(),
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
          // Implement action
        },
      ),
    );
  }

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