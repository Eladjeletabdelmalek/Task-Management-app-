import 'dart:ui';

import 'package:flutter/material.dart';

class AmbientBackground extends StatelessWidget {
  final Widget child;

  const AmbientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: Colors.white),

        // Top-left mint green blur
        Positioned(
          top: -50,
          left: -60,
          child: _blob(color: const Color(0xFFA9EBC4), size: 220),
        ),

        // Top-right pale yellow blur
        Positioned(
          top: -40,
          right: -70,
          child: _blob(color: const Color(0xFFFDEBB0), size: 240),
        ),

        // Bottom-left warm orange/yellow blur
        Positioned(
          bottom: 60,
          left: -70,
          child: _blob(color: const Color(0xFFFFDDA8), size: 220),
        ),

        // Bottom-right soft blue blur
        Positioned(
          bottom: -80,
          right: -60,
          child: _blob(color: const Color(0xFFB4DCF7), size: 260),
        ),

        // Small scattered accent dots (kept crisp, slightly softened)
        Positioned(top: 90, right: 60, child: _Dot(color: const Color(0xFF5CC8F2).withValues(alpha: 0.7), size: 10)),
        Positioned(top: 130, left: 50, child: _Dot(color: const Color(0xFFB79CF2).withValues(alpha: 0.7), size: 6)),
        Positioned(bottom: 260, right: 30, child: _Dot(color: const Color(0xFF8CE3B0).withValues(alpha: 0.7), size: 8)),
        Positioned(bottom: 220, left: 70, child: _Dot(color: const Color(0xFFF285A8).withValues(alpha: 0.7), size: 8)),
        Positioned(bottom: 190, left: 130, child: _Dot(color: const Color(0xFF5CC8F2).withValues(alpha: 0.7), size: 6)),
        Positioned(bottom: 160, right: 90, child: _Dot(color: const Color(0xFFFFD93D).withValues(alpha: 0.7), size: 8)),

        child,
      ],
    );
  }

  Widget _blob({required Color color, required double size}) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 55, sigmaY: 55),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}