import 'package:flutter/material.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SongPlayerSlider extends StatefulWidget {
  final position;
  final duration;
  const SongPlayerSlider(
      {required this.duration, required this.position, super.key});

  @override
  State<SongPlayerSlider> createState() => _SongPlayerSliderState();
}

class _SongPlayerSliderState extends State<SongPlayerSlider> {
  double songValue = 0;

  void changeToSeconds(int seconds) {
    Duration d = Duration(seconds: seconds);
    var songProvider = Provider.of<SongProvider>(context, listen: false);
    songProvider.audioPlayer.seek(d);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.position.toString().split(".")[0],
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                trackHeight: 3,
                inactiveTrackColor: Theme.of(context).dividerColor),
            child: Slider(
              min: const Duration(microseconds: 0).inSeconds.toDouble(),
              value: widget.position.inSeconds.toDouble(),
              max: widget.duration.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  changeToSeconds(value.toInt());
                  songValue = value;
                });
              },
            ),
          ),
        ),
        Text(
          widget.duration.toString().split(".")[0],
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
