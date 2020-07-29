import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:find_your_medication/controllers/URLs.dart';
import 'package:find_your_medication/models/drugs_model.dart';
import 'package:find_your_medication/screens/login_screen.dart';
import 'package:find_your_medication/stores/login_store.dart';
import 'package:find_your_medication/widgets/toats.dart';
import 'package:provider/provider.dart';

class ApiMethods {
  static String token;
  static int lastPage = 1;

  static Future<bool> authenticateLogin(String email, String password) async {
    bool responseApi = false;
    try {
      Map<String, dynamic> data;
      data = {
        "username": email,
        "password": password,
        "domain": "djbnrrib9e.execute-api.us-east-2.amazonaws.com"
      };

      var response = await http
          .post(URLs.URL_API + URLs.LOGIN, body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
      });

      var jsonData = json.decode(response.body);

      switch (response.statusCode) {
        case 200:
          token = jsonData["data"]["token"];
          responseApi = true;
          break;
        case 400:
          Toats.messages("Incorrect e-mail or password, please try again.");
          responseApi = false;
          break;
        case 401:
        case 403:
        case 404:
        default:
          Toats.messages("Login authentication failed, please try again");
          responseApi = false;
          break;
      }
    } catch (Erro) {
      Toats.messages("Failed to login, check your connection and try again");
      responseApi = false;
    }

    return responseApi;
  }

  static Future<List<DrugsModel>> getDrugsList(
      String drugName, int page, int limit, BuildContext context) async {
    List<DrugsModel> returnList = [];
    var response;
    try {
      response = await http.get(
          URLs.URL_API +
              URLs.LISTDRUGS +
              "?name=" +
              drugName.toUpperCase() +
              "&page=" +
              page.toString() +
              "&limit=" +
              limit.toString(),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          });

      switch (response.statusCode) {
        case 200:
          var jsonData = json.decode(response.body);

          if (jsonData["last_page"] != null) {
            lastPage = jsonData["last_page"];
            for (var drug in jsonData["data"]) {
              DrugsModel drugsModel = DrugsModel(
                  drug["coverage"],
                  drug["type_description"],
                  drug["dosage"],
                  drug["otc_rx_indicator"],
                  drug["gpi12"],
                  drug["strength"],
                  drug["gpi2"],
                  drug["strength_unit"],
                  drug["type"],
                  drug["name"],
                  drug["gpi4"],
                  drug["gpi14"]);
              returnList.add(drugsModel);
            }
          } else {
            lastPage = 0;
          }
          break;
        case 401:
        case 403:
        default:
          Provider.of<LoginStore>(context, listen: false).logout();
          Toats.messages(
              "Sorry, an error occurred during search authentication, please login again.");
          Navigator.pushReplacement(
              context, new MaterialPageRoute(builder: (__) => LoginScreen()));
          break;
      }
    } catch (Error) {
      Toats.messages(
          "Failed to perform the search, check your connection and try again");
    }

    return returnList;
  }
}
