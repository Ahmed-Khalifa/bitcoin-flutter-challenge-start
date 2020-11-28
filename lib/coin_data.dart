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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4068A48A-01A6-473C-A5EE-B891DACBFB81';

class CoinData {
  //TODO: Done - Create your getCoinData() method here. -
  String fromCurrency;
  String toCurrency;

  CoinData(this.fromCurrency, this.toCurrency);

  Future<double> getCoinData() async {
    http.Response response =
        await http.get('$coinAPIURL/$fromCurrency/$toCurrency?apikey=$apiKey');
    if (response.statusCode == 200) {
      var data = response.body;
      double rate = jsonDecode(data)['rate'];
      print(rate.toStringAsFixed(2));
      return rate;
    }
  }
}
