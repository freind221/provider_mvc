import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static focusCange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toatsMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static flushBarSnakError(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          //titleText: const Text('Error'),
          reverseAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          duration: const Duration(seconds: 3),
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
            size: 20,
          ),
          message: message,
          backgroundColor: Colors.black,
          borderRadius: BorderRadius.circular(7),
        )..show(context));
  }
}
