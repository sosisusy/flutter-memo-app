import 'package:memo/redux/actions/note_list_action.dart';

class AppState {
  List<NoteItem> noteList;
  int noteIndex;

  AppState({this.noteList, this.noteIndex});
}
