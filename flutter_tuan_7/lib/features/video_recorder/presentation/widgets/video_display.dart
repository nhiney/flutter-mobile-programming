import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDisplay extends StatelessWidget {
  final VideoPlayerController? controller;

  const VideoDisplay({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return _buildPlaceholder('No video selected.');
    }
    if (!controller!.value.isInitialized) {
      return _buildLoadingState();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(String message) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.videocam_outlined, size: 56, color: Colors.grey),
            const SizedBox(height: 12),
            Text(message, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white70),
            SizedBox(height: 16),
            Text('Preparing video...', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
