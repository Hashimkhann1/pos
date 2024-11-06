//
//
// import 'package:flutter/material.dart';
// import 'package:pos/component/app_text_field.dart';
// import 'package:pos/component/my_text.dart';
// import 'package:pos/res/color/app_color.dart';
//
// class OrderView extends StatefulWidget {
//   const OrderView({super.key});
//
//   @override
//   State<OrderView> createState() => _OrderViewState();
// }
//
// class _OrderViewState extends State<OrderView> {
//   List<String> radioButtons = ["In KG" , "In Pieces"];
//
//   late String currentRadioButton = radioButtons[0];
//
//   @override
//   Widget build(BuildContext context) {
//
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const MyText(title: "App Product"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//
//             /// title
//             const MyText(title: "Add Products",fontSize: 30,fontWeight: FontWeight.w900,color: AppColor.primaryColor,),
//             const SizedBox(height: 20,),
//
//             AppTextField(hintText: "Product Name",width: width * 0.26,height: 45,),
//             const SizedBox(height: 10,),
//             AppTextField(hintText: "Quantity",width: width * 0.26,height: 45,),
//             const SizedBox(height: 10,),
//             AppTextField(hintText: "Purchase Price",width: width * 0.26,height: 45,),
//             const SizedBox(height: 10,),
//             AppTextField(hintText: "Sale Price",width: width * 0.26,height: 45,),
//             const SizedBox(height: 10,),
//             /// Drop down will be here
//             Container(
//               alignment: Alignment.topRight,
//               width: width * 0.2,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: RadioListTile(
//                         title: const MyText(title: "In KG"),
//                         value: radioButtons[0],
//                         groupValue: currentRadioButton,
//                         activeColor: AppColor.primaryColor,
//                         onChanged: (value) {
//                           setState(() {
//                             currentRadioButton = value.toString();
//                           });
//                         }),
//                   ),
//                   Expanded(
//                     child: RadioListTile(
//                         title: const MyText(title: "In Pieces"),
//                         value: radioButtons[1],
//                         groupValue: currentRadioButton,
//                         activeColor: AppColor.primaryColor,
//                         onChanged: (value) {
//                           setState(() {
//                             currentRadioButton = value.toString();
//                           });
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//
//             /// add product button
//             TextButton(
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16),
//                 backgroundColor: AppColor.primaryColor
//               ),
//                 onPressed: (){}, child: const MyText(title: "add Products",fontWeight: FontWeight.bold,fontSize: 18,color: AppColor.white,))
//
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:pos/res/color/app_color.dart';


class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  TextEditingController searchController = TextEditingController();
  TextEditingController qtyController = TextEditingController(text: '6');
  TextEditingController unitPriceController = TextEditingController(text: '30.00');

  List<Map<String, dynamic>> inventoryData = List.generate(
    20,
        (index) => {
      "productName": "Product ${index + 1}",
      "inStock": "50",
      "unitPrice": (30 + index * 10).toStringAsFixed(2),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cash Sale"),
      ),
      body: Row(
        children: [
          // Left Panel: Inventory Search
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Table(
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor
                        ),
                        children: [
                          TableCell(
                            child: Center(child: Text("Product",style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.white,fontSize: 14),)),
                          ),
                          TableCell(
                            child: Center(child: Text("Stock",style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.white,fontSize: 14),)),
                          ),
                          TableCell(
                            child: Center(child: Text("Unit Price",style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.white,fontSize: 14),)),
                          )
                        ]
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Table(
                          children: [
                            TableRow(
                                children: [
                                  TableCell(
                                    child: Center(child: Text("Product",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),)),
                                  ),
                                  TableCell(
                                    child: Center(child: Text("Stock",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),)),
                                  ),
                                  TableCell(
                                    child: Center(child: Text("Unit Price",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),)),
                                  )
                                ]
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(),
          // Right Panel: Sale Details
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sale Detail",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Sale No',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Checkout By',
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(value: 'admin', child: Text('admin')),
                            DropdownMenuItem(value: 'user', child: Text('user')),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Customer',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Prod Name')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Qty')),
                      DataColumn(label: Text('Price')),
                      DataColumn(label: Text('Discount')),
                      DataColumn(label: Text('Tax')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('Sample Product')),
                          DataCell(Text('Sample Description')),
                          DataCell(Text('1')),
                          DataCell(Text('100.00')),
                          DataCell(Text('0.00')),
                          DataCell(Text('5.00')),
                          DataCell(Text('105.00')),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total: ", style: TextStyle(fontSize: 16)),
                      Text(
                        "0.00",
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Hold Sale logic
                        },
                        child: Text('Hold Sale'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Payment logic
                        },
                        child: Text('Payment'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

