import 'package:flutter/material.dart';
import 'package:walkytalky/components/CustomButton.dart';

class CustomPermissionScreen extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Function() onTap;
  final Color buttonColor;

  CustomPermissionScreen({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.onTap,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl, 
            fit: BoxFit.cover,
            height: 96,
            
          ),

          CustomButton(text: text, onTap: onTap, backgroundColour: buttonColor , Width: double.infinity,)
        ],
      ),
    );
  }
}
