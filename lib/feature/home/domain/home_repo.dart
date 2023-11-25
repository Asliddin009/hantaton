abstract class HomeRepo {
  Future fetchCategories();
  Future fetchCategory(String id);
  Future deleteCategory(String id);
  Future createCategory(String name);

  Future fetchEvents();
  Future fetchEvent(String id);
  Future deleteEvent(String id);
  Future createEvent(Map<String,dynamic> args);

  Future getRecommendation();

}

