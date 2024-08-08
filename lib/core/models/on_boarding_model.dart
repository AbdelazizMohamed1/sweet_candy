class OnBoardingModel {
  String? id;
  String? imageUrl;
  String? mainTitle;
  String? details;
  String? createdAt;

  OnBoardingModel({
    this.id,
    this.imageUrl,
    this.mainTitle,
    this.details,
    this.createdAt,
  });

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    mainTitle = json['main_title'];
    details = json['details'];
    createdAt = json['created_at'];
  }


}
