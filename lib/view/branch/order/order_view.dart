

import 'package:flutter/material.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  List<String> radioButtons = ["In KG" , "In Pieces"];

  late String currentRadioButton = radioButtons[0];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const MyText(title: "App Product"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// title
            const MyText(title: "Add Products",fontSize: 30,fontWeight: FontWeight.w900,color: AppColor.primaryColor,),
            const SizedBox(height: 20,),

            AppTextField(hintText: "Product Name",width: width * 0.26,height: 45,),
            const SizedBox(height: 10,),
            AppTextField(hintText: "Quantity",width: width * 0.26,height: 45,),
            const SizedBox(height: 10,),
            AppTextField(hintText: "Purchase Price",width: width * 0.26,height: 45,),
            const SizedBox(height: 10,),
            AppTextField(hintText: "Sale Price",width: width * 0.26,height: 45,),
            const SizedBox(height: 10,),
            /// Drop down will be here
            Container(
              alignment: Alignment.topRight,
              width: width * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                        title: const MyText(title: "In KG"),
                        value: radioButtons[0],
                        groupValue: currentRadioButton,
                        activeColor: AppColor.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            currentRadioButton = value.toString();
                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: const MyText(title: "In Pieces"),
                        value: radioButtons[1],
                        groupValue: currentRadioButton,
                        activeColor: AppColor.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            currentRadioButton = value.toString();
                          });
                        }),
                  ),
                ],
              ),
            ),

            /// add product button
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16),
                backgroundColor: AppColor.primaryColor
              ),
                onPressed: (){}, child: const MyText(title: "add Products",fontWeight: FontWeight.bold,fontSize: 18,color: AppColor.white,))

          ],
        ),
      ),
    );
  }
}
