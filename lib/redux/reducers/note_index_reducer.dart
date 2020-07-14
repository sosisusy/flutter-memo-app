import 'package:memo/redux/actions/note_index_action.dart';

int noteIndexReducer(int state, action) {
  switch (action) {
    case NoteIndex.increment:
      return state + 1;
      break;
  }
  return state;
}
