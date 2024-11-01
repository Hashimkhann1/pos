import 'package:flutter/material.dart';
import 'package:pos/res/color/app_color.dart';

class DashboardBox extends StatelessWidget {
  const DashboardBox({required this.title,required this.subtitle,required this.icon,super.key});
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Container(
          height: 100,
          // width: 250,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
                blurRadius: 5,
                offset: const Offset(0.1, 0.1),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                ),
                child: Center(child: Icon(icon,color: Colors.white,)),
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)),
                  Flexible(child: Text(subtitle,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
