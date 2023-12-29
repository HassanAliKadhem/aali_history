import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key, required this.image, this.heroTag});
  final Widget image;
  final String? heroTag;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  // https://stackoverflow.com/questions/54536275/flutter-how-to-implement-rotate-and-pan-move-gesture-for-any-container
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _sessionOffset = Offset.zero;

  double _scale = 1.0;
  double _initialScale = 1.0;

  final Duration _duration = const Duration(milliseconds: 300);
  Duration _currentDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
          ),
          FittedBox(
            child: GestureDetector(
              onScaleStart: (details) {
                _currentDuration = Duration.zero;
                _initialFocalPoint = details.focalPoint;
                _initialScale = _scale;
              },
              onScaleUpdate: (details) {
                setState(() {
                  _sessionOffset = details.focalPoint - _initialFocalPoint;
                  _scale = _initialScale * details.scale;
                });
              },
              onScaleEnd: (details) {
                setState(() {
                  _currentDuration = _duration;
                  _offset += _sessionOffset;
                  if (_offset.distance >
                      MediaQuery.sizeOf(context).shortestSide / 2.5) {
                    Navigator.pop(context);
                  }
                  _sessionOffset = Offset.zero;
                  _scale = 1.0;
                  _offset = Offset.zero;
                });
              },
              onDoubleTapDown: (details) {
                setState(() {
                  if (_scale != 1.0) {
                    _scale = 1.0;
                  } else {
                    _scale = 2.0;
                  }
                });
              },
              child: TweenAnimationBuilder(
                  tween: Tween<Offset>(
                      begin: Offset.zero, end: _offset + _sessionOffset),
                  duration: _currentDuration,
                  curve: Curves.easeOut,
                  child: AnimatedScale(
                    duration: _currentDuration,
                    scale: _scale,
                    curve: Curves.easeOut,
                    filterQuality: FilterQuality.high,
                    child: Hero(tag: widget.heroTag ?? "", child: widget.image),
                  ),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: value,
                      child: child,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
