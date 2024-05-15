class placeimage_model {
  String? placeimagesId;
  String? placeId;
  String? placeimagesPath;

  placeimage_model({this.placeimagesId, this.placeId, this.placeimagesPath});

  placeimage_model.fromJson(Map<String, dynamic> json) {
    placeimagesId = json['placeimages_id'];
    placeId = json['place_id'];
    placeimagesPath = json['placeimages_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeimages_id'] = this.placeimagesId;
    data['place_id'] = this.placeId;
    data['placeimages_path'] = this.placeimagesPath;
    return data;
  }
}