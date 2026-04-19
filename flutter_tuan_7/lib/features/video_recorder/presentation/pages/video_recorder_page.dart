import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import '../widgets/video_display.dart';
import '../widgets/control_buttons.dart';
import '../../../../core/config/app_config.dart';

class VideoRecorderPage extends StatefulWidget {
  const VideoRecorderPage({super.key});

  @override
  State<VideoRecorderPage> createState() => _VideoRecorderPageState();
}

class _VideoRecorderPageState extends State<VideoRecorderPage> {
  VideoPlayerController? _videoController;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadSampleVideo();
  }

  void _loadSampleVideo() {
    final sampleUrl = AppConfig.instance.get<String>(
      'video_recorder.sample_video_url',
      '',
    );
    if (sampleUrl.isEmpty) return;

    _videoController = VideoPlayerController.networkUrl(Uri.parse(sampleUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _videoController?.setLooping(true);
          _videoController?.play();
        }
      }).catchError((error) {
        debugPrint('Error loading sample video: $error');
      });
  }

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isDenied) {
      await permission.request();
    }
  }

  Future<void> _pickVideoFromGallery() async {
    await _requestPermission(Permission.photos);
    final XFile? picked = await _picker.pickVideo(source: ImageSource.gallery);
    if (picked != null) {
      _loadFromFile(File(picked.path));
    }
  }

  Future<void> _recordVideoFromCamera() async {
    await _requestPermission(Permission.camera);
    await _requestPermission(Permission.microphone);
    final XFile? recorded = await _picker.pickVideo(source: ImageSource.camera);
    if (recorded != null) {
      _loadFromFile(File(recorded.path));
    }
  }

  void _loadFromFile(File videoFile) {
    _videoController?.dispose();
    _videoController = VideoPlayerController.file(videoFile)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _videoController!.play();
        }
      });
    setState(() {});
  }

  void _togglePlayPause() {
    final ctrl = _videoController;
    if (ctrl == null || !ctrl.value.isInitialized) return;
    setState(() {
      ctrl.value.isPlaying ? ctrl.pause() : ctrl.play();
    });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Video Recorder & Playback'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            VideoDisplay(controller: _videoController),
            const SizedBox(height: 16),
            if (_videoController != null && _videoController!.value.isInitialized)
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3E5F5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    iconSize: 32,
                    color: Colors.purple[700],
                    icon: Icon(
                      _videoController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                ),
              ),
            const SizedBox(height: 32),
            ControlButtons(
              onPickGallery: _pickVideoFromGallery,
              onRecordCamera: _recordVideoFromCamera,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
