import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants_pathes/icons_paths.dart';
import '../styles.dart';

AppBar buildAppBar({
  final String? title,
  VoidCallback? onTap,
}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title ?? '',
      style: Styles.style25,
    ),
    leading: GestureDetector(
      onTap: onTap ?? () {},
      child: Center(
        child: SvgPicture.asset(
          IconsPaths.arrowBackIcon,
        ),
      ),
    ),
  );
}
