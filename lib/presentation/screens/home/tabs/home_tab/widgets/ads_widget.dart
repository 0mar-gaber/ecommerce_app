import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsWidget extends StatelessWidget {
  String adUrl ;
   AdsWidget({super.key,required this.adUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(adUrl),
          fit: BoxFit.fitWidth
        )
      ),
    );
  }
}
