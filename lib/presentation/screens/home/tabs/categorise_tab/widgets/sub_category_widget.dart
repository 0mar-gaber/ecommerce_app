import 'package:ecommerce_app/domain/entities/Subcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategory extends StatelessWidget {
  SubcategoryEntity subcategoryEntity ;
   SubCategory({super.key,required this.subcategoryEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.h,
      color: Colors.black12,
      child: Center(child: Text(subcategoryEntity.name??"",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400),)),
    );
  }
}
