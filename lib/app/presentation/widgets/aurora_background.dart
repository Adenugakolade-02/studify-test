import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:studify/core/theme/color.dart';

class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with TickerProviderStateMixin {

  late AnimationController _controller1, _controller2, _controller3, _controller4;
  late Animation<Alignment> _animation1, _animation2, _animation3, _animation4;


  static  Color yellowColor = Color(0xFFF0C808).withValues(alpha: .9);
  static  Color cyanColor = Color(0xFF1AC8ED).withValues(alpha: .9);
  static Color purpleColor = Color(0xFF5B3FFF).withValues(alpha: .9);
  static  Color redColor = Color(0xFFDD1C1A).withValues(alpha: .9);

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _controller2 = AnimationController(vsync: this, duration: const Duration(seconds: 25));
    _controller3 = AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _controller4 = AnimationController(vsync: this, duration: const Duration(seconds: 15)); // New controller

    _animation1 = AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight)
        .animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut));
    _animation2 = AlignmentTween(begin: Alignment.topRight, end: Alignment.bottomLeft)
        .animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));
    _animation3 = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topCenter)
        .animate(CurvedAnimation(parent: _controller3, curve: Curves.easeInOut));
    _animation4 = AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topLeft)
        .animate(CurvedAnimation(parent: _controller4, curve: Curves.easeInOut));

    _controller1.repeat(reverse: true);
    _controller2.repeat(reverse: true);
    _controller3.repeat(reverse: true);
    _controller4.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller1,
          builder: (context, child) => Align(
            alignment: _animation1.value,
            child: Container(width: 300, height: 300, decoration:  BoxDecoration(color: yellowColor, shape: BoxShape.circle)),
          ),
        ),
        AnimatedBuilder(
          animation: _controller2,
          builder: (context, child) => Align(
            alignment: _animation2.value,
            child: Container(width: 400, height: 400, decoration:  BoxDecoration(color: cyanColor, shape: BoxShape.circle)),
          ),
        ),
        AnimatedBuilder(
          animation: _controller3,
          builder: (context, child) => Align(
            alignment: _animation3.value,
            child: Container(width: 350, height: 350, decoration:  BoxDecoration(color: purpleColor, shape: BoxShape.circle)),
          ),
        ),

        AnimatedBuilder(
          animation: _controller4,
          builder: (context, child) => Align(
            alignment: _animation4.value,
            child: Container(width: 250, height: 250, decoration:  BoxDecoration(color: redColor, shape: BoxShape.circle)),
          ),
        ),

        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 320.0, sigmaY: 320.0),
          child: Container(color: AppColors.whiteBackground.withValues(alpha:.7)),
        ),
      ],
    );
  }
}