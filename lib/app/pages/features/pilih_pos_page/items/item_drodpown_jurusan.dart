import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemDropdownJurusan extends StatelessWidget {
  const ItemDropdownJurusan({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: DropdownButton(
          dropdownColor: Colors.white,
          style: txtSecondaryTitle.copyWith(
              color: blackColor40
          ),
          elevation: 1,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
          underline: Container(),
          items: <String>['PPLG', 'ANIMASI', 'DKV'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: txtSecondaryTitle.copyWith(
                    color: blackColor40
                ),
              ),
            );
          }).toList(),
          hint: const Text("Pilih jurusan"),
          onChanged: (String? newValue) {
            // Implement your logic here
          },
        ),
      ),
    );
  }
}
