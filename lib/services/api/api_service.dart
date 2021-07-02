import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  dynamic get(String url) async {
    var data;
    var request = http.Request('GET', Uri.parse(url));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      data = jsonDecode(await response.stream.bytesToString());
      return data;
    } else {
      print(response.reasonPhrase);
    }
  }
}
