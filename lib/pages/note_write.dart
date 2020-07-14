import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:memo/redux/actions/appstate.dart';
import 'package:memo/redux/actions/note_index_action.dart';
import 'package:memo/redux/actions/note_list_action.dart';
import 'package:memo/utils/variable.dart';

class NoteWritePage extends StatefulWidget {
  final String title, body;
  final int id;

  NoteWritePage({
    Key key,
    this.id,
    this.title,
    this.body,
  }) : super(key: key);

  @override
  _NoteWritePageState createState() => _NoteWritePageState();
}

class _NoteWritePageState extends State<NoteWritePage>
    with SingleTickerProviderStateMixin {
  TextEditingController _titleController, _bodyController;

  int _id;

  @override
  void initState() {
    super.initState();
    _id = widget.id;
    _titleController = TextEditingController()..text = widget.title;
    _bodyController = TextEditingController()..text = widget.body;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
        actions: [
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () {
                AppState state = store.state;
                NoteItem item = NoteItem(
                  id: _id,
                  body: _bodyController.text,
                  title: _titleController.text,
                  date: dateFullFormat.format(
                    DateTime.now(),
                  ),
                );

                if (_id == null) {
                  store.dispatch(NoteIndex.increment);
                  _id = state.noteIndex;
                  item.id = _id;
                  store.dispatch(AddNoteItem(item));
                } else {
                  store.dispatch(UpdateNoteItem(item));
                }

                showToast("저장 완료");
                Navigator.pop(context);
              };
            },
            builder: (context, callback) => IconButton(
              icon: Icon(Icons.save),
              onPressed: callback,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: _titleController,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: _bodyController,
              maxLines: 12,
            ),
          ),
        ],
      ),
    );
  }
}
