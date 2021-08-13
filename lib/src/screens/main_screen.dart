import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store/src/core/store_model.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  StoreModel store;
  bool isLoading = false;

  getStoreInfo() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http
        .get("https://loja-de-frutas-default-rtdb.firebaseio.com/loja.json");

    if (response.statusCode == 200) {
      final convertedToMap = json.decode(response.body);

      setState(() {
        store = StoreModel.fromMap(convertedToMap);

        print(store);
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  initState() {
    super.initState();
    getStoreInfo();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  strokeWidth: 5,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Loading...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          )
        : Visibility(
            visible: store != null,
            child: Scaffold(
              appBar: AppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(store.name),
                        SizedBox(width: 10),
                        Icon(Icons.shop),
                      ],
                    ),
                    Text(
                      store.slogan,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                centerTitle: true,
              ),
              body: ListView(
                children: [],
              ),
            ),
          );
  }
}
