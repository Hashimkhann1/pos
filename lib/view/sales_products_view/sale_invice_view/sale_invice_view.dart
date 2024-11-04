

import 'package:flutter/material.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';

class SaleInviceView extends StatelessWidget {
  const SaleInviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Total products
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: "Total Selected Products",fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5),),
              MyText(title: "10",fontSize: 30,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5))
            ],
          ),

          /// Total Selected Products price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: "Total Price",fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5),),
              MyText(title: "30000",fontSize: 30,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5))
            ],
          ),

          /// sell button
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 16),
                backgroundColor: AppColor.black.withOpacity(0.5)
            ),
              onPressed: (){},
              child: MyText(title: "Sell",fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.white,)
          )
        ],
      ),
    );
  }
}
