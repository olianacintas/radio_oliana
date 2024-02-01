import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_cubit.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_state.dart';
import 'package:radio_oliana/widgets/bottom_bar_favorites.dart';
import 'package:radio_oliana/widgets/card_radio_unselected.dart';

class RadioFavoritesScreen extends StatelessWidget {
  const RadioFavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubitCubit, RadioCubitState>(builder: (_, state) {
      return Scaffold(
        bottomNavigationBar: BottomBarFavorite(state: state),
        appBar: AppBar(
          title: const Text('Your favorite radios!'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: state.favouriteRadios.length,
                    itemBuilder: (context, index) => CardRadio(
                          radioStation: state.favouriteRadios[index],
                        ))),
          ],
        ),
      );
    });
  }
}
