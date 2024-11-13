import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/view/branch/dashboard/dashboard_view.dart';
import 'package:pos/view/branch/product/category_view.dart';
import 'package:pos/view/branch/product/stock_inventory_view.dart';
import 'package:pos/view/branch/sale_invoice/sale_invoice_view.dart';
import 'package:pos/view/branch/sale_return/sale_return_view.dart';
import '../../res/color/app_color.dart';
import '../../view/branch/expense/expense_view.dart';

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
                child: const Center(child: Icon(CupertinoIcons.home,color: Colors.white,size: 16,)),
              ),
              title: const Text("Dashboard"),
              trailing: const Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardView()));
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
                child: Center(child: const Icon(CupertinoIcons.cart_badge_plus,color: AppColor.white,)),
              ),
              title: const Text("Add Sale"),
              trailing: const Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SaleInvoiceView()));
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
                child: Center(child: Icon(CupertinoIcons.arrow_turn_up_left,color: AppColor.white,size: 16,)),
              ),
              title: Text("Sale Return"),
              trailing: Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SaleReturnInvoiceView()));
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
                child: Center(child: const Icon(CupertinoIcons.square_list,color: AppColor.white,size: 16,)),
              ),
              title: const Text("Category"),
              trailing: const Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryView()));
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
                child: const Icon(CupertinoIcons.archivebox,color: AppColor.white,size: 16,),
              ),
              title: const Text("Stock Inventory"),
              trailing: const Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StockInventoryView()));
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
                child: const Center(child: Icon(Icons.expand,color: AppColor.white,)),
              ),
              title: const Text("Expense"),
              trailing: const Icon(Icons.keyboard_arrow_right,color: AppColor.primaryColor,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}