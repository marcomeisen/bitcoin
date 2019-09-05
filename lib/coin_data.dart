import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getData() async {
    String cryptoPrices;

    http.Response response = await http
        .get('https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD');
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      double lastPrice = decodedData['last'];
      print(lastPrice);
      cryptoPrices = lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    print(cryptoPrices);
    return cryptoPrices;
  }
}
