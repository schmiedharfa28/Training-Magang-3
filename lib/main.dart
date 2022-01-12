import 'package:flutter/material.dart';
import 'package:flutter_training3/nested_json.dart';
import 'package:flutter_training3/news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuTab(),
    );
  }
}

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Json Nested',
              ),
              Tab(
                text: 'News',
              )
            ],
            controller: _tabController,
          )),
      body: TabBarView(
        children: [JsonNested(), NewsPage()],
        controller: _tabController,
      ),
    );
  }
}
