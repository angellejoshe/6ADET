import 'package:flutter/material.dart';

class HoverBox extends StatefulWidget {
  final String imagePath;
  final String? imageLock;
  final bool overlay;

  const HoverBox({
    super.key,
    required this.imagePath,
    this.imageLock,
    this.overlay = false,
  });

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(widget.imagePath, fit: BoxFit.cover),

            if (widget.overlay)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x87437592),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

            if (widget.imageLock != null)
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  widget.imageLock!,
                  width: _isHovered ? 150 : 130,
                  height: _isHovered ? 150 : 130,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
