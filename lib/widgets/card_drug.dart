import 'package:flutter/material.dart';
import 'package:find_your_medication/main.dart';
import 'package:find_your_medication/models/drugs_model.dart';
import 'package:find_your_medication/screens/infos_drug_screen.dart';
import 'package:find_your_medication/widgets/custom_texts.dart';

class CardDrug extends StatelessWidget {
  CardDrug(this.drug);

  final DrugsModel drug;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: darkBlue.withAlpha(100),
        elevation: 15,
        child: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Image.asset('images/iconCard.png', width: 40),
                      VerticalDivider(
                        width: 15,
                      ),
                      Container(
                        width: 210,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTexts(
                              text: "Name",
                              size: 10,
                              fontWeight: FontWeight.bold,
                              textColor: whiteColor,
                            ),
                            CustomTexts(
                              text: drug.name,
                              size: 12,
                              fontWeight: FontWeight.normal,
                              textColor: whiteColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTexts(
                                        text: "Coverage",
                                        size: 10,
                                        fontWeight: FontWeight.bold,
                                        textColor: whiteColor,
                                      ),
                                      CustomTexts(
                                        text: drug.coverage,
                                        size: 12,
                                        fontWeight: FontWeight.normal,
                                        textColor: whiteColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTexts(
                                        text: "Type",
                                        size: 10,
                                        fontWeight: FontWeight.bold,
                                        textColor: whiteColor,
                                      ),
                                      CustomTexts(
                                        text: drug.type,
                                        size: 12,
                                        fontWeight: FontWeight.normal,
                                        textColor: whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTexts(
                                        text: "Dosage",
                                        size: 10,
                                        fontWeight: FontWeight.bold,
                                        textColor: whiteColor,
                                      ),
                                      CustomTexts(
                                        text: drug.dosage,
                                        size: 12,
                                        fontWeight: FontWeight.normal,
                                        textColor: whiteColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTexts(
                                        text: "Description type",
                                        size: 10,
                                        fontWeight: FontWeight.bold,
                                        textColor: whiteColor,
                                      ),
                                      CustomTexts(
                                        text: drug.type,
                                        size: 12,
                                        fontWeight: FontWeight.normal,
                                        textColor: whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: darkBlue.withAlpha(100),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTexts(
                            text: "All informations ",
                            textColor: whiteColor,
                            fontWeight: FontWeight.bold),
                        Icon(
                          Icons.arrow_forward,
                          color: whiteColor,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InfosDrugScreen(drug)));
                    },
                  ))
            ],
          ),
        ));
  }
}
