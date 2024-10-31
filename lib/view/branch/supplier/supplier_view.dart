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
        title: const Text("Supplier"),
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
                    HeaderCustomTableCell(title: "Supplier Name"),
                    HeaderCustomTableCell(title: "Company"),
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
    );
  }
}
