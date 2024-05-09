import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  CategoryEntity categoryEntity ;
  CategoryWidget({super.key,required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage:NetworkImage(categoryEntity.image??"") ,
        ),
        SizedBox(height: 8.h,),
        Text(categoryEntity.name??"",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,overflow: TextOverflow.ellipsis,)
      ],
    );
  }
}
