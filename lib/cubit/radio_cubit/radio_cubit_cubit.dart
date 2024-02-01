import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_state.dart';
import 'package:radio_oliana/models/radio_station.dart';

class RadioCubitCubit extends Cubit<RadioCubitState> {
  RadioCubitCubit() : super(RadioInitial());

  void updateRadioList(List<RadioStation> detectedRadios) {
    emit(RadioUpdate(
        audioPlayer: state.audioPlayer,
        isPlaying: false,
        selectedRadio: '',
        detectedRadios: detectedRadios,
        favouriteRadios: state.favouriteRadios,
        volume: state.volume));
  }

  void startRadio() async {
    state.audioPlayer.play();
    emit(RadioUpdate(
        audioPlayer: state.audioPlayer,
        isPlaying: true,
        selectedRadio: state.selectedRadio,
        detectedRadios: state.detectedRadios,
        favouriteRadios: state.favouriteRadios,
        volume: state.volume));
  }

  void stopRadio() async {
    state.audioPlayer.stop();
    emit(RadioUpdate(
        audioPlayer: state.audioPlayer,
        isPlaying: false,
        selectedRadio: state.selectedRadio,
        detectedRadios: state.detectedRadios,
        favouriteRadios: state.favouriteRadios,
        volume: state.volume));
  }

  void addFavorite(RadioStation radioStation) {
    List<RadioStation> radioList = [];
    radioList.add(radioStation);
    radioList.addAll(state.favouriteRadios);
    emit(RadioUpdate(
        audioPlayer: state.audioPlayer,
        isPlaying: state.isPlaying,
        selectedRadio: state.selectedRadio,
        detectedRadios: state.detectedRadios,
        favouriteRadios: radioList,
        volume: state.volume));
  }

  void deleteFavorite(RadioStation radioStation) {
    List<RadioStation> radioList = [];
    radioList.addAll(state.favouriteRadios);
    radioList.removeWhere((favoriteRadio) =>
        radioStation.stationuuid == favoriteRadio.stationuuid);
    emit(RadioUpdate(
        audioPlayer: state.audioPlayer,
        isPlaying: state.isPlaying,
        selectedRadio: state.selectedRadio,
        detectedRadios: state.detectedRadios,
        favouriteRadios: radioList,
        volume: state.volume));
  }

  void selectRadio(RadioStation radioStation) async {
    await state.audioPlayer.setUrl(radioStation.url);
    emit(RadioUpdate(
        audioPlayer: state.audioPlayer,
        isPlaying: state.isPlaying,
        selectedRadio: radioStation.stationuuid,
        detectedRadios: state.detectedRadios,
        favouriteRadios: state.favouriteRadios,
        volume: state.volume));
    if (!state.isPlaying) {
      startRadio();
    }
  }

  void changeVolume(double volume) {
    state.audioPlayer.setVolume(volume);
    emit(RadioUpdate(
        audioPlayer: state.audioPlayer,
        isPlaying: state.isPlaying,
        selectedRadio: state.selectedRadio,
        detectedRadios: state.detectedRadios,
        favouriteRadios: state.favouriteRadios,
        volume: volume));
  }

  bool isPlaying() {
    return state.isPlaying;
  }

  bool isFavorite(RadioStation radioStation) {
    return state.favouriteRadios.contains(radioStation);
  }

  bool isSelected(RadioStation radioStation) {
    return state.selectedRadio == radioStation.stationuuid;
  }

  RadioStation? getRadioFromUid(String uid) {
    for (RadioStation radioStation in state.detectedRadios) {
      if (radioStation.stationuuid == uid) return radioStation;
    }
    return null;
  }
}
