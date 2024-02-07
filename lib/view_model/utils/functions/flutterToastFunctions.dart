import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast({required String msg,Color?color}) async {
  return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor:color??AppColors.appColor,
        textColor:AppColors.whiteColor,
        fontSize: 16.0
  );
}