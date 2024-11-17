import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';
 
ProfileData rajanaProfile = ProfileData(
    name: "Povrajana PEN",
    position: "Flutter Developer",
    myUrl: 'assets/w6-s1/toph.jpeg',
    tiles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "povrajana.pen@cadt.edu"),
      TileData( icon: Icons.web, title: "Website", value: "www.avatarthelastairbender.com"),
      TileData(icon: Icons.tiktok, title: "Tiktok", value: "@atla"),
    ]);
  