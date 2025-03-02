import 'package:home_service/slider_model.dart';

List<sliderModel> getSliders(){
  List<sliderModel> slider=[];

  sliderModel categoryModel = new sliderModel();


  categoryModel.name = "";
  categoryModel.image="images/Slider1.png";
  slider.add(categoryModel);
  categoryModel = new sliderModel();

  categoryModel.name = "";
  categoryModel.image="images/Slider2.png";
  slider.add(categoryModel);
  categoryModel = new sliderModel();


// categoryModel.categoryName = " ";
// categoryModel.image="images/tesla.jpeg";
// category.add(categoryModel);
// categoryModel = new CategoryModel();
//
// categoryModel.categoryName = " ";
// categoryModel.image="images/usa.jpeg";
// category.add(categoryModel);
// categoryModel = new CategoryModel();

  return slider;
}