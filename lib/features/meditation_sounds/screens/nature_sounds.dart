import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class NatureSoundsScreen extends StatefulWidget {
  @override
  State<NatureSoundsScreen> createState() => _NatureSoundsScreenState();
}

class _NatureSoundsScreenState extends State<NatureSoundsScreen> {
  final List<SoundOption> soundOptions = [
    SoundOption(title: 'Rain', soundUrl: 'sounds/rain.mp3'),
    SoundOption(title: 'Bird Chirping', soundUrl: 'sounds/bird_chirping.mp3'),
    SoundOption(title: 'Ocean Waves', soundUrl: 'sounds/ocean_waves.mp3'),
    SoundOption(title: 'Campfire', soundUrl: 'sounds/campfire.mp3'),
    SoundOption(title: 'Forest Ambience', soundUrl: 'sounds/forest.mp3'),
    SoundOption(title: 'Waterfall', soundUrl: 'sounds/waterfall.mp3'),
    // Add more sound options here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nature Sounds'),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose a Nature Sound:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: soundOptions.length,
                itemBuilder: (context, index) {
                  return NatureSoundTile(soundOption: soundOptions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoundOption {
  final String title;
  final String soundUrl;

  SoundOption({required this.title, required this.soundUrl});
}

class NatureSoundTile extends StatefulWidget {
  final SoundOption soundOption;

  const NatureSoundTile({required this.soundOption});

  @override
  _NatureSoundTileState createState() => _NatureSoundTileState();
}

class _NatureSoundTileState extends State<NatureSoundTile> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(widget.soundOption.title),
        leading: Icon(Icons.volume_up),
        trailing: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        onTap: () {
          if (isPlaying) {
            // Stop the audio when tapping on the tile

            _audioPlayer.stop();
            setState(() {
              isPlaying = false;
            });
          } else {
            // Start playing the audio when tapping on the tile
            _audioPlayer.play(AssetSource(widget.soundOption.soundUrl));
            setState(() {
              isPlaying = true;
            });
          }
        },
      ),
    );
  }
}
