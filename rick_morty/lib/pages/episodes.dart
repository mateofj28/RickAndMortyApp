import 'package:flutter/material.dart';

class Episode extends StatefulWidget {

  @override
  State<Episode> createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Episode'),
    );
  }
}