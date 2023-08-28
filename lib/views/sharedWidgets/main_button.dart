import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String btnName;
  final Function?
      onPressed; // or make it VoidCallback and put it directl in onPressed
  final bool? hasCircularBorder;
  const MainButton({super.key, required this.btnName, required this.onPressed, this.hasCircularBorder});

  @override
  Widget build(BuildContext context) {
    // or you can create sizedbox with infinte width and specific height 50, and has child of elevatedbutton
    return ElevatedButton(
      onPressed: () => onPressed,
      child: Text(
        btnName,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 4,
          minimumSize: Size(double.infinity, 50),
          backgroundColor: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius:  hasCircularBorder!=null && hasCircularBorder! ? BorderRadius.circular(22): BorderRadius.circular(0) )),
    );
  }
}
