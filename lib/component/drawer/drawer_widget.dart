import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/view/branch/customer/customer_view.dart';
import 'package:pos/view/branch/dashboard/dashboard_view.dart';
import 'package:pos/view/branch/expense/expense_view.dart';
import 'package:pos/view/branch/installment/company_ledger_view.dart';
import 'package:pos/view/branch/installment/customer_ledger.dart';
import 'package:pos/view/branch/product/stock_inventory_view.dart';
import 'package:pos/view/branch/supplier/supplier_view.dart';

import '../../res/color/app_color.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Branch",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              accountEmail: Text(""),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
              ),
            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(CupertinoIcons.home,color: Colors.white,size: 16,)),
              ),
              title: Text("Dashboard"),
              trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardView()));
              },
            ),
            ExpansionTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(CupertinoIcons.doc_plaintext,color: Colors.white,size: 16,)),
              ),
              title: const Text("Sale Invoice"),
              children: const [
                ListTile(
                  leading: Icon(CupertinoIcons.cart_badge_plus,color: AppColor.primaryColor,),
                  title: Text("Add Sale"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.arrow_turn_up_left,color: AppColor.primaryColor,),
                  title: Text("Sale Return"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(CupertinoIcons.cube_box,color: Colors.white,size: 16,)),
              ),
              title: const Text("Product"),
              children: [
                ListTile(
                  leading: Icon(CupertinoIcons.square_list,color: AppColor.primaryColor,),
                  title: Text("Category"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                  onTap: (){

                  },
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.archivebox,color: AppColor.primaryColor,),
                  title: Text("Stock Inventory"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StockInventoryView()));
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(CupertinoIcons.shopping_cart,color: Colors.white,size: 16,)),
              ),
              title: const Text("Order Invoice"),
              children: const [
                ListTile(
                  leading: Icon(CupertinoIcons.cart_badge_plus,color: AppColor.primaryColor,),
                  title: Text("Add Order"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.arrow_turn_up_left,color: AppColor.primaryColor,),
                  title: Text("Order Return"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                ),
              ],
            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(CupertinoIcons.person_alt,color: Colors.white,size: 16,)),
              ),
              title: Text("Customer"),
              trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerView()));
              },
            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(CupertinoIcons.group,color: Colors.white,size: 16,)),
              ),
              title: Text("Supplier"),
              trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SupplierView()));
              },
            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(CupertinoIcons.money_dollar,color: Colors.white,size: 16,)),
              ),
              title: Text("Expense"),
              trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpenseView()));
              },
            ),
            ExpansionTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: const Center(child: Icon(CupertinoIcons.creditcard,color: Colors.white,size: 16,)),
              ),
              title: Text("Installment"),
              children: [
                ListTile(
                  leading: Icon(CupertinoIcons.person_alt,color: AppColor.primaryColor,),
                  title: Text("Customer Installment"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerLedgerView()));
                  },
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.group,color: AppColor.primaryColor,),
                  title: Text("Supplier Installment"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CompanyLedgerView()));
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: const Center(child: Icon(CupertinoIcons.chart_bar,color: Colors.white,size: 16,)),
              ),
              title: const Text("Report"),
              children: const [
                ListTile(
                  leading: Icon(CupertinoIcons.cart_badge_plus),
                  title: Text("Add Order"),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.arrow_turn_up_left),
                  title: Text("Order Return"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
