import 'package:flutter/material.dart';

class HoverBox extends StatefulWidget {
  const HoverBox({super.key});

  @override
  State<HoverBox> createState() => _HoverBoxState();
}

class _HoverBoxState extends State<HoverBox> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        width: _isHovered ? 160 : 150,
        height: _isHovered ? 160 : 150,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: const Color(0xFF437592),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(color: Color(0xFFEAD8B1), offset: Offset(4, 6)),
          ],
        ),
      ),
    );
  }
}
