import 'package:flutter/material.dart';

Widget labelInternet(){
  return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Oh! Mất internet rồi!", style: TextStyle(color: Colors.white),),
          Text(" hãy kiểm tra lại mạng của bạn nào?", style: TextStyle(color: Colors.white))
        ],
      )
  );
}