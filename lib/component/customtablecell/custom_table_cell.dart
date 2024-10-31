import 'package:flutter/material.dart';

import '../../res/color/app_color.dart';

class HeaderCustomTableCell extends StatelessWidget {
  const HeaderCustomTableCell({
    required this.title,
    this.color = AppColor.white,
    this.fontWeight = FontWeight.bold,
    super.key,
  });
  final String title;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        height: 40,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}



class CustomTableCell extends StatelessWidget {
  const CustomTableCell({
    required this.title,
    this.color = AppColor.black,
    this.fontWeight = FontWeight.w400,
    super.key,
  });
  final String title;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        height: 40,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
