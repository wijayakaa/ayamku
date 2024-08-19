import 'package:ayamku_delivery/app/pages/features/input_voucher/items/item_voucher_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/alert_cancel_dialog.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemListPesananKamu extends GetView<OrderPageController> {
  const ItemListPesananKamu({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.status,
    required this.orderId,
  });

  final String image, name, date, status;
  final int orderId;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15),
          width: screenWidth,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ItemPesananKamu(
                    status: status,
                    image: image,
                    name: name,
                    date: date,
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Obx(() {
                    if (controller.isOrderCancelled(orderId.toString()) && status == "cancelled"){
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: Text("Pesanan telah dibatalkan", style: txtCaption.copyWith(color: baseColor),)),
                      );
                    } else if (status == "processing")  {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FullBtn(
                            text: "Batalkan Pesanan",
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertCancelDialog(
                                    title: "Batalkan Pesanan",
                                    desc:
                                    "Apakah anda yakin ingin membatalkan pesanan ini?",
                                    txtAccept: "Ya",
                                    onTap1: () {
                                      Get.back();
                                    },
                                    onTap2: () async {
                                      controller.cancelOrder(orderId.toString());
                                      Get.back();
                                    },
                                  ));
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          LittleButton(
                            text: "Hubungi Admin",
                            onTap: ()  {}
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  })

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemPesananKamu extends StatelessWidget {
  const ItemPesananKamu(
      {super.key,
        required this.image,
        required this.name,
        required this.date,
        required this.status});

  final String image, name, date, status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   status,
            //   style: txtSecondaryTitle.copyWith(color: primaryColor),
            // ),
            //
            // SizedBox(height: 5,),

            Text(
              name,
              style: txtSecondaryTitle,
            ),

            SizedBox(
              height: 5,
            ),

            Text(
              date,
              style: txtSecondaryTitle.copyWith(color: blackColor40),
            ),

            SizedBox(height: 10,),

            Text(
              status,
              style: txtSecondaryTitle.copyWith(color: primaryColor),
            ),
          ],
        ),

        Image.asset(
          image,
          width: 60,
        ),
      ],
    );
  }
}
