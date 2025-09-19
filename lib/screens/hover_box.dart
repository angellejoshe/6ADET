import 'package:flutter/material.dart';

class HoverBox extends StatefulWidget {
  final String imagePath;

  const HoverBox({super.key, required this.imagePath});

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
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xFF1B3B51), Color(0xFF3a6d8c)],
          ),
          border: Border.all(color: Color(0xFF3a6d8c), width: 2),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(color: Color(0xFFEAD8B1), offset: Offset(4, 6)),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [Image.asset(widget.imagePath, fit: BoxFit.cover)],
        ),
      ),
    );
  }
}
