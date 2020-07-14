import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Notes")),
      ),
      body: StoreConnector<AppState, List<NoteItem>>(
        converter: (store) => store.state.noteList,
        builder: (context, itemList) {
          return StoreConnector<AppState, ReorderFinishedCallback<NoteItem>>(
            converter: (store) {
              return (item, from, to, newItems) {
                store.dispatch(ResetNoteList(newItems));
              };
            },
            builder: (context, callback) {
              return ImplicitlyAnimatedReorderableList<NoteItem>(
                items: itemList,
                areItemsTheSame: (a, b) => a.id == b.id,
                onReorderFinished: callback,
                itemBuilder: (context, itemAnimation, item, index) {
                  int id = item.id;
                  String title = item.title, body = item.body, date = item.date;

                  return Reorderable(
                    key: ValueKey(item),
                    builder: (context, dragAnimation, inDrag) {
                      final t = dragAnimation.value;
                      final elevation = lerpDouble(0, 2, t);
                      final color = Color.lerp(
                        Colors.white,
                        Colors.white.withOpacity(0.8),
                        t,
                      );

                      return SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: itemAnimation,
                        child: Material(
                          color: color,
                          elevation: elevation,
                          child: ListTile(
                            title: Text(title),
                            subtitle: Text(date),
                            trailing: Handle(
                              delay: const Duration(milliseconds: 100),
                              child: Icon(
                                Icons.list,
                                color: Colors.grey,
                              ),
                            ),
                            onTap: () => openWidgetPage(
                              context,
                              NoteWritePage(
                                key: Key("$id"),
                                id: id,
                                title: title,
                                body: body,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => openWidgetPage(context, NoteWritePage()),
      ),
    );
  }
}
