import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:game_catalog/controller/detail_controller.dart';
import 'package:game_catalog/helper/view_state.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailController controller = DetailController();

  @override
  void initState() {
    super.initState();
    getGameDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Game Detail"),
        ),
        body: LayoutBuilder(builder: (context, _) {
          switch (controller.viewState) {
            case ViewState.empty:
              return const Center(child: Text("Failed to Get Detail"));
            case ViewState.loading:
              return const Center(child: CircularProgressIndicator());
            case ViewState.loaded:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      imageErrorBuilder: (BuildContext context, Object exception, StackTrace? trace) {
                        return const Icon(
                          Icons.error,
                        );
                      },
                      image: controller.gameDetail?.backgroundImage ?? "",
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(children: [
                        const SizedBox(height: 16),
                        Text(
                          controller.gameDetail?.name ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(controller.gameDetail?.rating.toString() ?? ""),
                          ],
                        ),
                        Text(DateFormat('d MMMM yyyy').format(DateTime.parse(controller.gameDetail?.released ?? ""))),
                        const SizedBox(height: 8),
                        Text(controller.gameDetail?.website ?? ""),
                        const SizedBox(height: 16),
                        Html(data: controller.gameDetail?.description),
                        const SizedBox(height: 16),
                      ]),
                    ),
                  ],
                ),
              );
          }
        }));
  }

  //Helper
  Future<void> getGameDetail(int id) async {
    await controller.getGameDetail(id);
    setState(() {});
  }
}
