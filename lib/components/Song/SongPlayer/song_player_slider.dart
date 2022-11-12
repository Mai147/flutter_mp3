import 'package:flutter/material.dart';
import 'package:flutter_mp3/models/PositionData.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SongPlayerSlider extends StatefulWidget {
  // final position;
  // final duration;
  const SongPlayerSlider({super.key});

  @override
  State<SongPlayerSlider> createState() => _SongPlayerSliderState();
}

class _SongPlayerSliderState extends State<SongPlayerSlider> {
  double songValue = 0;

  void changeToSeconds(int seconds) {
    Duration d = Duration(seconds: seconds);
    var audioPlayer = Provider.of<AudioProvider>(context, listen: false);
    audioPlayer.audioPlayer.seek(d);
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          Provider.of<AudioProvider>(context, listen: false)
              .audioPlayer
              .positionStream,
          Provider.of<AudioProvider>(context, listen: false)
              .audioPlayer
              .bufferedPositionStream,
          Provider.of<AudioProvider>(context, listen: false)
              .audioPlayer
              .durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              positionData?.position.toString().split(".")[0] ?? "0:00:00",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                    trackHeight: 3,
                    thumbColor: Theme.of(context).primaryColor,
                    activeTrackColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: Theme.of(context).dividerColor),
                child: Slider(
                  min: const Duration(microseconds: 0).inSeconds.toDouble(),
                  value: positionData?.position.inSeconds.toDouble() ?? 0,
                  max: positionData?.duration.inSeconds.toDouble() ?? 0,
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
              positionData?.duration.toString().split(".")[0] ?? "0:00:00",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        );
      },
    );
  }
}
