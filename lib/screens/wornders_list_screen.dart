import 'package:flutter/material.dart';
import 'package:world_wonders/data/world_wonders.dart';
import 'package:world_wonders/screens/wonders_map.dart';

class WondersListScreen extends StatelessWidget {
  const WondersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("World Wonders"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(worldWondersList[index].name),
              onTap: () => Navigator.pushNamed(
                  context, WonderMapScreen.routeName,
                  arguments: {"wonder": worldWondersList[index]}),
            );
          },
          itemCount: worldWondersList.length,
        ));
  }
}
