import 'package:flutter/material.dart';
import 'package:http_req/quote.dart';

class CustomQuote extends StatefulWidget {
  const CustomQuote({Key? key}) : super(key: key);

  @override
  State<CustomQuote> createState() => _CustomQuoteState();
}

class _CustomQuoteState extends State<CustomQuote> {
  List<Quote> quotes = [
    Quote(text: 'Hari ini ya hari ini', author: 'Jordan Nagakukus'),
    Quote(text: 'Duh Ngegek', author: 'Jordan Nagakukus'),
    Quote(text: 'ABCD', author: 'Gabriel S.Kompor'),
  ];

  Widget quoteTemplate(quote) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("\"${quote.text}\"", style: TextStyle(fontSize: 18.0, color: Colors.teal[400])),
            Text("- ${quote.author}", style: TextStyle(fontSize: 14.0, color: Colors.teal[400]), textAlign: TextAlign.right,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: quotes.map((quote) => quoteTemplate(quote)).toList(),
    );
  }
}
