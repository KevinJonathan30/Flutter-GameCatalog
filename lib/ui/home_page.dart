import 'package:flutter/material.dart';
import 'package:game_catalog/model/game.dart';
import 'package:game_catalog/resources/connector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final connector = Connector();
  List<Game> gameList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGameList();
  }

  Future<void> getGameList() async {
    isLoading = true;
    gameList = await connector.getGameList();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(builder: (context, _) {
        if (gameList.isNotEmpty) {
          return ListView.builder(
              itemCount: gameList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(leading: const Icon(Icons.list), title: Text(gameList[index].name ?? ""));
              });
        } else if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("No Data"));
        }
      }),
    );
  }


}
