import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laser_slides_flutter/colors/Colors.dart';

class RoundedButtonWithLoading extends StatefulWidget {
  final String buttonText;
  final Function(String text) onPressed;
  final Color? color;
  const RoundedButtonWithLoading({
    required this.buttonText,
    required this.onPressed,
    this.color,
  });

  @override
  _RoundedButtonWithLoadingState createState() =>
      _RoundedButtonWithLoadingState();
}

class _RoundedButtonWithLoadingState extends State<RoundedButtonWithLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() async {
    if (!isLoading) {
      _animationController.forward();
      setState(() {
        isLoading = true;
      });

      // Simulate loading process (replace with your actual loading logic)
      await Future.delayed(Duration(seconds: 2));

      _animationController.reverse();
      setState(() {
        isLoading = false;
      });

      // Invoke the callback with the button text
      widget.onPressed(widget.buttonText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return ElevatedButton(
            onPressed: _handleTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorTween(
                begin: widget.color,
                end: lggreen,
              ).animate(_animationController).value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              elevation: 3,
              shadowColor: Colors.black,
            ),
            child: isLoading
                ? const SizedBox(
                    width: 26.0,
                    height: 26.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    widget.buttonText,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
