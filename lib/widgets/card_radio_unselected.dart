import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_cubit.dart';
import 'package:radio_oliana/models/radio_station.dart';

class CardRadio extends StatelessWidget {
  const CardRadio({super.key, required this.radioStation});

  final RadioStation radioStation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<RadioCubitCubit>().selectRadio(radioStation),
      child: Container(
        decoration: BoxDecoration(
            border: context.read<RadioCubitCubit>().isSelected(radioStation)
                ? Border.all(color: Colors.blue, width: 3)
                : Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(1),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: 50,
                height: 50,
                child: radioStation.favicon != ''
                    ? Image.network(radioStation.favicon)
                    : const Icon(Icons.radio_sharp)),
            const SizedBox(
              width: 10,
            ),
            Text(
              radioStation.name,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            context.read<RadioCubitCubit>().isFavorite(radioStation)
                ? GestureDetector(
                    onTap: () => context
                        .read<RadioCubitCubit>()
                        .deleteFavorite(radioStation),
                    child: Icon(Icons.star),
                  )
                : GestureDetector(
                    onTap: () => context
                        .read<RadioCubitCubit>()
                        .addFavorite(radioStation),
                    child: const Icon(Icons.star_border_outlined),
                  ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
