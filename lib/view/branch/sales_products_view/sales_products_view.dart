// import 'package:flutter/material.dart';
// import 'package:pos/component/app_text_field.dart';
// import 'package:pos/component/my_text.dart';
// import 'package:pos/res/color/app_color.dart';
//
// import 'all_products_and_total_view/all_products_and_total_view.dart';
//
//
// class SalesProductsView extends StatefulWidget {
//   final Function(Product) onProductSelected;
//
//   const SalesProductsView({Key? key, required this.onProductSelected})
//       : super(key: key);
//
//   @override
//   State<SalesProductsView> createState() => _SalesProductsViewState();
// }
//
// class _SalesProductsViewState extends State<SalesProductsView> {
//   List<Product> addProduct = [];
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     // return Container(
//     //     width: width < 1300 ? width * 0.45 : width * 0.35,
//     //     decoration: BoxDecoration(color: AppColor.white,border: Border.all(color: AppColor.grey.withOpacity(0.4))),
//     //     margin: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
//     //     child: Padding(
//     //       padding: EdgeInsets.symmetric(horizontal: 7, vertical: height * 0.01),
//     //       child: Column(
//     //         children: [
//     //            const Row(
//     //             children: [
//     //               Expanded(
//     //                   flex: 3,
//     //                   child: AppTextField(
//     //                     hintText: "Search products",
//     //                     // borderRadius: 0,
//     //                   )),
//     //             ],
//     //           ),
//     //           SizedBox(height: height * 0.02,),
//     //
//     //           /// All products
//     //           Expanded (
//     //             child: SingleChildScrollView(
//     //               scrollDirection: width < 1160 ? Axis.horizontal : Axis.vertical,
//     //               child: SingleChildScrollView(
//     //                 scrollDirection: Axis.vertical,
//     //                 child: SizedBox(
//     //                   width: width < 1160 ? width * 0.54 : width,
//     //                   child: DataTable(
//     //                     columns: [
//     //                       DataColumn(
//     //                         label: MyText(
//     //                           title: '#',
//     //                           fontWeight: FontWeight.w600,
//     //                           fontSize: 14,
//     //                           color: AppColor.black.withOpacity(0.8),
//     //                         ),
//     //                       ),
//     //                       DataColumn(
//     //                         label: MyText(
//     //                           title: 'Product Name',
//     //                           fontWeight: FontWeight.w600,
//     //                           fontSize: 14,
//     //                           color: AppColor.black.withOpacity(0.8),
//     //                         ),
//     //                       ),
//     //                       DataColumn(
//     //                         label: MyText(
//     //                           title: 'In Stock',
//     //                           fontWeight: FontWeight.w600,
//     //                           fontSize: 14,
//     //                           color: AppColor.black.withOpacity(0.8),
//     //                         ),
//     //                       ),
//     //                       DataColumn(
//     //                         label: MyText(
//     //                           title: 'Unit Price',
//     //                           fontWeight: FontWeight.w600,
//     //                           fontSize: 14,
//     //                           color: AppColor.black.withOpacity(0.8),
//     //                         ),
//     //                       ),
//     //                     ],
//     //                     rows: List.generate(mockProductList.length, (index) {
//     //                       return DataRow(
//     //                         onSelectChanged: (val) {
//     //                           setState(() {
//     //                             // Add product to the addProduct list when a row is selected
//     //                             addProduct.add(
//     //                               Product(
//     //                                 productName: mockProductList[index].productName,
//     //                                 description: mockProductList[index].description,
//     //                                 quantity: mockProductList[index].quantity,
//     //                                 price: mockProductList[index].price,
//     //                                 discount: mockProductList[index].discount,
//     //                                 tax: mockProductList[index].tax,
//     //                               ),
//     //                             );
//     //                           });
//     //
//     //                           // Debugging print statement
//     //                           print(addProduct);
//     //                         },
//     //                         cells: [
//     //                           DataCell(MyText(title: "${index + 1}")),
//     //                           DataCell(MyText(title: "${mockProductList[index].productName}")),
//     //                           DataCell(MyText(title: "${mockProductList[index].quantity}")),
//     //                           DataCell(MyText(title: "${mockProductList[index].price}")),
//     //                         ],
//     //                       );
//     //                     }),
//     //                     columnSpacing: 10.0,
//     //                     horizontalMargin: 10.0,
//     //                     dividerThickness: 1.0,
//     //                     showBottomBorder: true,
//     //                     sortColumnIndex: 0,
//     //                     sortAscending: true,
//     //                     dataRowHeight: 32.0,
//     //                     headingRowHeight: 36.0,
//     //                     showCheckboxColumn: false,
//     //                     border: TableBorder.all(
//     //                       color: AppColor.grey.withOpacity(0.1),
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ),
//     //             ),
//     //           )
//     //         ],
//     //       ),
//     //     )
//     // );
//   }
// }
//
//
