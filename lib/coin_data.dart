import 'package:http/http.dart' as http;
import 'dart:convert';

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

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
  Future getCoinData(String crypto, String currency) async {
    http.Response response =
        await http.get('$bitcoinAverageURL$crypto$currency');
    if (200 == response.statusCode) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("Unable to get coin data");
      print(response.statusCode);
    }
  }
}
