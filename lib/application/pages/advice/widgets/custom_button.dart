import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  const CustomButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ElevatedButton(onPressed: () {}, child: Text(buttonText));
    // InkResponse(
    //   onTap: (){
    //     debugPrint('Button Pressed!');
    //   },
    //   child: Material(
    //     elevation: 16,
    //     borderRadius: BorderRadius.circular(16),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(16),
    //         color: themeData.secondaryHeaderColor
    //       ),
    //     ),
    //   ),
    // );
  }
}
