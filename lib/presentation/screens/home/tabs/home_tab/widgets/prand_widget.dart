import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
  BrandEntity brandEntity ;
  BrandWidget({super.key,required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration:  BoxDecoration(

            border: const Border(),
              image: DecorationImage(
                  image: NetworkImage(brandEntity.image??"")
              )),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          brandEntity.name??"",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
