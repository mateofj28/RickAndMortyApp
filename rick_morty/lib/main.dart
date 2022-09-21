import 'package:flutter/material.dart';
import 'package:rick_morty/dao/characterDao.dart';
import 'package:rick_morty/dao/episodesDao.dart';
import 'package:rick_morty/dao/locationsDao.dart';
import 'package:rick_morty/pages/episodes.dart';
import 'package:rick_morty/pages/locations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List',
      theme: ThemeData.dark()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.red)),
      routes: {
        '/locations': (context) => Location(),
        '/caracters': (context) => Main(),
        '/episode': (context) => Episode(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to RaM app'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text('Characters'),
                onTap: () {
                  Navigator.pushNamed(context, '/caracters');
                },
              ),
              ListTile(
                title: const Text('locations'),
                onTap: () {
                  Navigator.pushNamed(context, '/locations');
                },
              ),
              ListTile(
                title: const Text('Episodes'),
                onTap: () {
                  Navigator.pushNamed(context, '/episode');
                },
              )
            ],
          ),
        ),
        body: Main(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late Future<dynamic> character;
  late TextEditingController _controller;
  late CharactersDao controller;

  @override
  void initState() {
    super.initState();
    // run before build
    _controller = TextEditingController();
    controller = CharactersDao();
    var controllerLoca = LocationDao();
    var controllerEpi = EpisodeDao();
    character = controller.getData();
    controllerLoca.getLocation();
    controllerLoca.getLocationById();
    controllerEpi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: _controller,
            maxLength: 2,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'filter by id'),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            setState(() {
              character = controller.getCharacterById(_controller.text);
            });
          },
        ),
        FutureBuilder<dynamic>(
          future: character,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                color: Colors.black12,
                child: ListTile(
                  leading: const Icon(Icons.android_rounded),
                  title: Text(snapshot.data!.name),
                  subtitle: Text(snapshot.data!.specie),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ],
    ));
  }
}
