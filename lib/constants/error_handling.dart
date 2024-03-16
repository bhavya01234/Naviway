import 'dart:convert';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch(response.statusCode){
    case 200:
      onSuccess();
      break;
    case 400:
      // showSnackBar(context, jsonDecode(response.body)['msg']);
      print('error 400');
      break;
    case 500:
      // showSnackBar(context, jsonDecode(response.body)['error']);
      print('error 500');
      break;
    default:
      // showSnackBar(context, response.body);
      print('error default');
  }
}