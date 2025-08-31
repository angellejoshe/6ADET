import 'package:flutter/material.dart';

// Custom widget to create an interactive box with hover animations
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
  // Track hover state for animations
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Handle mouse enter and exit events for hover effect
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        // Animate size changes based on hover state
        width: _isHovered ? 160 : 150,
        height: _isHovered ? 160 : 150,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        // Box styling with custom colors and shadow
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
            // Main background image
            Image.asset(widget.imagePath, fit: BoxFit.cover),

            // Optional overlay layer
            if (widget.overlay)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x87437592),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            
            // Optional lock image that scales with hover
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

