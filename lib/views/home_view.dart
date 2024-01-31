import 'package:flutter/material.dart';
import 'package:meme_generator/services/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meme_generator/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _onTileClicked(int index) {
    debugPrint("You tapped on item $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memer App'),
      ),
      body: FutureBuilder(
          future: API.getMemes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.data!.memes!.length,
                itemBuilder: (context, index) {
                  final meme = snapshot.data!.data!.memes![index];
                  // print(meme.name!);
                  return Stack(
                    children: [
                      Card(
                        color: MyThemes.lightColorScheme.onSurfaceVariant,
                        child: InkResponse(
                          onTap: () => launchUrl(Uri.parse(meme.url!)),
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: meme.url!,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
