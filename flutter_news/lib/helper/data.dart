import 'package:flutter_news/models/category_model.dart';


  List<CategoryModel> getCategory() {
      List<CategoryModel> myCategories = [
    CategoryModel(categoryName: 'Business',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoAbHEx1czWHId5hKHzkkV7yU_IgfAfwRrMA&usqp=CAU'),
    CategoryModel(categoryName: 'Entertainment',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr9udPTd6mSHwMVwrHp0dT65B2MQeeTw2w8w&usqp=CAU'),
    CategoryModel(categoryName: 'Health',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7xavd4hnB1v8fiihWJw_TiV8CC_p8u7dxQg&usqp=CAU'),
    CategoryModel(categoryName: 'Science',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR6qrPUoXYj2RLmEU1C-XwQL_pgN6ZfXVsZA&usqp=CAU')
  ];
return myCategories;
  }