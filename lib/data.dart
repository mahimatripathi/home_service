import 'package:home_service/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category=[];

  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "";
  categoryModel.image="images/paintbrush.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "";
  categoryModel.image="images/support.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "";
  categoryModel.image="images/mop.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "";
  categoryModel.image="images/cargo-truck.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();


  categoryModel.categoryName = "";
  categoryModel.image="images/electrician.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "";
  categoryModel.image="images/carpenter.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();


  categoryModel.categoryName = "";
  categoryModel.image="images/civil-engineering.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

// categoryModel.categoryName = " ";
// categoryModel.image="images/tesla.jpeg";
// category.add(categoryModel);
// categoryModel = new CategoryModel();
//
// categoryModel.categoryName = " ";
// categoryModel.image="images/usa.jpeg";
// category.add(categoryModel);
// categoryModel = new CategoryModel();

  return category;
}