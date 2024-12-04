import 'package:flutter/material.dart';
import 'VideoPlayerScreen.dart';
import '../data/data.dart';

class DetailScreen extends StatelessWidget {
  final MovieOrSeries movieOrSeries;

  DetailScreen({required this.movieOrSeries});
//   DetailScreen({required this.movieOrSeries});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieOrSeries.title),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(movieOrSeries.coverUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              movieOrSeries.description,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoUrl: 'assets/los_simpson.mp4', // URL del video
                  ),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_arrow),
                SizedBox(width: 8),
                Text('Play'),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff333333),
    );
  }
}
