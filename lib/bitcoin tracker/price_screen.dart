import 'package:flutter/material.dart';
import 'package:myprofile/bitcoin tracker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

String selectedcurrency = 'USD';
late String coin;

List<DropdownMenuItem<String>>? getdropdownitem() {
  List<DropdownMenuItem<String>> dropdownmenuitem = [];
  for (int i = 0; i < currenciesList.length; i++) {
    String currency = currenciesList[i];
    var newitem = DropdownMenuItem(child: Text(currency), value: currency);
    dropdownmenuitem.add(newitem);
  }
  return dropdownmenuitem;
}

class _PriceScreenState extends State<PriceScreen> {
  late String bitcoinvalueusd = '?';
  late String bitcoinvalueeth = '?';
  late String bitcoinvalueltc = '?';

  void getdata() async {
    try {
      double usd = await CoinData().getcoindata( cryptoList[0],selectedcurrency);
      double eth = await CoinData().getcoindata( cryptoList[1],selectedcurrency);
      double ltc = await CoinData().getcoindata( cryptoList[2],selectedcurrency);
      setState(() {
        bitcoinvalueusd = usd.toStringAsFixed(0);
        bitcoinvalueeth = eth.toStringAsFixed(0);
        bitcoinvalueltc = ltc.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[0]} = $bitcoinvalueusd $selectedcurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[1]} = $bitcoinvalueeth $selectedcurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[2]} = $bitcoinvalueltc $selectedcurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedcurrency,
              items: getdropdownitem(),
              onChanged: (value) {
                setState(() {
                  selectedcurrency = value!;
                  getdata();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
