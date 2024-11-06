//
//
// import 'package:flutter/material.dart';
// import 'package:pos/component/my_text.dart';
// import 'package:pos/res/color/app_color.dart';
//
// class SaleInvoiceView extends StatelessWidget {
//   const SaleInvoiceView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Total products
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MyText(title: "Total Products",fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5),),
//               MyText(title: "10",fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5))
//             ],
//           ),
//           /// Total Selected Products price
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MyText(title: "Total Price",fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5),),
//               MyText(title: "30000",fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.black.withOpacity(0.5))
//             ],
//           ),
//
//           const SizedBox(height: 10,),
//
//           /// sell button
//           ElevatedButton(
//               onPressed: (){}, child: Text("Sell"))
//         ],
//       ),
//     );
//   }
// }
