import 'package:http_test_app/domain/servise/data_seralize.dart';

import 'dart:convert';
import 'dart:io';

class ApiClient {
  final client = HttpClient();

  Future<List<JesData>> getJesDatas () async{
    final url = Uri.parse( 'https://jsonplaceholder.typicode.com/posts');
    final request =await client.getUrl(url);
    final response = await request.close();

    final jsonString = await response.transform(utf8.decoder).toList();
    final js = jsonString.join();
    final json = jsonDecode(js) as List<dynamic>;
    final result =json.map((dynamic e) => JesData.fromJson(e as Map<String, dynamic>)).toList();


    return result;
  }






}