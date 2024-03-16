import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navigate/constants/error_handling.dart';

class AddressServices {

  void saveUserAddress({
    required BuildContext context,
    required String latit,
    required String longit,
    required String flat,
    required String area,
    required String pincode,
    required String town,
    required String ph
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      var curr;
      curr=DateTime.now().toString();
      String fulladdress = latit+longit+flat+area+pincode+town+ph;
      print(fulladdress);
      var headers = {
        'Application': 'Curepoint',
        'environment': '',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://34.131.22.188/insertElixireB2BNewStore/'));

      request.body = json.encode({
        "_latitude": latit,
        "_longitude": longit,
        "_flat": flat,
        "_area": area,
        "_pincode": pincode,
        "_town": town,
        "_phone": ph,
        "_time": curr,
      });
      print(request);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

      }
      else {
        print(response.reasonPhrase);
        print('encountered');
      }




      // http.Response res = await http.post(
      //   Uri.parse('$uri/api/save-user-address'),
      //   headers: {
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'x-auth-token': userProvider.user.token,
      //   },
      //   body: jsonEncode({
      //     'address': address,
      //   }),
      // );
      //
      // httpErrorHandle(
      //   response: res,
      //   context: context,
      //   onSuccess: () {
      //     User user = userProvider.user.copyWith(
      //       address: jsonDecode(res.body)['address'],
      //     );
      //
      //     // userProvider.setUserFromModel(user);
      //   },
      // );
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e);
    }
  }
}