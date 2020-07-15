import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memo/app.dart';
import 'package:memo/redux/appstate.dart';
import 'package:memo/redux/appreducer.dart';
import "package:redux/redux.dart";

void main() {
  final store = Store(
    appReducer,
    initialState: AppState(
      noteList: [],
      noteIndex: 2,
    ),
  );
  runApp(StoreProvider(store: store, child: App()));
}
