abstract class UtilsHome {
  String? getUrlSvg(String name) {
    Map<String, String> keyUrl = {
      "Кино": "",
      "Спорт": "",
      "Музей": "",
      "Концерты": "",
      "Театры": "",
      "Библиотеки": "",
      "Образование": "",
      "Игры Настольные": " ",
    };
    return keyUrl[name];
  }
}
