import 'package:memo/redux/actions/appstate.dart';
import 'package:memo/redux/reducers/note_index_reducer.dart';
import 'package:memo/redux/reducers/note_list_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    noteList: combineNoteListReducers(state.noteList, action),
    noteIndex: noteIndexReducer(state.noteIndex, action),
  );
}
