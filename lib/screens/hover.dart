import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const Hover({super.key, required this.child, this.onTap});

  @override
  State<Hover> createState() => _HoverState();
}

class _HoverState extends State<Hover> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          width: _isHovered ? 190 : 180,
          height: _isHovered ? 50 : 40,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF1B3B51), Color(0xFF3a6d8c)],
            ),
            border: Border.all(color: Color(0xFF3a6d8c), width: 2),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Color(0xFFEAD8B1), offset: Offset(2, 2)),
            ],
          ),
          child: Center(
            child: AnimatedScale(
              scale: _isHovered ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
