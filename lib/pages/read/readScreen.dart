import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuran_sure_meal_app/viewmodel/Kuran_view_model.dart';
import 'package:kuran_sure_meal_app/widgets/grid_generator.dart';

final sureView = KuranViewModel();

class ReadScreen extends StatelessWidget {
  ReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return RefreshIndicator(
        onRefresh: () => sureView.getKuran(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[900],
              title: sureView.sureAd == ""
                  ? Text("Kuran Sureleri")
                  : Text(sureView.sureAd),
            ),
            body: sureView.posts.length > 2
                ? RefreshIndicator(
                    onRefresh: () => sureView.getKuran(),
                    child: _buildListView(sureView))
                : _buildSearchView(sureView)),
      );
    });
  }
}

Widget _buildSearchView(KuranViewModel SearchView) {
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

Widget _buildListView(KuranViewModel kuranView) {
  return Observer(
    builder: (_) {
      if (kuranView.isLoading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (kuranView.isError) {
        return Center(
          child: Text(kuranView.errorMessage),
        );
      } else {
        return ListView.builder(
          itemCount: kuranView.posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(kuranView.posts[index].ayetId.toString()),
              subtitle: Text(kuranView.posts[index].suretur),
            );
          },
        );
      }
    },
  );
}
