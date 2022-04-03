import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kuran_sure_meal_app/pages/read/readScreen.dart';
import 'package:kuran_sure_meal_app/viewmodel/Kuran_view_model.dart';
import 'package:kuran_sure_meal_app/widgets/grid_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text("Sureler"),
      ),
      body: _buildSearchView(sureView),
    );
  }
}

Widget _buildSearchView(KuranViewModel kuranView) {
  return GridView.builder(
    itemCount: GridGenerator.buttons.length,
    itemBuilder: (context, index) {
      return Observer(
        builder: (_) {
          return GridGenerator.buttons[index];
        },
      );
    },
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
  );
}
