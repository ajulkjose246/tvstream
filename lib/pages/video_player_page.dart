import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class VideoPlayerPage extends StatefulWidget {
  final String title;
  final String videoUrl;

  const VideoPlayerPage({
    super.key,
    required this.title,
    required this.videoUrl,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _hasError = false;
  // Auto-hide controls
  bool _showControls = true;
  Timer? _controlsTimer;
  // Focus nodes for remote/keyboard navigation
  final FocusNode _rewindFocusNode = FocusNode();
  final FocusNode _playPauseFocusNode = FocusNode();
  final FocusNode _forwardFocusNode = FocusNode();
  final FocusNode _sliderFocusNode = FocusNode();
  final FocusNode _rootFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    // Always set immersive mode for fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _startHideControlsTimer();
  }

  void _startHideControlsTimer() {
    _controlsTimer?.cancel();
    _controlsTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _onUserInteraction() {
    setState(() {
      _showControls = true;
    });
    _startHideControlsTimer();
  }

  void _initializeVideoPlayer() async {
    try {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      );

      await _controller!.initialize();
      _controller!.addListener(_videoListener);

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _duration = _controller!.value.duration;
        });
        // Auto-play the video
        _controller!.play();
      }
    } catch (e) {
      print('Error initializing video player: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
        _showErrorDialog();
      }
    }
  }

  void _videoListener() {
    if (mounted && _controller != null) {
      setState(() {
        _position = _controller!.value.position;
        _isPlaying = _controller!.value.isPlaying;
      });
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text(
          'Failed to load video. Please check your internet connection and try again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _togglePlayPause() {
    if (_controller != null && _isInitialized) {
      if (_isPlaying) {
        _controller!.pause();
      } else {
        _controller!.play();
      }
    }
  }

  void _seekTo(Duration position) {
    if (_controller != null && _isInitialized) {
      _controller!.seekTo(position);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return duration.inHours > 0
        ? '$hours:$minutes:$seconds'
        : '$minutes:$seconds';
  }

  @override
  void dispose() {
    _controller?.removeListener(_videoListener);
    _controller?.dispose();
    _controlsTimer?.cancel();
    _rewindFocusNode.dispose();
    _playPauseFocusNode.dispose();
    _forwardFocusNode.dispose();
    _sliderFocusNode.dispose();
    _rootFocusNode.dispose();
    // Restore overlays and orientation
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _hasError
          ? Center(child: _buildErrorWidget())
          : _isInitialized && _controller != null
          ? Focus(
              focusNode: _rootFocusNode,
              autofocus: true,
              onKey: (node, event) {
                if (event is RawKeyDownEvent) {
                  if (!_showControls) {
                    setState(() {
                      _showControls = true;
                    });
                    _startHideControlsTimer();
                    // Focus play/pause button
                    _playPauseFocusNode.requestFocus();
                    return KeyEventResult.handled;
                  }
                }
                return KeyEventResult.ignored;
              },
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _onUserInteraction,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          width: _controller!.value.size.width,
                          height: _controller!.value.size.height,
                          child: VideoPlayer(_controller!),
                        ),
                      ),
                    ),
                    if (_showControls) ...[
                      // Controls overlay with Focus
                      Positioned(
                        bottom: 32,
                        left: 0,
                        right: 0,
                        child: FocusTraversalGroup(
                          policy: ReadingOrderTraversalPolicy(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Focus(
                                focusNode: _rewindFocusNode,
                                onKey: (node, event) {
                                  if (event is RawKeyDownEvent) {
                                    if (event.logicalKey ==
                                            LogicalKeyboardKey.enter ||
                                        event.logicalKey ==
                                            LogicalKeyboardKey.select) {
                                      _onUserInteraction();
                                      final newPosition =
                                          _position -
                                          const Duration(seconds: 10);
                                      _seekTo(
                                        newPosition.isNegative
                                            ? Duration.zero
                                            : newPosition,
                                      );
                                      return KeyEventResult.handled;
                                    }
                                    if (event.logicalKey ==
                                        LogicalKeyboardKey.arrowRight) {
                                      _playPauseFocusNode.requestFocus();
                                      return KeyEventResult.handled;
                                    }
                                  }
                                  return KeyEventResult.ignored;
                                },
                                child: Builder(
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: Focus.of(context).hasFocus
                                          ? Colors.white24
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Focus.of(context).hasFocus
                                          ? Border.all(
                                              color: Colors.red,
                                              width: 3,
                                            )
                                          : null,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        _onUserInteraction();
                                        final newPosition =
                                            _position -
                                            const Duration(seconds: 10);
                                        _seekTo(
                                          newPosition.isNegative
                                              ? Duration.zero
                                              : newPosition,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.replay_10,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Focus(
                                focusNode: _playPauseFocusNode,
                                onKey: (node, event) {
                                  if (event is RawKeyDownEvent) {
                                    if (event.logicalKey ==
                                            LogicalKeyboardKey.enter ||
                                        event.logicalKey ==
                                            LogicalKeyboardKey.select) {
                                      _onUserInteraction();
                                      _togglePlayPause();
                                      return KeyEventResult.handled;
                                    }
                                    if (event.logicalKey ==
                                        LogicalKeyboardKey.arrowLeft) {
                                      _rewindFocusNode.requestFocus();
                                      return KeyEventResult.handled;
                                    }
                                    if (event.logicalKey ==
                                        LogicalKeyboardKey.arrowRight) {
                                      _forwardFocusNode.requestFocus();
                                      return KeyEventResult.handled;
                                    }
                                  }
                                  return KeyEventResult.ignored;
                                },
                                child: Builder(
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: Focus.of(context).hasFocus
                                          ? Colors.white24
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Focus.of(context).hasFocus
                                          ? Border.all(
                                              color: Colors.red,
                                              width: 3,
                                            )
                                          : null,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        _onUserInteraction();
                                        _togglePlayPause();
                                      },
                                      icon: Icon(
                                        _isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Focus(
                                focusNode: _forwardFocusNode,
                                onKey: (node, event) {
                                  if (event is RawKeyDownEvent) {
                                    if (event.logicalKey ==
                                            LogicalKeyboardKey.enter ||
                                        event.logicalKey ==
                                            LogicalKeyboardKey.select) {
                                      _onUserInteraction();
                                      final newPosition =
                                          _position +
                                          const Duration(seconds: 10);
                                      _seekTo(
                                        newPosition > _duration
                                            ? _duration
                                            : newPosition,
                                      );
                                      return KeyEventResult.handled;
                                    }
                                    if (event.logicalKey ==
                                        LogicalKeyboardKey.arrowLeft) {
                                      _playPauseFocusNode.requestFocus();
                                      return KeyEventResult.handled;
                                    }
                                    if (event.logicalKey ==
                                        LogicalKeyboardKey.arrowRight) {
                                      _sliderFocusNode.requestFocus();
                                      return KeyEventResult.handled;
                                    }
                                  }
                                  return KeyEventResult.ignored;
                                },
                                child: Builder(
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: Focus.of(context).hasFocus
                                          ? Colors.white24
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Focus.of(context).hasFocus
                                          ? Border.all(
                                              color: Colors.red,
                                              width: 3,
                                            )
                                          : null,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        _onUserInteraction();
                                        final newPosition =
                                            _position +
                                            const Duration(seconds: 10);
                                        _seekTo(
                                          newPosition > _duration
                                              ? _duration
                                              : newPosition,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.forward_10,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Progress bar with focus
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Focus(
                          focusNode: _sliderFocusNode,
                          onKey: (node, event) {
                            if (event is RawKeyDownEvent) {
                              if (event.logicalKey ==
                                  LogicalKeyboardKey.arrowLeft) {
                                final newPosition =
                                    _position - const Duration(seconds: 5);
                                _seekTo(
                                  newPosition.isNegative
                                      ? Duration.zero
                                      : newPosition,
                                );
                                _onUserInteraction();
                                return KeyEventResult.handled;
                              }
                              if (event.logicalKey ==
                                  LogicalKeyboardKey.arrowRight) {
                                final newPosition =
                                    _position + const Duration(seconds: 5);
                                _seekTo(
                                  newPosition > _duration
                                      ? _duration
                                      : newPosition,
                                );
                                _onUserInteraction();
                                return KeyEventResult.handled;
                              }
                              if (event.logicalKey ==
                                  LogicalKeyboardKey.arrowUp) {
                                final newPosition =
                                    _position + const Duration(seconds: 10);
                                _seekTo(
                                  newPosition > _duration
                                      ? _duration
                                      : newPosition,
                                );
                                _onUserInteraction();
                                return KeyEventResult.handled;
                              }
                              if (event.logicalKey ==
                                  LogicalKeyboardKey.arrowDown) {
                                final newPosition =
                                    _position - const Duration(seconds: 10);
                                _seekTo(
                                  newPosition.isNegative
                                      ? Duration.zero
                                      : newPosition,
                                );
                                _onUserInteraction();
                                return KeyEventResult.handled;
                              }
                              if (event.logicalKey ==
                                  LogicalKeyboardKey.arrowLeft) {
                                _forwardFocusNode.requestFocus();
                                return KeyEventResult.handled;
                              }
                            }
                            return KeyEventResult.ignored;
                          },
                          child: Builder(
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                border: Focus.of(context).hasFocus
                                    ? Border.all(color: Colors.red, width: 3)
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Slider(
                                value: _position.inMilliseconds.toDouble(),
                                min: 0,
                                max: _duration.inMilliseconds.toDouble(),
                                onChanged: (value) {
                                  _onUserInteraction();
                                  _seekTo(
                                    Duration(milliseconds: value.toInt()),
                                  );
                                },
                                activeColor: Colors.red,
                                inactiveColor: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            )
          : Center(child: _buildLoadingWidget()),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(height: 16),
          Text(
            'Loading video...',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.white, size: 64),
          SizedBox(height: 16),
          Text(
            'Failed to load video',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
