import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:find_your_medication/main.dart';
import 'package:find_your_medication/stores/login_store.dart';
import 'package:find_your_medication/stores/search_drugs_store.dart';
import 'package:find_your_medication/widgets/card_drug.dart';
import 'package:find_your_medication/widgets/connection.dart';
import 'package:find_your_medication/widgets/custom_fields.dart';
import 'package:find_your_medication/widgets/custom_icons_buttons.dart';
import 'package:find_your_medication/widgets/custom_texts.dart';
import 'package:find_your_medication/widgets/toats.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SearchDrugsScreen extends StatefulWidget {
  @override
  _SearchDrugsScreenState createState() => _SearchDrugsScreenState();
}

class _SearchDrugsScreenState extends State<SearchDrugsScreen> {
  final SearchDrugsStore listStore = SearchDrugsStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomTexts(
                      text: "Welcome!",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      textColor: lightBlue,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTexts(
                            text: "Logout ",
                            size: 12,
                            textColor: lightBlue,
                            fontWeight: FontWeight.bold,
                          ),
                          Icon(
                            Icons.exit_to_app,
                            color: lightBlue,
                          )
                        ],
                      ),
                      onTap: () {
                        Provider.of<LoginStore>(context, listen: false)
                            .logout();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                  child: Column(
                    children: <Widget>[
                      Observer(
                        builder: (_) {
                          return CustomFields(
                            hint: 'Which medicine are looking for?',
                            onChanged: listStore.setNameDrug,
                            onSubmitted: (Null) => listStore.isSearchValid
                                ? listStore.searchDrugs(context)
                                : null,
                            suffix: listStore.isSearchValid
                                ? CustomIconsButtons(
                                    radius: 32,
                                    iconData: Icons.search,
                                    onTap: () async {
                                      if (await Connection
                                          .verifiyUserConnection()) {
                                        if (RegExp('[a-zA-Z]')
                                                .hasMatch(listStore.nameDrug) ||
                                            RegExp(r'\d')
                                                .hasMatch(listStore.nameDrug)) {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          listStore.clearList();
                                          listStore.searchDrugs(context);
                                        } else {
                                          Toats.messages(
                                              "Search only by letters or numbers.");
                                        }
                                      } else {
                                        Toats.messages(
                                            "You must be connected to the internet to search");
                                      }
                                    },
                                  )
                                : null,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Observer(
                        builder: (_) {
                          return !listStore.loadingList
                              ? listStore.drugsList.length == 0
                                  ? Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: CustomTexts(
                                        text: listStore.textResultSearch,
                                        textColor: lightBlue,
                                        textAlign: TextAlign.center,
                                        size: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Expanded(child: Observer(
                                      builder: (_) {
                                        return ListView.builder(
                                          itemCount: listStore.drugsList.length,
                                          itemBuilder: (_, index) {
                                            return CardDrug(
                                                listStore.drugsList[index]);
                                          },
                                        );
                                      },
                                    ))
                              : CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(lightBlue));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
