import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../../core/constants/url_base_const.dart';

class WebScraperApp extends StatefulWidget {
  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper(UrlbaseConsts.urlBase);

  // Response of getElement is always List<Map<String, dynamic>>
  var list;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('/')) {
      setState(
        () {
          // getElement takes the address of html tag/element and attributes you want to scrap from website
          // it will return the attributes in the same order passed
          List list =
              webScraper.getElement('div#topautores > ul > li > a ', ['href']);
          String name = list[0]['title'];
          print(name.isEmpty);
        },
      );
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
          child: list == null
              ? Center(
                  child:
                      CircularProgressIndicator(), // Loads Circular Loading Animation
                )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Attributes are in the form of List<Map<String, dynamic>>.

                    return ExpansionTile(
                      title: Text('kjkjkjkjk'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text('sas'),
                                margin: EdgeInsets.only(bottom: 10.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
