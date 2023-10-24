import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'custom_icon.dart';

class ConstIcon {
  static List<CustomIcon> getListIcons() {
    List<CustomIcon> list = [
      CustomIcon(name: "earth", iconData: FrinoIcons.f_earth),
      CustomIcon(name: "phone classic", iconData: FrinoIcons.f_phone_classic),
      CustomIcon(name: "iphone", iconData: FrinoIcons.f_iphone),
      CustomIcon(name: "euro circle", iconData: FrinoIcons.f_euro_circle),
      CustomIcon(name: "private_mode", iconData: FrinoIcons.f_private_mode),
      CustomIcon(name: "plane", iconData: FrinoIcons.f_plane),
      CustomIcon(name: "train", iconData: FrinoIcons.f_train),
      CustomIcon(name: "truck", iconData: FrinoIcons.f_truck),
      CustomIcon(name: "shop", iconData: FrinoIcons.f_shop),
      CustomIcon(name: "cart", iconData: FrinoIcons.f_cart),
      CustomIcon(name: "chart line", iconData: FrinoIcons.f_chart_line),
      CustomIcon(name: "cash", iconData: FrinoIcons.f_cash__1_),
      CustomIcon(name: "piggy bank", iconData: FrinoIcons.f_piggy_bank__1_),
      CustomIcon(name: "cutlery", iconData: FrinoIcons.f_cutlery),
      CustomIcon(name: "meat", iconData: FrinoIcons.f_meat),
      CustomIcon(name: "wine", iconData: FrinoIcons.f_wine),
      CustomIcon(name: "book", iconData: FrinoIcons.f_book),
      CustomIcon(name: "palm", iconData: FrinoIcons.f_palm),
      CustomIcon(
          name: "exclamation mark triangle",
          iconData: FrinoIcons.f_exclamation_mark_triangle),
      CustomIcon(name: "medicine", iconData: FrinoIcons.f_medicine),
      CustomIcon(name: "gavel", iconData: FrinoIcons.f_gavel),
      CustomIcon(name: "gym", iconData: FrinoIcons.f_gym),
      CustomIcon(name: "birthday", iconData: FrinoIcons.f_birthday),
      CustomIcon(name: "ball", iconData: FrinoIcons.f_ball),
      CustomIcon(name: "bicycle", iconData: FrinoIcons.f_bicycle),
      CustomIcon(name: "mug", iconData: FrinoIcons.f_mug),
      CustomIcon(name: "bucket", iconData: FrinoIcons.f_bucket),
      CustomIcon(name: "lightning", iconData: FrinoIcons.f_lightning),
      CustomIcon(name: "file", iconData: FrinoIcons.f_file),
      CustomIcon(name: "group", iconData: FrinoIcons.f_group),
      CustomIcon(name: "female", iconData: FrinoIcons.f_female),
      CustomIcon(name: "male", iconData: FrinoIcons.f_male),
      CustomIcon(name: "heart", iconData: FrinoIcons.f_heart),
      CustomIcon(name: "face-neutral", iconData: FrinoIcons.f_face_neutral),
    ];

    return list;
  }

  static IconData? getIconData(String name) {
    List<CustomIcon> listCustomIcon = getListIcons();
    CustomIcon data =
        listCustomIcon.firstWhere((element) => element.name == name);
    return data.iconData;
  }

  static int getIconIndexByName(String name) {
    List<CustomIcon> listCustomIcon = getListIcons();
    return listCustomIcon.indexWhere((element) => element.name == name);
  }
}
