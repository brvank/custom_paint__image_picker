import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertWidget extends StatefulWidget {
  int seconds;
  AlertWidget({Key? key, required this.seconds}) : super(key: key);

  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  late int seconds;
  late Stream<int> stream;
  @override
  void initState() {
    super.initState();
    seconds = widget.seconds;
    stream = delay(seconds);

    RemoveAlert();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void RemoveAlert() {

    stream.listen((event) {
      print('here');
      if(mounted){
        if (event == 0) {
        Get.back();
        return;
      } else {
        setState(() {
          seconds = event;
        });
      }
      }else{
        return;
      }
    });

    print('After stream');
  }

  Stream<int> delay(int n) async* {
    for (int i = n - 1; i >= 0; i--) {
      print('In delay ${i}');
      if(!mounted){
        print('returning');
        return;
      }
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('Alert'), Text('It will go in ${seconds} seconds')],
    );
  }
}
