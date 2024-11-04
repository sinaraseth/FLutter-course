import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (buttonType) {
      case ButtonType.primary:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        break;
      case ButtonType.secondary:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case ButtonType.disabled:
        backgroundColor = Colors.grey.shade300;
        textColor = Colors.black38;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40), // Fully rounded corners
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 100, vertical: 10), // Adjust padding for pill shape
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left)
            Icon(icon, color: textColor, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
          const SizedBox(width: 8),
          if (iconPosition == IconPosition.right)
            Icon(icon, color: textColor, size: 20),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Custom Button'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              iconPosition: IconPosition.left,
              buttonType: ButtonType.primary,
            ),
            SizedBox(height: 16),
            CustomButton(
              icon: Icons.access_time,
              iconPosition: IconPosition.left,
              buttonType: ButtonType.secondary,
              label: 'Time',
            ),
            SizedBox(height: 16),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              iconPosition: IconPosition.left,
              buttonType: ButtonType.disabled,
            ),
          ],
        ),
      ),
    ),
  ));
}
