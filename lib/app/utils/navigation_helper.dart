import 'package:flutter/material.dart';

import 'helper.dart';

class NavHelper {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigate(Widget page , {bool removeAll = false ,bool replace = false ,Function? onResult })async{
    assert(navigatorKey.currentState != null,
    'Please use NavHelper instance with getIt by =>  getIt<NavHelper>()');
    final route = MaterialPageRoute(builder: (c) => page);
    hideKeyboard(navigatorKey.currentState!.context);
    if(removeAll) {
      var result = await Navigator.pushAndRemoveUntil(navigatorKey.currentState!.context, route, (route) => false);
      if(onResult != null) onResult(result) ;
    }
    else if(replace){
      var result = await Navigator.pushReplacement(navigatorKey.currentState!.context,route);
      if(onResult != null) onResult(result) ;
    }
    else {
      var result = await Navigator.push(navigatorKey.currentState!.context,route);
      if(onResult != null) onResult(result) ;
    }
  }

  void goBack(){
    Navigator.pop(navigatorKey.currentState!.context);
  }

}