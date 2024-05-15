class places_model {
  String? placeId;
  String? placeName;
  String? placeAbout;
  String? placesAddress;
  String? placeImg;

  places_model(
      {this.placeId, this.placeName, this.placeAbout, this.placesAddress, this.placeImg});

  places_model.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    placeName = json['place_name'];
    placeAbout = json['place_about'];
    placesAddress = json['places_address'];
    placeImg = json['place_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['place_name'] = this.placeName;
    data['place_about'] = this.placeAbout;
    data['places_address'] = this.placesAddress;
    data['place_img'] = this.placeImg;
    return data;
  }
}