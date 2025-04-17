class FlightByCity {
  FlightData? data;

  FlightByCity({this.data});

  FlightByCity.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new FlightData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FlightData {
  int? id;
  String? flightNumber;
  String? airplaneId;
  int? cityId;
  String? departureAirportId;
  String? arrivalAirportId;
  String? arrivalCityName;
  String? departureCityName;
  String? arrivalAirportName;
  String? departureAirportName;
  String? arrivalTime;
  String? departureTime;
  String? price;
  Null? boardingGate;
  String? totalSeats;
  String? createdAt;
  String? updatedAt;

  FlightData(
      {this.id,
      this.flightNumber,
      this.airplaneId,
      this.cityId,
      this.departureAirportId,
      this.arrivalAirportId,
      this.arrivalCityName,
      this.departureCityName,
      this.arrivalAirportName,
      this.departureAirportName,
      this.arrivalTime,
      this.departureTime,
      this.price,
      this.boardingGate,
      this.totalSeats,
      this.createdAt,
      this.updatedAt});

  FlightData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flightNumber = json['flightNumber'];
    airplaneId = json['airplaneId'];
    cityId = json['cityId'];
    departureAirportId = json['departureAirportId'];
    arrivalAirportId = json['arrivalAirportId'];
    arrivalCityName = json['arrivalCityName'];
    departureCityName = json['departureCityName'];
    arrivalAirportName = json['arrivalAirportName'];
    departureAirportName = json['departureAirportName'];
    arrivalTime = json['arrivalTime'];
    departureTime = json['departureTime'];
    price = json['price'];
    boardingGate = json['boardingGate'];
    totalSeats = json['totalSeats'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flightNumber'] = this.flightNumber;
    data['airplaneId'] = this.airplaneId;
    data['cityId'] = this.cityId;
    data['departureAirportId'] = this.departureAirportId;
    data['arrivalAirportId'] = this.arrivalAirportId;
    data['arrivalCityName'] = this.arrivalCityName;
    data['departureCityName'] = this.departureCityName;
    data['arrivalAirportName'] = this.arrivalAirportName;
    data['departureAirportName'] = this.departureAirportName;
    data['arrivalTime'] = this.arrivalTime;
    data['departureTime'] = this.departureTime;
    data['price'] = this.price;
    data['boardingGate'] = this.boardingGate;
    data['totalSeats'] = this.totalSeats;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
