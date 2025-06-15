import 'package:flutter/material.dart';

class GlowButton extends StatefulWidget {
  final VoidCallback onPressed;
  const GlowButton({super.key, required this.onPressed});

  @override
  State<GlowButton> createState() => _GlowButtonState();
}

class _GlowButtonState extends State<GlowButton> {
  bool perubahan = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color startColor = perubahan ? Colors.cyan : Colors.purple;
    final Color endColor = perubahan ? Colors.purple : Colors.cyan;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          setState(() {
            perubahan = !perubahan;
          });
          widget.onPressed(); // Memanggil fungsi dari luar
        },
        child: TweenAnimationBuilder<Color?>(
          tween: ColorTween(begin: startColor, end: endColor),
          duration: const Duration(milliseconds: 400),
          builder: (context, animatedColor, child) {
            final Color topColor = perubahan ? animatedColor! : startColor;
            final Color bottomColor = perubahan ? startColor : animatedColor!;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 425,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black, width: 1.2),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [topColor, Colors.black, bottomColor],
                  stops: const [0.0, 0.5, 1.0],
                ),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: topColor.withOpacity(0.6),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, -4),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                        BoxShadow(
                          color: bottomColor.withOpacity(0.6),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: const Center(
                child: Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
