import 'package:flutter/material.dart';
import '../../../component/app_text_field.dart';
import '../../../component/customtablecell/custom_table_cell.dart';
import '../../../component/drawer/drawer_widget.dart';
import '../../../res/color/app_color.dart';

class SupplierView extends StatefulWidget {
  const SupplierView({super.key});

  @override
  State<SupplierView> createState() => _SupplierViewState();
}

class _SupplierViewState extends State<SupplierView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: const AppTextField(
                    hintText: "Search Supplier",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(2),
              },
              border: TableBorder.all(
                color: Colors.grey.shade300,
              ),
              children: const [
                TableRow(
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                  ),
                  children: [
                    HeaderCustomTableCell(title: "#"),
                    HeaderCustomTableCell(title: "Company Name"),
                    HeaderCustomTableCell(title: "Supplier Name"),
                    HeaderCustomTableCell(title: "Phone No"),
                    HeaderCustomTableCell(title: "CNIC"),
                    HeaderCustomTableCell(title: "Address"),
                    HeaderCustomTableCell(title: "Date"),
                    HeaderCustomTableCell(title: "Balance"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                      4: FlexColumnWidth(2),
                    },
                    border: TableBorder.all(
                      color: Colors.grey.shade300,
                    ),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: index.isOdd ? Colors.grey.shade100 : AppColor.white,
                        ),
                        children: const [
                          CustomTableCell(title: "#"),
                          CustomTableCell(title: "Shahab Mustafa"),
                          CustomTableCell(title: "Company"),
                          CustomTableCell(title: "03112445554"),
                          CustomTableCell(title: "17101-8793438-1"),
                          CustomTableCell(title: "Peshawar"),
                          CustomTableCell(title: "12-02-2024"),
                          CustomTableCell(title: "1200"),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.primaryColor,
                  ),
                  child: Center(child: Text("Company")),
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Company Name",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Supplier Name",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Email",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Phone No",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Address",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Company Type",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Description",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Balance",
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: (){

                        },
                        child: Text("Cancel"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: (){

                        },
                        child: Text("Save"),
                      )
                    ],
                  )
                ],
              );
            },
          );
        },
        label: Text("Add Customer"),
      ),
    );
  }
}
