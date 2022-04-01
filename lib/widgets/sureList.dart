import 'package:flutter/material.dart';

class SureList extends StatelessWidget {
  const SureList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* Text(
          meaningViewModel.word,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),*/
        ListView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            //  itemCount: sureViewModel.sureler.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                  ));
            }),
      ],
    );
  }
}
