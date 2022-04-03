import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuran_sure_meal_app/viewmodel/Kuran_view_model.dart';
import 'package:kuran_sure_meal_app/widgets/grid_generator.dart';

final sureView = KuranViewModel();

class ReadScreen extends StatefulWidget {
  ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  @override
  void initState() {
    sureView.getKuran();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //sureView.getKuran();
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
              body: sureView.sureAd == ""
                  ? Center(
                      child: Text(
                      "Lütfen bir sure seçiniz",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
                  : RefreshIndicator(
                      onRefresh: () => sureView.getKuran(),
                      child: _buildListView(sureView))));
    });
  }
}

Widget _buildListView(KuranViewModel kuranView) {
  return Observer(
    builder: (_) {
      if (kuranView.isLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (kuranView.isError) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(kuranView.errorMessage),
            ),
            ElevatedButton(
              onPressed: () {
                kuranView.getKuran();
              },
              child: const Text("Yeniden Dene"),
            )
          ],
        );
      } else {
        return ListView.builder(
          itemCount: kuranView.posts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(kuranView.posts[index].ayetId.toString()),
                ListTile(
                  title: Text(kuranView.posts[index].surear),
                  subtitle: Text(kuranView.posts[index].suretur),
                  // trailing: Text(kuranView.posts[index].surear),
                ),
              ],
            );
          },
        );
      }
    },
  );
}
