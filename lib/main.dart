import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //this false to remove debugger watermark
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your Personal Bidding Machine'),
          titleTextStyle: const TextStyle(
            color: Colors.blueGrey, //title color
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true, // Center title
        ),
        body: const MaximumBid(),
      ),
    );
  }
}

class MaximumBid extends StatefulWidget {
  const MaximumBid({Key? key}) : super(key: key);

  @override
  _MaximumBidState createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  double _currentBid = 0.0;

  void _increaseBid() {
    setState(() {
      _currentBid += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is your current maximum bid on XYZ product:',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            '\$${_currentBid.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 32, color: Colors.red[800]),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _increaseBid,
                child: const Text('          losing the bid? \n Increase your bid by \$50'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
