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

  NoteItem.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        body = json["body"],
        date = json["date"];

  Map<String, dynamic> toJSON() => {
        "id": id,
        "title": title,
        "body": body,
        "date": date,
      };
}

class AddNoteItem {
  NoteItem item;

  AddNoteItem(this.item);
}

class UpdateNoteItem {
  NoteItem item;

  UpdateNoteItem(this.item);
}

class ResetNoteList {
  List<NoteItem> newList;
  ResetNoteList(this.newList);
}

class RemoveNoteItem {
  NoteItem item;
  RemoveNoteItem(this.item);
}
