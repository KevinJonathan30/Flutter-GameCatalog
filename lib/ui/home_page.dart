import 'package:flutter/material.dart';
import 'package:game_catalog/controller/home_controller.dart';
import 'package:game_catalog/helper/view_state.dart';
import 'package:game_catalog/ui/detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    getGameList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GameCatalog"),
      ),
      body: LayoutBuilder(builder: (context, _) {
        switch (controller.viewState) {
          case ViewState.empty:
            return const Center(child: Text("No Data"));
          case ViewState.loading:
            return const Center(child: CircularProgressIndicator());
          case ViewState.loaded:
            return ListView.builder(
                itemCount: controller.gameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(id: controller.gameList[index].id ?? 0)));
                        },
                        leading: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          imageErrorBuilder: (BuildContext context, Object exception, StackTrace? trace) {
                            return const Icon(
                              Icons.error,
                            );
                          },
                          image: controller.gameList[index].backgroundImage ?? "",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(controller.gameList[index].name ?? "")),
                  );
                });
        }
      }),
    );
  }

  //Helper
  Future<void> getGameList() async {
    await controller.getGameList();
    setState(() {});
  }
}
