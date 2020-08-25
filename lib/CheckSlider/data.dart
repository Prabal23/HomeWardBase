import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}

List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Maintain and share an accurate and up-to-date-information recorded on the child in care.");
  sliderModel.setTitle("Stay in the loop");
  sliderModel.setImageAssetPath("assets/image/sp1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Schedule and keep track of all future appointments and other events in the child's life.");
  sliderModel.setTitle("See what's coming");
  sliderModel.setImageAssetPath("assets/image/sp2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Communicate and collaborate easily with everyone involved in the child's case.");
  sliderModel.setTitle("Work as a team");
  sliderModel.setImageAssetPath("assets/image/sp3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}