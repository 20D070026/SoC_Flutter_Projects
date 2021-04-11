import 'package:flutter/material.dart';
import 'quote.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));


class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(number: 'one', text: 'abcdefg'),
    Quote(text: 'hijklmnop', number: 'two'),
    Quote(text: 'uvwxyz', number: 'three')
  ];

  Widget quoteTemplate(quote){
    return QuoteCard();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Awesome Quotes'),
      ),
      body: Column(
        children: quotes.map((quote) {
          return Card(
          );
        }
        ).toList(),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
    final Quote quote;
    QuoteCard({this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            quote.text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue[900],
            ),
          ),
          Text(
            quote.number,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
              onPressed: () {} ,
              label: Text('delete'),
          icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}


