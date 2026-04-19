import 'package:flutter/material.dart';

class AudioControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onStop;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const AudioControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onStop,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(
          context,
          icon: Icons.skip_previous,
          onPressed: onPrevious,
        ),
        const SizedBox(width: 8),
        _buildIconButton(
          context,
          icon: isPlaying ? Icons.pause : Icons.play_arrow,
          onPressed: onPlayPause,
          isPrimary: true,
        ),
        const SizedBox(width: 8),
        _buildIconButton(
          context,
          icon: Icons.stop,
          onPressed: onStop,
        ),
        const SizedBox(width: 8),
        _buildIconButton(
          context,
          icon: Icons.skip_next,
          onPressed: onNext,
        ),
      ],
    );
  }

  Widget _buildIconButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isPrimary ? Colors.purple[700] : Colors.purple[50],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        iconSize: isPrimary ? 32 : 28,
        icon: Icon(icon),
        color: isPrimary ? Colors.white : Colors.purple[700],
        onPressed: onPressed,
      ),
    );
  }
}
