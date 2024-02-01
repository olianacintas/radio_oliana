import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_cubit.dart';
import 'package:radio_oliana/cubit/radio_cubit/radio_cubit_state.dart';
import 'package:radio_oliana/providers/radio_api_provider.dart';
import 'package:radio_oliana/widgets/bottom_bar.dart';
import 'package:radio_oliana/widgets/card_radio_unselected.dart';

class RadioListScreen extends StatelessWidget {
  const RadioListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getRadios().then(
        (value) => context.read<RadioCubitCubit>().updateRadioList(value));
    return BlocBuilder<RadioCubitCubit, RadioCubitState>(builder: (_, state) {
      return Scaffold(
        bottomNavigationBar: BottomBar(state: state),
        appBar: AppBar(
          title: Text('Actually you have BCN radios!'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: state.detectedRadios.length,
                    itemBuilder: (context, index) => CardRadio(
                          radioStation: state.detectedRadios[index],
                        ))),
          ],
        ),
      );
    });
  }
}
