import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:find_your_medication/main.dart';
import 'package:find_your_medication/models/drugs_model.dart';
import 'package:find_your_medication/widgets/custom_column_infos.dart';
import 'package:find_your_medication/widgets/custom_texts.dart';

class InfosDrugScreen extends StatelessWidget {

  InfosDrugScreen(this.drug);
  final DrugsModel drug;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor.withAlpha(100),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: lightBlue),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: CustomTexts(
                text: "About the medicine",
                textColor: lightBlue,
                fontWeight: FontWeight.bold,
                size: 24,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child:
                              CustomColumnInfos(title: "Name", info: drug.name),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomColumnInfos(title: "Dosage", info: drug.dosage),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomColumnInfos(
                        title: "Description type", info: drug.typeDescription),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomColumnInfos(
                            title: "Coverage", info: drug.coverage),
                        CustomColumnInfos(title: "Type", info: drug.type),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomColumnInfos(title: "GPI2", info: drug.gpi2),
                        CustomColumnInfos(title: "GPI12", info: drug.gpi12),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomColumnInfos(title: "GPI4", info: drug.gpi4),
                        CustomColumnInfos(title: "GPI14", info: drug.gpi14),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomColumnInfos(
                          title: "Strength",
                          info: drug.strength.toString(),
                        ),
                        CustomColumnInfos(
                            title: "Strength unit",
                            info: drug.strengthUnit.isEmpty
                                ? "-"
                                : drug.strengthUnit),
                        CustomColumnInfos(
                            title: "OTC x RX", info: drug.otcRxIndicator),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
