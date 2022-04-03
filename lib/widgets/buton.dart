import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuran_sure_meal_app/pages/read/readScreen.dart';

class Buton extends StatefulWidget {
  final void Function() onTap;
  final String sureAd;
  const Buton({
    Key? key,
    required this.sureAd,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Buton> createState() => _ButonState();
}

class _ButonState extends State<Buton> {
  void sureAndGo() async {
    await sureView.getKuran();
    Get.to(ReadScreen());
    /*Timer.periodic(Duration(seconds: 3), (timer) {
      Get.to(ReadScreen());
    });*/
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        sureAndGo();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: Colors.green,
            child: Center(
              child: TextButton(
                onPressed: () {
                  widget.onTap();
                  sureAndGo();
                },
                child: Text(widget.sureAd,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
