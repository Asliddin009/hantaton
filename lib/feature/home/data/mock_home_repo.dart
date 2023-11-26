import 'package:hantaton_app/feature/home/domain/entity/category/category_entity.dart';
import 'package:hantaton_app/feature/posts/domain/entity/post/post_entity.dart';

import '../domain/entity/event/event_entity.dart';
import '../domain/home_repo.dart';

class MockHomeRepo {
  //Для Слайд Эффекта
  List<CategoryEntity> fetchCategories() {
    return [
      const CategoryEntity(name: "Кино"),
      const CategoryEntity(name: "Спорт"),
      const CategoryEntity(name: "Музей"),
      const CategoryEntity(name: "Концерты"),
      const CategoryEntity(name: "Театры"),
      const CategoryEntity(name: "Библиотеки"),
      const CategoryEntity(name: "Образование"),
      const CategoryEntity(name: "Игры Настольные"),
    ];
  }

  List<EventEntity> feachEvent() {
    return [
      const EventEntity(
        name: 'Югорский форум молодых специалистов',description: ''
      ),
      const EventEntity(
        name: 'Поход в горы',description: ''
      ),
      const EventEntity(
        name: 'Волейбол в ЮГУ',description: ''
      ),
      const EventEntity(
        name: 'Хакатон',description: ''
      ),
      const EventEntity(
        name: 'Экскурсия в музее нефти и газа ',description: ''
      )
    ];
  }
}
