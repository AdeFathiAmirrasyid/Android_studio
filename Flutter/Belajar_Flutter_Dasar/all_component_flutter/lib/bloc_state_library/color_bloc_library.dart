import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  ColorBloc(super.state);

  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.toAmber) ? Colors.amber : Colors.lightBlue;
  }

  @override
  Color? fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['colo'] as int);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (_) {
      return null;
    }
  }
}
