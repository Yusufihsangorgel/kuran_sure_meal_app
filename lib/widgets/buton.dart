import 'package:flutter/material.dart';

class Buton extends StatelessWidget {
  final void Function() onTap;
  final String sureAd;
  const Buton({
    Key? key,
    required this.sureAd,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: Colors.green,
            child: Center(
              child: Text(
                sureAd,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
