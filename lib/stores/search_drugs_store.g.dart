// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_drugs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchDrugsStore on _SearchDrugsStore, Store {
  Computed<bool> _$isSearchValidComputed;

  @override
  bool get isSearchValid =>
      (_$isSearchValidComputed ??= Computed<bool>(() => super.isSearchValid,
              name: '_SearchDrugsStore.isSearchValid'))
          .value;

  final _$nameDrugAtom = Atom(name: '_SearchDrugsStore.nameDrug');

  @override
  String get nameDrug {
    _$nameDrugAtom.reportRead();
    return super.nameDrug;
  }

  @override
  set nameDrug(String value) {
    _$nameDrugAtom.reportWrite(value, super.nameDrug, () {
      super.nameDrug = value;
    });
  }

  final _$loadingListAtom = Atom(name: '_SearchDrugsStore.loadingList');

  @override
  bool get loadingList {
    _$loadingListAtom.reportRead();
    return super.loadingList;
  }

  @override
  set loadingList(bool value) {
    _$loadingListAtom.reportWrite(value, super.loadingList, () {
      super.loadingList = value;
    });
  }

  final _$textResultSearchAtom =
      Atom(name: '_SearchDrugsStore.textResultSearch');

  @override
  String get textResultSearch {
    _$textResultSearchAtom.reportRead();
    return super.textResultSearch;
  }

  @override
  set textResultSearch(String value) {
    _$textResultSearchAtom.reportWrite(value, super.textResultSearch, () {
      super.textResultSearch = value;
    });
  }

  final _$searchDrugsAsyncAction = AsyncAction('_SearchDrugsStore.searchDrugs');

  @override
  Future<void> searchDrugs(BuildContext context) {
    return _$searchDrugsAsyncAction.run(() => super.searchDrugs(context));
  }

  final _$_SearchDrugsStoreActionController =
      ActionController(name: '_SearchDrugsStore');

  @override
  void setNameDrug(String value) {
    final _$actionInfo = _$_SearchDrugsStoreActionController.startAction(
        name: '_SearchDrugsStore.setNameDrug');
    try {
      return super.setNameDrug(value);
    } finally {
      _$_SearchDrugsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextResultSearch(String value) {
    final _$actionInfo = _$_SearchDrugsStoreActionController.startAction(
        name: '_SearchDrugsStore.setTextResultSearch');
    try {
      return super.setTextResultSearch(value);
    } finally {
      _$_SearchDrugsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearList() {
    final _$actionInfo = _$_SearchDrugsStoreActionController.startAction(
        name: '_SearchDrugsStore.clearList');
    try {
      return super.clearList();
    } finally {
      _$_SearchDrugsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameDrug: ${nameDrug},
loadingList: ${loadingList},
textResultSearch: ${textResultSearch},
isSearchValid: ${isSearchValid}
    ''';
  }
}
