import 'package:flutter/material.dart';
import 'package:walkytalky/components/CustomLoader.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color fontColor;
  final FontWeight fontWeight;
  final double size;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColour;
  final bool isActive;
  final Function() onTap;
  final double? Width;

  const CustomButton({
    super.key,
    required this.Width,
    required this.text,
    required this.onTap,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.w600,
    required this.backgroundColour,
    this.size = 18,
    this.padding = const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
    this.margin = const EdgeInsets.all(8),
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
                      return  Container(
                        child: GestureDetector(
                                  onTap: onTap,
                                  child: Container(
                                  width: Width,
                                  padding: padding,
                                  margin:margin,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: backgroundColour,  
                                  ),
                          child: Center(child:isActive ?  Customloader(size: size) :  Text(text, style: TextStyle( color: fontColor, fontWeight: fontWeight, fontSize: size ))))),
                      );
                              
  }
}

