import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final VoidCallback onPickGallery;
  final VoidCallback onRecordCamera;

  const ControlButtons({
    super.key,
    required this.onPickGallery,
    required this.onRecordCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(
          context,
          label: 'Pick Video from Gallery',
          icon: Icons.video_library_outlined,
          onPressed: onPickGallery,
        ),
        const SizedBox(height: 12),
        _buildButton(
          context,
          label: 'Record Video from Camera',
          icon: Icons.videocam_outlined,
          onPressed: onRecordCamera,
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF3E5F5),
          foregroundColor: Colors.purple[700],
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.purple[100]!),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
