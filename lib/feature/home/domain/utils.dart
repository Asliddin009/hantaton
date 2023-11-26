abstract class UtilsHome {
  static String? getUrlSvg(String name) {
    Map<String, String> keyUrl = {
      "Кино": "assets/table_game.svg",
      "Спорт": "assets/sport.svg",
      "Музей": "assets/museum.svg",
      "Концерты": "assets/concert.svg",
      "Театры": "assets/theatre.svg",
      "Библиотеки": "assets/book.svg",
      "Образование": "assets/school.svg",
      "Игры Настольные": "assets/movie.svg",
    };
    return keyUrl[name];
  }
}
