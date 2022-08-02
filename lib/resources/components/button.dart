import 'package:flutter/material.dart';

class CustoButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  const CustoButton(
      {Key? key,
      required this.title,
      this.isLoading = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.deepOrange),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
