import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6%20-%20S1%20-%20PRACTICE-%20Lists,%20Pass%20Functions/EXERCISE-2/model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/w5-s2/aang.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ]);

ProfileData sethPrfile = ProfileData(
    name: "Seth",
    position: "Flutter Developer",
    avatarUrl: 'assets/w5-s2/Profile.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+855 977510588"),
      TileData(
          icon: Icons.location_on,
          title: "Address",
          value: "Phnom PenhCambodia"),
      TileData(
          icon: Icons.email,
          title: "Mail",
          value: "seth.sinara@student.cedt.edu.kh"),
      TileData(icon: Icons.school, title: 'School', value: 'CADT'),
      TileData(icon: Icons.favorite, title: 'Gender', value: 'Male'),
      TileData(
          icon: Icons.add_reaction_outlined,
          title: 'reaction on Flutter ',
          value: ';-)'),
    ]);
