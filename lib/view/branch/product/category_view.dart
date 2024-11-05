import 'package:flutter/material.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const MyText(title: "Product Categories"),
        ),
        body: Center(
          child: Container(
              width: 600,
              height: height * 0.5,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.primaryColor.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Column(children: [
                const SizedBox(height: 10,),
                /// Add category title
                const MyText(title: "Add Category",fontSize: 30,fontWeight: FontWeight.w900,color: AppColor.primaryColor,),
                const SizedBox(
                  height: 20,
                ),

                /// text field
                const AppTextField(
                  hintText: "Product Category Name",
                  width: 580,
                  height: 40,
                ),
                const SizedBox(
                  height: 12,
                ),

                /// add category button
                TextButton(
                    style: TextButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        backgroundColor: AppColor.primaryColor),
                    onPressed: () {},
                    child: const MyText(
                      title: "Add Category",
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColor.white,
                    )),
                const SizedBox(
                  height: 10,
                ),

                /// all Categories
                Wrap(
                    children: List.generate(10, (index) {
                  return Container(
                    // width: MediaQuery.of(context).size.width * 0.09,
                    width: 190,
                    height: 36,
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //  created class number
                        const MyText(
                          title: "Product Category",
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        // created class and cancel icon divider
                        const VerticalDivider(
                          color: AppColor.white,
                          thickness: 2,
                          endIndent: 6,
                          indent: 6,
                        ),
                        // created class cancel icon
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.cancel_outlined,
                            color: AppColor.white,
                          ),
                        )
                      ],
                    ),
                  );
                })),
              ])),
        ));
  }
}
