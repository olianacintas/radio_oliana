import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_oliana/models/radio_station.dart';

abstract class RadioCubitState extends Equatable {
  const RadioCubitState({
    required this.detectedRadios,
    required this.audioPlayer,
    required this.favouriteRadios,
    required this.isPlaying,
    required this.selectedRadio,
    required this.volume,
  });

  final AudioPlayer audioPlayer;
  final bool isPlaying;
  final double volume;
  final List<RadioStation> detectedRadios;
  final List<RadioStation> favouriteRadios;
  final String selectedRadio;

  @override
  List<Object> get props => [
        audioPlayer,
        isPlaying,
        selectedRadio,
        detectedRadios,
        favouriteRadios,
        volume
      ];
}

class RadioInitial extends RadioCubitState {
  RadioInitial()
      : super(
            audioPlayer: AudioPlayer(),
            isPlaying: false,
            selectedRadio: '',
            detectedRadios: [],
            favouriteRadios: [],
            volume: 0.5);
}

class RadioUpdate extends RadioCubitState {
  const RadioUpdate(
      {required AudioPlayer audioPlayer,
      required bool isPlaying,
      required String selectedRadio,
      required List<RadioStation> detectedRadios,
      required List<RadioStation> favouriteRadios,
      required double volume})
      : super(
            audioPlayer: audioPlayer,
            isPlaying: isPlaying,
            selectedRadio: selectedRadio,
            detectedRadios: detectedRadios,
            favouriteRadios: favouriteRadios,
            volume: volume);
}
