import 'package:flutter/material.dart';
import 'package:pos/component/customtablecell/custom_table_cell.dart';
import 'package:pos/component/drawer/drawer_widget.dart';
import 'package:pos/res/color/app_color.dart';

import '../../../component/app_text_field.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense"),
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
                    hintText: "Search Expense",
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
                    HeaderCustomTableCell(title: "Date"),
                    HeaderCustomTableCell(title: "Expense Name"),
                    HeaderCustomTableCell(title: "Description"),
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
                        children: [
                          CustomTableCell(title: "#"),
                          CustomTableCell(title: "Date"),
                          CustomTableCell(title: "Expense Name"),
                          CustomTableCell(title: "Description"),
                          CustomTableCell(title: "Balance"),
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

