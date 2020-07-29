import 'package:flutter/cupertino.dart';
import 'package:find_your_medication/controllers/api_methods.dart';
import 'package:find_your_medication/models/drugs_model.dart';
import 'package:mobx/mobx.dart';

part 'search_drugs_store.g.dart';

class SearchDrugsStore = _SearchDrugsStore with _$SearchDrugsStore;

abstract class _SearchDrugsStore with Store {
  @observable
  String nameDrug = "";

  @observable
  bool loadingList = false;

  @observable
  String textResultSearch = "Find all informations about your medicines...";

  @action
  void setNameDrug(String value) => nameDrug = value;

  @action
  void setTextResultSearch(String value) => textResultSearch = value;

  ObservableList<DrugsModel> drugsList = ObservableList<DrugsModel>();

  @action
  Future<void> searchDrugs(BuildContext context) async {
    loadingList = true;
    List<DrugsModel> filterList;
    await ApiMethods.getDrugsList(nameDrug, 1, 1, context);
    if (ApiMethods.lastPage != 0) {
      for (int i = 1; i <= ApiMethods.lastPage; i++) {
        filterList = await ApiMethods.getDrugsList(nameDrug, i, 100, context);
        if (filterList.isNotEmpty) {
          for (DrugsModel d in filterList) {
            drugsList.add(d);
          }
        } else {
          i = ApiMethods.lastPage + 1;
        }
      }
    } else {
      textResultSearch = "Sorry, we couldn't find any results for: $nameDrug";
    }
    loadingList = false;
  }

  @computed
  bool get isSearchValid => nameDrug.length >= 3;

  @action
  void clearList() {
    drugsList.clear();
  }
}
