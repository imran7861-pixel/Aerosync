class TaxiByCity {
  List<TaxiData>? data;

  TaxiByCity({this.data});

  TaxiByCity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TaxiData>[];
      json['data'].forEach((v) {
        data!.add(TaxiData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaxiData {
  int? id;
  int? cityId;
  int? airportId;
  String? carName;
  String? carNumber;
  String? driverName;
  String? driverNumber;
  String? arrivalTime;
  String? pickUpAddress;
  String? destinationAddress;
  int? totalSeats;
  String? createdAt;
  String? updatedAt;

  TaxiData(
      {this.id,
      this.cityId,
      this.airportId,
      this.carName,
      this.carNumber,
      this.driverName,
      this.driverNumber,
      this.arrivalTime,
      this.pickUpAddress,
      this.destinationAddress,
      this.totalSeats,
      this.createdAt,
      this.updatedAt});

  TaxiData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['cityId'];
    airportId = json['airportId'];
    carName = json['carName'];
    carNumber = json['carNumber'];
    driverName = json['driverName'];
    driverNumber = json['driverNumber'];
    arrivalTime = json['arrivalTime'];
    pickUpAddress = json['pickUpAddress'];
    destinationAddress = json['destinationAddress'];
    totalSeats = json['totalSeats'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cityId'] = cityId;
    data['airportId'] = airportId;
    data['carName'] = carName;
    data['carNumber'] = carNumber;
    data['driverName'] = driverName;
    data['driverNumber'] = driverNumber;
    data['arrivalTime'] = arrivalTime;
    data['pickUpAddress'] = pickUpAddress;
    data['destinationAddress'] = destinationAddress;
    data['totalSeats'] = totalSeats;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
