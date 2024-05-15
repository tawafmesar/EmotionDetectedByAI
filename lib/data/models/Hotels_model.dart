class hotels_model {
  String? hotelId;
  String? hotelName;
  String? hotelDesc;
  String? hotelAddress;
  String? hotelPrice;
  String? hotelImage;
  String? placeId;

  hotels_model(
      {this.hotelId,
        this.hotelName,
        this.hotelDesc,
        this.hotelAddress,
        this.hotelPrice,
        this.hotelImage,
        this.placeId});

  hotels_model.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    hotelName = json['hotel_name'];
    hotelDesc = json['hotel_desc'];
    hotelAddress = json['hotel_address'];
    hotelPrice = json['hotel_price'];
    hotelImage = json['hotel_image'];
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel_id'] = this.hotelId;
    data['hotel_name'] = this.hotelName;
    data['hotel_desc'] = this.hotelDesc;
    data['hotel_address'] = this.hotelAddress;
    data['hotel_price'] = this.hotelPrice;
    data['hotel_image'] = this.hotelImage;
    data['place_id'] = this.placeId;
    return data;
  }
}