class HotelByCity {
  List<HotelData>? data;

  HotelByCity({this.data});

  HotelByCity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HotelData>[];
      json['data'].forEach((v) {
        data!.add(new HotelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelData {
  int? id;
  int? cityId;
  String? hotelName;
  String? flat;
  String? beds;
  int? actualPrice;
  int? discountPrice;
  String? description;
  String? location;
  String? createdAt;
  String? updatedAt;

  HotelData(
      {this.id,
      this.cityId,
      this.hotelName,
      this.flat,
      this.beds,
      this.actualPrice,
      this.discountPrice,
      this.description,
      this.location,
      this.createdAt,
      this.updatedAt});

  HotelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['cityId'];
    hotelName = json['hotelName'];
    flat = json['flat'];
    beds = json['beds'];
    actualPrice = json['actualPrice'];
    discountPrice = json['discountPrice'];
    description = json['description'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cityId'] = this.cityId;
    data['hotelName'] = this.hotelName;
    data['flat'] = this.flat;
    data['beds'] = this.beds;
    data['actualPrice'] = this.actualPrice;
    data['discountPrice'] = this.discountPrice;
    data['description'] = this.description;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
