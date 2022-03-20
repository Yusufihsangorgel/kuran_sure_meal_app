import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kuran_sure_meal_app/services/KuranServices.dart';
import 'package:kuran_sure_meal_app/services/sureServices.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  var dio = Dio();
  var searchItem = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value) {
              setState(() {
                searchItem = value;
              });
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
        body: FutureBuilder(
          future: getSureCode(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List kuranList = snapshot.data as List;
              return ListView.builder(
                itemCount: kuranList.length,
                itemBuilder: (context, index) {
                  var pCode = kuranList[index];
                  return pCode.ayetID.contains(searchItem)
                      ? ListTile(
                          title: Text(pCode.ayetID),
                          subtitle: Text(pCode.suretur.toString()),
                          trailing: Text(pCode.surear),
                        )
                      : Container();
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
