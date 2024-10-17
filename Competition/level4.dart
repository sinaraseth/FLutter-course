class Distance {
  final double _meter;

  Distance.cms(double cms) : _meter = cms / 100;
  Distance.meter(double meters) : _meter = meters;
  Distance.kms(double kms) : _meter = kms * 1000;

  double get cms => _meter * 100;
  double get meter => _meter;
  double get kms => _meter / 1000;

  Distance operator +(Distance newDistance ){
    return Distance.meter(_meter + newDistance._meter);
  }

  @override
  String toString() {
    return '$_meter.toString()';
  }
}

void main(List<String> args) {
  // Distance d1 = Distance.cms(1000.0);
  Distance d1 = Distance.cms(1000);
  Distance d2 = Distance.meter(1000);
  Distance d4 = Distance.meter(2);
  Distance d3 = d1 + d2 + d4;

  print('Distance d1 in kms: ${d3.kms}');

}