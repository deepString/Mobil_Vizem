import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> isFirstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    if (runned == null) {
      return true;
    } else {
      return false;
    }
  }

  firstLaunched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool("runned", true);
  }

  loadUser() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    var email = storage.getString("Email");

    if (email == null) {
      return null;
    } else {
      return {"Email": email};
    }
  }

  saveUser({required String email}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString("Email", email);
  }

  setConfig({String? language, bool? darkMode}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    if (language != null) {
      await storage.setString("Language", language);
    }

    if (darkMode != null) {
      await storage.setBool("DarkMode", darkMode);
    }
  }

  getConfig() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    return {
      "Language": storage.getString("Language"),
      "DarkMode": storage.getBool("DarkMode"),
    };
  }

  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }

  logoutClear() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    await storage.remove("Email");
    await storage.remove("Language");
    await storage.remove("DarkMode");
  }
}
