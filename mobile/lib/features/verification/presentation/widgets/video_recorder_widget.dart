// C:\Users\Ahmed\Desktop\sahbifit\mobile\lib\features\verification\presentation\widgets\video_recorder_widget.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:video_player/video_player.dart';

class VideoRecorderWidget extends StatefulWidget {
  final Function(File videoFile) onVideoRecorded;

  const VideoRecorderWidget({
    super.key,
    required this.onVideoRecorded,
  });

  @override
  State<VideoRecorderWidget> createState() => _VideoRecorderWidgetState();
}

class _VideoRecorderWidgetState extends State<VideoRecorderWidget> {
  CameraController? _controller;
  VideoPlayerController? _videoPlayerController;
  bool _isInitialized = false;
  bool _isRecording = false;
  String? _videoPath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      // Find the front camera
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _controller = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: true,
      );

      await _controller!.initialize();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print("Error initializing camera: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to initialize camera.')),
        );
      }
    }
  }

  Future<void> _toggleRecording() async {
    if (!_isInitialized || _controller == null) return;

    if (_isRecording) {
      // Stop recording
      try {
        final file = await _controller!.stopVideoRecording();
        setState(() {
          _isRecording = false;
          _videoPath = file.path;
        });
        _initializeVideoPlayer();
      } catch (e) {
        print("Error stopping video: $e");
      }
    } else {
      // Start recording
      try {
        await _controller!.startVideoRecording();
        setState(() {
          _isRecording = true;
        });
      } catch (e) {
        print("Error starting video: $e");
      }
    }
  }

  Future<void> _initializeVideoPlayer() async {
    if (_videoPath == null) return;
    _videoPlayerController = VideoPlayerController.file(File(_videoPath!));
    await _videoPlayerController!.initialize();
    await _videoPlayerController!.setLooping(true);
    await _videoPlayerController!.play();
    setState(() {});
  }

  void _reset() {
    _videoPlayerController?.dispose();
    setState(() {
      _videoPath = null;
      _videoPlayerController = null;
      _isRecording = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPath != null && _videoPlayerController != null) {
      return _buildPreview();
    }

    if (!_isInitialized || _controller == null) {
      return const AspectRatio(
        aspectRatio: 9 / 16,
        child: LoadingIndicator(message: 'Loading camera...'),
      );
    }

    return _buildRecorder();
  }

  Widget _buildRecorder() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: CameraPreview(_controller!),
          ),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: _toggleRecording,
          backgroundColor: AppTheme.primaryRed,
          child: Icon(
            _isRecording ? Icons.stop_rounded : Icons.videocam_rounded,
            color: AppTheme.cleanWhite,
          ),
        ),
      ],
    );
  }

  Widget _buildPreview() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: _videoPlayerController!.value.isInitialized
                ? VideoPlayer(_videoPlayerController!)
                : const LoadingIndicator(message: 'Loading preview...'),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                text: 'Retake',
                onPressed: _reset,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: PrimaryButton(
                text: 'Submit',
                onPressed: () {
                  widget.onVideoRecorded(File(_videoPath!));
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
