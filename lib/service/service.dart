// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:makanan/modul/detailmodel.dart';
//
// class Repository {
//   String baseUrl = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';
//
//   Future<List<DetailModel>> getDoa() async {
//     final response = await http
//         .get(Uri.parse(baseUrl));
//
//     if (response.statusCode == 200) {
//       final _data = jsonDecode(response.body) as List;
//       final List<DetailModel> list = _data.map((json) => DetailModel.FromJson(json)).toList();
//       print(response.body);
//       return list;
//     } else {
//       throw Exception('Failed to load Data(Gagal memuat Data)');
//     }
//   }
//
// }