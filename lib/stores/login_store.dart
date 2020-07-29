import 'package:find_your_medication/controllers/api_methods.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPasword(String value) => password = value;

  @observable
  bool passwordVisibility = false;

  @action
  void showPassword() => passwordVisibility = !passwordVisibility;

  @computed
  bool get verifyEmail => email.contains("@") && email.contains(".com");

  @computed
  bool get verifyPassword => password.length > 6;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  Future<void> loadingLogin() async {
    loading = true;
    if (await ApiMethods.authenticateLogin(email, password)) {
      loggedIn = true;
      email = "";
      password = "";
    } else {
      loggedIn = false;
    }
    loading = false;
  }

  @action
  void logout() {
    loggedIn = false;
  }
}
