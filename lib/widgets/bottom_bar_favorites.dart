import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_cubit.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_state.dart';

class BottomBarFavorite extends StatelessWidget {
  const BottomBarFavorite({
    super.key,
    required this.state,
  });
  final RadioCubitState state;
  @override
  Widget build(BuildContext context) {
    bool isPlaying = state.isPlaying;
    return BottomAppBar(
      color: Colors.blue,
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        state.volume == 0
            ? const Icon(
                Icons.volume_mute,
                color: Colors.white,
              )
            : const Icon(
                Icons.volume_up,
                color: Colors.white,
              ),
        Slider(
            activeColor: Colors.white,
            secondaryActiveColor: Colors.white,
            thumbColor: Colors.white,
            inactiveColor: Colors.white,
            value: state.volume,
            onChanged: (value) =>
                context.read<RadioCubitCubit>().changeVolume(value)),
        isPlaying
            ? GestureDetector(
                onTap: () => context.read<RadioCubitCubit>().stopRadio(),
                child: const Icon(
                  Icons.pause,
                  color: Colors.white,
                ))
            : GestureDetector(
                onTap: () => context.read<RadioCubitCubit>().startRadio(),
                child: const Icon(Icons.play_arrow, color: Colors.white)),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        )
      ]),
    );
  }
}
