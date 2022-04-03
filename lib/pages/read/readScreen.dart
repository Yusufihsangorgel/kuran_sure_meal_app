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
    return Observer(builder: (_) {
      return RefreshIndicator(
          onRefresh: () => sureView.getKuran(),
          child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        sureView.getEnglish();
                      });
                    },
                    icon: CircleAvatar(
                      backgroundColor: Colors.blue[900],
                      child: const Text(
                        'EN',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        sureView.getTurkish();
                      });
                    },
                    icon: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                        'TR',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
                backgroundColor: Colors.green[900],
                title: sureView.sureAd == ""
                    ? Text("Kuran Sureleri")
                    : Text(sureView.sureAd),
              ),
              body: sureView.sureAd == ""
                  ? const Center(
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
                Text(kuranView.posts[index].ayetId.toString(),
                    style: TextStyle(fontSize: 20)),
                Observer(builder: (_) {
                  return ListTile(
                    title: Text(kuranView.posts[index].surear),
                    subtitle: sureView.turkish == true
                        ? Text(kuranView.posts[index].suretur)
                        : Text(kuranView.posts[index].sureen),
                  );
                }),
                Divider(
                  color: Colors.black,
                ),
              ],
            );
          },
        );
      }
    },
  );
}
