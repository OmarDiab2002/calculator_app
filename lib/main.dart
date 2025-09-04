import 'package:flutter/material.dart';
import 'package:xo_app/app_colors.dart';
import 'package:xo_app/button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String number = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.black,
            body: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          number.isEmpty ? "0.0" : number,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          //right rows
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "Ac",
                                            onPressed: onAcTap,
                                            backgroundColor:
                                                AppColors.lightGrey,
                                            foregroundColor: AppColors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "",
                                            onPressed: onDeleteTap,
                                            backgroundColor:
                                                AppColors.lightGrey,
                                            foregroundColor: AppColors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "/",
                                            onPressed: onOptTap,
                                            backgroundColor: AppColors.darkBlue,
                                            foregroundColor: AppColors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "7",
                                            onPressed: onPressed,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "8",
                                            onPressed: onPressed,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "9",
                                            onPressed: onPressed,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "4",
                                            onPressed: onPressed,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "5",
                                            onPressed: onPressed,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "6",
                                            onPressed: onPressed,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "1",
                                            onPressed: onPressed,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "2",
                                            onPressed: onPressed,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: "3",
                                            onPressed: onPressed,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: ButtonWidget(
                                            text: "0",
                                            onPressed: onPressed,
                                          ),
                                        ),
                                        Expanded(
                                          child: ButtonWidget(
                                            text: ".",
                                            onPressed: onPressed,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          //second left column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ButtonWidget(
                                    text: "*",
                                    backgroundColor: AppColors.darkBlue,
                                    foregroundColor: AppColors.white,
                                    onPressed: onOptTap,
                                  ),
                                ),
                                Expanded(
                                  child: ButtonWidget(
                                    text: "-",
                                    backgroundColor: AppColors.darkBlue,
                                    foregroundColor: AppColors.white,
                                    onPressed: onOptTap,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ButtonWidget(
                                    text: "+",
                                    backgroundColor: AppColors.darkBlue,
                                    foregroundColor: AppColors.white,
                                    onPressed: onOptTap,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ButtonWidget(
                                    text: "=",
                                    backgroundColor: AppColors.lightBlue,
                                    foregroundColor: AppColors.white,
                                    onPressed: onEqualTap,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  bool isType = true;
  void onPressed(String value) {
    if (isType == false) {
      number = "";
    }
    number += value;
    isType = true;
    setState(() {});
  }

  void onDeleteTap(String value) {
    if (number.isNotEmpty) {
      number = number.substring(0, number.length - 1);
      setState(() {});
    }
  }

  void onAcTap(String value) {
    number = "";
    setState(() {});
  }

  void onEqualTap(String value) {
    onOptTap(selectedOpt);
    selectedOpt = "";
    left = "";
    right = "";
    isType = false;
  }

  String left = "";
  String right = "";
  String selectedOpt = "";
  void onOptTap(String opt) {
    if (selectedOpt == "" && left == "") {
      selectedOpt = opt;
      left = number;
      isType = false;
      setState(() {});
    } else {
      right = number;
      if (opt == "+") {
        number = (double.parse(left) + double.parse(right)).toString();
      } else if (opt == "-") {
        number = (double.parse(left) - double.parse(right)).toString();
      } else if (opt == "*") {
        number = (double.parse(left) * double.parse(right)).toString();
      } else {
        number = (double.parse(left) / double.parse(right)).toString();
      }
      left = number;
      selectedOpt = opt;
      isType = false;
      setState(() {});
    }
  }
}
