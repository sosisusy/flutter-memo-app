// 노트 아이템
class NoteItem {
  int id;
  String title, body, date;

  NoteItem({
    this.id,
    this.title,
    this.body,
    this.date,
  });
}

class AddNoteItem {
  NoteItem item;

  AddNoteItem(this.item);
}

class UpdateNoteItem {
  NoteItem item;

  UpdateNoteItem(this.item);
}
