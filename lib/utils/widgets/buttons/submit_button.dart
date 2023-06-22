import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
   SubmitButton({
    Key? key,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child:  Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff53B175),
        onPrimary: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        minimumSize: const Size(364, 67), //////// HERE
      ),
    );
  }
}

