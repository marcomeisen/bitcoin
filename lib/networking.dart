import 'dart:convert';

import 'package:http/http.dart' as http;

const url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String tickerData = response.body;
      return jsonDecode(tickerData);
    } else {
      print(response.statusCode);
    }

    //NetworkHelper networkHelper = NetworkHelper(url);
  }
}
