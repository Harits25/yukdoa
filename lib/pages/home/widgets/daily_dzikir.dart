import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:makanan/modul/detailmodel.dart';

class DailyDzikir extends StatefulWidget {
  const DailyDzikir({Key? key}) : super(key: key);

  @override
  State<DailyDzikir> createState() => _DailyDzikirState();
}

class _DailyDzikirState extends State<DailyDzikir> {
  final String baseUrl = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';
  late List<DetailModel> listproduk;

  @override
  void initState() {
    super.initState();
  }

  Future<List<DetailModel>> _fetchData() async {
    try {
      var jsonResponse = await http.get(Uri.parse(baseUrl));
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

        listproduk = jsonItems.map<DetailModel>((json) {
          return DetailModel.fromJson(json);
        }).toList();
      }
    } catch (e) {}
    return listproduk;
  }

  Future<Null> _refresh() {
    return _fetchData().then((_listproduk) {
      setState(() => listproduk = _listproduk);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<DetailModel>>(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Container(
              margin: EdgeInsets.only(bottom: 0.0),
              child: ListView(
                padding: EdgeInsets.only(bottom: 160.0),
                children: snapshot.data!
                    .map(
                      (_data) => Column(
                        children: <Widget>[
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.perm_media, size: 50),
                                  title: Text(_data.doa),
                                  subtitle:
                                      Text(_data.ayat + ' / ' + _data.artinya),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
