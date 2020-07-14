import 'package:flutter/material.dart';
import 'package:memo/pages/note_list.dart';
import 'package:memo/widgets/toast_style.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToastStyleWidget(
      child: MaterialApp(
        home: NoteListPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
