import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinInformation {
  String pinPath;
  String avatarPath;
  LatLng location;
  String locationName;
  Color labelColor;

  PinInformation(
      {this.pinPath = '',
      this.avatarPath = '',
      required this.location,
      this.locationName = '',
      this.labelColor = Colors.blue});
}
