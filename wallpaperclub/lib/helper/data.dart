import 'package:flutter/foundation.dart';
import 'package:wallpaperclub/modal/category_model.dart';


String apiKEY = "2efc3571549fc0e7282bf364453445ec79339cc7";

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel  = new CategoryModel();
  
  //1
 categoryModel.categoryName = "bikes";
 categoryModel.imageUrl="https://images.unsplash.com/photo-1558981403-c5f9899a28bc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80";
 
 category.add(categoryModel);
  categoryModel=new CategoryModel();
  
  //2

   
 categoryModel.categoryName = "Animals";
 categoryModel.imageUrl="https://images.unsplash.com/photo-1601758282760-b6cc3d07523d?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(categoryModel);
  categoryModel=new CategoryModel();
  
  //3

  categoryModel.categoryName = "girls";
 categoryModel.imageUrl="https://images.unsplash.com/photo-1503104834685-7205e8607eb9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(categoryModel);
  categoryModel=new CategoryModel();
  
  //4
  categoryModel.categoryName = "boys";
 categoryModel.imageUrl="https://images.unsplash.com/photo-1502307100811-6bdc0981a85b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Ym95c3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
  categoryModel=new CategoryModel();
  
  //5
  categoryModel.categoryName = "nature";
 categoryModel.imageUrl="https://images.unsplash.com/photo-1506761121438-a89f7835bae2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80";
  category.add(categoryModel);
  categoryModel=new CategoryModel();
  
  //6
  categoryModel.categoryName = "flowers";
 categoryModel.imageUrl="https://images.unsplash.com/photo-1519378058457-4c29a0a2efac?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=648&q=80";
  category.add(categoryModel);
  categoryModel=new CategoryModel();
 
  return category;
  }

