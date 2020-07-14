import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memo/pages/note_write.dart';
import 'package:memo/redux/actions/appstate.dart';
import 'package:memo/redux/actions/note_list_action.dart';
import 'package:memo/utils/functions.dart';

class NoteListPage extends StatefulWidget {
  NoteListPage({Key key}) : super(key: key);

  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Notes")),
      ),
      body: StoreConnector<AppState, List<NoteItem>>(
        converter: (store) => store.state.noteList,
        builder: (context, itemList) => ListView.builder(
          itemBuilder: (context, index) {
            NoteItem item = itemList[index];
            int id = item.id;
            String title = item.title, body = item.body, date = item.date;

            return ListTile(
              title: Text(title),
              subtitle: Text(date),
              onTap: () => openWidgetPage(
                context,
                NoteWritePage(
                  key: Key("$id"),
                  id: id,
                  title: title,
                  body: body,
                ),
              ),
            );
          },
          itemCount: itemList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => openWidgetPage(context, NoteWritePage()),
      ),
    );
  }
}
