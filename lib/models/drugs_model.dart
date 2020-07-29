class DrugsModel {
  String _coverage;
  String _typeDescription;
  String _dosage;
  String _otcRxIndicator;
  String _gpi12;
  double _strength;
  String _gpi2;
  String _strengthUnit;
  String _type;
  String _name;
  String _gpi4;
  String _gpi14;

  String get coverage => _coverage;

  set coverage(String value) {
    _coverage = value;
  }

  DrugsModel(
      this._coverage,
      this._typeDescription,
      this._dosage,
      this._otcRxIndicator,
      this._gpi12,
      this._strength,
      this._gpi2,
      this._strengthUnit,
      this._type,
      this._name,
      this._gpi4,
      this._gpi14);

  DrugsModel.empty();

  String get gpi2 => _gpi2;

  set gpi2(String value) {
    _gpi2 = value;
  }

  String get typeDescription => _typeDescription;

  set typeDescription(String value) {
    _typeDescription = value;
  }

  String get dosage => _dosage;

  set dosage(String value) {
    _dosage = value;
  }

  String get otcRxIndicator => _otcRxIndicator;

  set otcRxIndicator(String value) {
    _otcRxIndicator = value;
  }

  String get gpi12 => _gpi12;

  set gpi12(String value) {
    _gpi12 = value;
  }

  double get strength => _strength;

  set strength(double value) {
    _strength = value;
  }

  String get strengthUnit => _strengthUnit;

  set strengthUnit(String value) {
    _strengthUnit = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get gpi4 => _gpi4;

  set gpi4(String value) {
    _gpi4 = value;
  }

  String get gpi14 => _gpi14;

  set gpi14(String value) {
    _gpi14 = value;
  }
}
