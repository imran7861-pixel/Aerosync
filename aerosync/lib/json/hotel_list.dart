List<Map<String, dynamic>> hotelList = [
  {
    'image': 'assets/images/one.jpg',
    'place': 'Open Space',
    'destination': 'London',
    'price': 25
  },
  {
    'image': 'assets/images/two.jpg',
    'place': 'Global Will',
    'destination': 'London',
    'price': 40
  },
];
class mmt{
  String _image,_name;

  mmt(this._image, this._name);

  get name => _name;

  String get image => _image;
}