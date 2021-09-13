import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Future getcoindata(String coin , String currency) async {
  http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=46A257A2-B3C6-44FC-B748-89E73A11CD91'));
  var data = jsonDecode(response.body);
  var rate = data['rate'];
  return rate;
}  
}
