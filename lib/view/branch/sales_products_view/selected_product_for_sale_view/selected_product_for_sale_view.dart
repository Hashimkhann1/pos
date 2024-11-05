import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';

import '../sale_invice_view/sale_invice_view.dart';

class SelectedProductForSaleView extends StatelessWidget {
  const SelectedProductForSaleView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: width,
          height: height * 0.76,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.black.withOpacity(0.5))
          ),
          // color: Colors.black,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// products headings
              Row(
                children: [
                  /// product name
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.21,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                        ),
                    ),
                    child: const MyText(
                      title: "Product Name",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// price
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                          left: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                        )),
                    child: const MyText(
                      title: "Price",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// qty
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.03,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: AppColor.black.withOpacity(0.4)),
                            left: BorderSide(color: AppColor.black.withOpacity(0.4)),
                          )),
                      child: const MyText(
                        title: "Qty",
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Discount
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.09,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                          left: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                        )),
                    child: const MyText(
                      title: "Discount",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// total
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.10,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                          right: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                          bottom: BorderSide(
                              color: AppColor.black.withOpacity(0.4)),
                        )),
                    child: const MyText(
                      title: "Total",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// delete Icon
                  Container(
                      alignment: Alignment.center,
                      width: width * 0.03,
                      height: height * 0.03,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: AppColor.black.withOpacity(0.4)),
                          )),
                      child: const MyText(
                        title: "Del",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),

              /// selected products
              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context , index) {
                        return Row(
                          children: [
                            /// product name
                            Container(
                              alignment: Alignment.center,
                              width: width * 0.21,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: AppColor.black.withOpacity(0.4)),
                                ),
                              ),
                              child: MyText(
                                title: "Product Na",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            /// price
                            Container(
                              alignment: Alignment.center,
                              width: width * 0.08,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: AppColor.black.withOpacity(0.4)),
                                  right: BorderSide(color: AppColor.black.withOpacity(0.4)),
                                ),
                              ),
                              child: MyText(
                                title: "Sale P",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),


                            /// qty
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.04,
                                child: AppTextField(
                                  // controller: qtyController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                                  ],
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                  // ],
                                  hintText: "1",

                                  // borderRadius: 0,
                                  // borderSide: BorderSide(color: AppColor.black.withOpacity(0.4)),
                                ),
                              ),
                            ),

                            /// Discount
                            Container(
                              alignment: Alignment.center,
                              width: width * 0.09,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: AppColor.black.withOpacity(0.4)),
                                  right: BorderSide(color: AppColor.black.withOpacity(0.4)),
                                ),
                              ),
                              child: MyText(
                                title: '0',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            /// total
                            Container(
                              alignment: Alignment.center,
                              width: width * 0.10,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color:AppColor.black.withOpacity(0.4)),
                                  right: BorderSide(color: AppColor.black.withOpacity(0.4)),
                                ),
                              ),
                              child: MyText(
                                title: "Total P",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            /// delete Icon
                            Container(
                              alignment: Alignment.center,
                              width: width * 0.03,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color:AppColor.black.withOpacity(0.4)),
                                ),
                              ),
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        );
                      })
              ),
            ],
          ),
        ),

        /// Sales Invice
        SaleInviceView()

      ],
    );
  }
}
