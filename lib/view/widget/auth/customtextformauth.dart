import 'package:flutter/material.dart';

class CustonTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final String? initialvalue;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final bool? isreesonly; // Add a new boolean argument


  const CustonTextFormAuth(
      {Key? key,
        this.obscureText,
        this.onTapIcon,
        required this.hinttext,
        required this.labeltext,
        required this.iconData,
        required this.mycontroller,
        required this.valid,
        required this.isNumber, this.initialvalue, this.isreesonly
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(

          readOnly: isreesonly == null || isreesonly == false  ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        initialValue: initialvalue, // Add this line
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false  ? false : true,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(child: Icon(iconData), onTap: onTapIcon),            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
        )
        ,
      ),
    );
  }
}