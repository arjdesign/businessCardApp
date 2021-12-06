// define how the contact infor in the business card would look like. 

// import io to use File datatype
import 'dart:io';

class BusinessCardLocation {
  final double latitude;
  final double longitude;
  final String address;

  BusinessCardLocation({
 required this.latitude,   required this.longitude,   required this.address,
  });


}

class BusinessCard {
  final String id;
   final String name;
  // final String position;
  // final String companyName;
  // final BusinessCardLocation location;
  final File image;

  // constructor 

  BusinessCard({
   required this.id,
    required  this.name,
    // required this.position,
    // required this.companyName,
    // required this. location,
   required  this.image
  });

}