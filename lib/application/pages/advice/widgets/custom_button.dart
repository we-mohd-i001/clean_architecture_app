import 'dart:ffi';

import 'package:clean_architecture_app/application/pages/advice/bloc/adviser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const CustomButton({super.key, required this.buttonText, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ElevatedButton(
      style: const ButtonStyle(elevation: MaterialStatePropertyAll(12.0)),
        onPressed: onTap?.call(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            buttonText,
            style: themeData.textTheme.titleLarge,
          ),
        ));
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
