import 'package:flutter/material.dart';

Future checkboxComponent({required bool isChecked}) async {
  return Checkbox(
            value:  isChecked?true:false,
            onChanged: (value){},
          );
}


