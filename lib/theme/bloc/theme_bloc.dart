import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(
    ThemeEvent event,
  ) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
        break;
      default:
    }
  }
}
