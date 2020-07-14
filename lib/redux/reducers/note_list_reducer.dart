import 'package:memo/redux/actions/note_list_action.dart';
import "package:redux/redux.dart";

// 추가
List<NoteItem> addNoteItemReducer(List<NoteItem> state, AddNoteItem action) {
  return List.from(state)..add(action.item);
}

// 업데이트
List<NoteItem> updateNoteItemReducer(
  List<NoteItem> state,
  UpdateNoteItem action,
) {
  List<NoteItem> cpState = List.from(state);
  int index = cpState.indexWhere((element) => element.id == action.item.id);

  cpState[index] = action.item;

  return cpState;
}

// 리셋
List<NoteItem> resetNoteListReducer(
  List<NoteItem> state,
  ResetNoteList action,
) {
  return action.newList;
}

Reducer<List<NoteItem>> combineNoteListReducers = combineReducers([
  TypedReducer<List<NoteItem>, AddNoteItem>(addNoteItemReducer),
  TypedReducer<List<NoteItem>, UpdateNoteItem>(updateNoteItemReducer),
  TypedReducer<List<NoteItem>, ResetNoteList>(resetNoteListReducer),
]);
