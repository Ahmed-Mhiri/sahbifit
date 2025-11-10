import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../../../../../shared_widgets/primary_button.dart';

class VideoRecorderWidget extends StatefulWidget {
  final Function(String) onVideoRecorded;

  const VideoRecorderWidget({super.key, required this.onVideoRecorded});

  @override
  State<VideoRecorderWidget> createState() => _VideoRecorderWidgetState();
}

class _VideoRecorderWidgetState extends State<VideoRecorderWidget> {
  CameraController? _controller;
  bool _isRecording = false;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    await _controller!.initialize();
    setState(() {
      _isCameraReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
          ),
          child: _isCameraReady && _controller != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CameraPreview(_controller!),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
        const SizedBox(height: 24),
        Text(
          'Verification Video',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Please record a 5-second video saying: '
          '"Hi, I\'m [Your Name]. Today is [Date]." '
          'Then turn your head left and right.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        if (!_isRecording)
          PrimaryButton(
            text: 'Start Recording',
            onPressed: _startRecording,
            icon: Icons.videocam,
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.radio_button_checked, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                'Recording...',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        const SizedBox(height: 16),
        if (_isRecording)
          PrimaryButton(
            text: 'Stop Recording',
            onPressed: _stopRecording,
            backgroundColor: Colors.red,
          ),
      ],
    );
  }

  Future<void> _startRecording() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      await _controller!.startVideoRecording();
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to start recording: $e')),
      );
    }
  }

  Future<void> _stopRecording() async {
    if (_controller == null || !_isRecording) {
      return;
    }

    try {
      final videoFile = await _controller!.stopVideoRecording();
      setState(() {
        _isRecording = false;
      });
      widget.onVideoRecorded(videoFile.path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to stop recording: $e')),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}