import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
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

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

// Replace 'YOUR-API-KEY-HERE' with your actual CoinAPI key
const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  Future<Map<String, String>> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';

      try {
        http.Response response = await http.get(Uri.parse(requestURL));

        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          double price = decodedData['rate'];
          cryptoPrices[crypto] = price.toStringAsFixed(0);
        } else {
          if (kDebugMode) {
            print('Request failed with status: ${response.statusCode}');
          }
          if (kDebugMode) {
            print('Response body: ${response.body}');
          }
          throw 'Problem with the get request';
        }
      } catch (error) {
        if (kDebugMode) {
          print('Error: $error');
        }
        throw 'Failed to fetch data';
      }
    }

    return cryptoPrices;
  }
}
