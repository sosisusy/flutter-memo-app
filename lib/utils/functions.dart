import 'package:flutter/material.dart';

// 페이지 오픈
void openWidgetPage(BuildContext context, Widget openPage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => openPage,
    ),
  );
}
