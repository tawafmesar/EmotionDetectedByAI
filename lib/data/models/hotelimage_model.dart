class hotelimage_model {
  String? hotelimagesId;
  String? hotelId;
  String? hotelimagesPath;

  hotelimage_model({this.hotelimagesId, this.hotelId, this.hotelimagesPath});

  hotelimage_model.fromJson(Map<String, dynamic> json) {
    hotelimagesId = json['hotelimages_id'];
    hotelId = json['hotel_id'];
    hotelimagesPath = json['hotelimages_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotelimages_id'] = this.hotelimagesId;
    data['hotel_id'] = this.hotelId;
    data['hotelimages_path'] = this.hotelimagesPath;
    return data;
  }
}