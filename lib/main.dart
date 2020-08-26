import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

void main() => runApp(WebScraperApp());

class WebScraperApp extends StatefulWidget {
  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://www.pensador.com/');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>> authors;
  List<Map<String, dynamic>> quotes;
  List<Map<String, dynamic>> images;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('/maria')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        authors = webScraper.getElement(
            'div#phrasesList > div.thought-card > span.autor > a', ['title']);
        quotes = webScraper
            .getElement('div#phrasesList > div.thought-card > p', ['data-alt']);
        images = webScraper
            .getElement('div#phrasesList > div.thought-card', ['data-src']);

        print('======================');
        print(authors);
        print('/n');
        print(images);
        print('======================');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Product Catalog"),
          ),
          body: SafeArea(
              child: authors == null
                  ? Center(
                      child:
                          CircularProgressIndicator(), // Loads Circular Loading Animation
                    )
                  : ListView.builder(
                      itemCount: authors.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Attributes are in the form of List<Map<String, dynamic>>.
                        Map<String, dynamic> author = authors[index];
                        Map<String, dynamic> image =
                            images[index]['attributes'];
                        print('*******************');
                        print(author);
                        print('*******************');
                        return ExpansionTile(
                          title: Text(author['title']),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(quotes[index]['title']),
                                    margin: EdgeInsets.only(bottom: 10.0),
                                  ),
                                  Image.network(image['data-src'])
                                ],
                              ),
                            )
                          ],
                        );
                      }))),
    );
  }
}
