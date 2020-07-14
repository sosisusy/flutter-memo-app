import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

// 토스트 스타일 설정
class ToastStyleWidget extends StatelessWidget {
  ToastStyleWidget({Key key, this.child}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      locale: const Locale('en', 'US'),
      textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
      backgroundColor: Color(0x99000000),
      borderRadius: BorderRadius.circular(20.0),
      textPadding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
      duration: Duration(seconds: 3),
      animDuration: Duration(milliseconds: 700),
      alignment: Alignment.center,
      toastPositions: StyledToastPosition.bottom,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.fastOutSlowIn,
      dismissOtherOnShow: true,
      movingOnWindowChange: true,
      child: child,
    );
  }
}
