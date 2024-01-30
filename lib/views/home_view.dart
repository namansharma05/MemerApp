import 'package:flutter/material.dart';
import 'package:meme_generator/services/api.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
              return ListView.builder(
                itemCount: snapshot.data!.data!.memes!.length,
                itemBuilder: (context, index) {
                  final meme = snapshot.data!.data!.memes![index];
                  // print(meme.name!);
                  return ListTile(
                    title: Text(meme.name!),
                    subtitle: Text(meme.url!),
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
