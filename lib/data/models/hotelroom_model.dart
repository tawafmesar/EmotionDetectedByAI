class hotelroom_model {
  String? roomId;
  String? roomNumber;
  String? roomType;
  String? roomBeds;
  String? roomPrice;
  String? hotelId;

  hotelroom_model(
      {this.roomId,
        this.roomNumber,
        this.roomType,
        this.roomBeds,
        this.roomPrice,
        this.hotelId});

  hotelroom_model.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    roomNumber = json['room_number'];
    roomType = json['room_type'];
    roomBeds = json['room_beds'];
    roomPrice = json['room_price'];
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['room_number'] = this.roomNumber;
    data['room_type'] = this.roomType;
    data['room_beds'] = this.roomBeds;
    data['room_price'] = this.roomPrice;
    data['hotel_id'] = this.hotelId;
    return data;
  }
}