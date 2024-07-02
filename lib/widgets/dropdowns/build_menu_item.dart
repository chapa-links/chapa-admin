import 'package:flutter/material.dart';

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xffCFD1D2),
          ),
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffDCF2EF),
        ),
        child: Center(
          child: Text(
            item,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );

const kDropDownInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10))),
);
