import 'package:dio/dio.dart';
import 'package:finalproject/models/JsonHolderData.dart';
import 'package:finalproject/models/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../utils/apis.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeScreenController extends GetxController{

    var myValue=0.obs;
    var appBar='Home Screen'.obs;
    var cgpa=4.1.obs;
    var myUserList=[].obs;
    var myMap={}.obs;
    var isActive=false.obs;
    var name=<String>['Foal'].obs;
    var number=<int>[1,2,3].obs;
    var userModel=<UserModel>[].obs;
    var postList=<JsonHolderData>[].obs;


    @override
  void onInit(){
    // print('OnInit Method Called');
      cgpa.value=3.5;
      _fetchPostData();
      _postDataToJsonHolder();
      _putDataToJsonHolder();
      _patchDataToJsonHolder();
      _deleteDataToJsonHolder();
      super.onInit();

    }

  @override
  void onClose(){
      // print('OnClose Method Called');
      cgpa.close();
      super.onClose();

  }

    void increment() {
      myValue.value++;
      myUserList.add('item-${myValue.value}');
    }

    void removeItem(int index){
      myUserList.removeAt(index);
    }

  updateItem(int i) {
      myUserList[i]='Foal';
  }

// Without parameter

  //#Get method

 Future <void> _fetchPostData() async {
   Dio dio = Dio(BaseOptions(
     baseUrl: Apis.baseUrl,
   ));
   var connectivityResult = await (Connectivity().checkConnectivity());
   try {
       if (connectivityResult == ConnectivityResult.none) {
         EasyLoading.showToast('No internet connection',duration: const Duration(seconds:2)) ;
         print('No Internet Connection ');
         } else
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response = await dio.get(Apis.getJsonHolderPostData);
        if (response.statusCode == 200) {
          // EasyLoading.showSuccess('Great Success!');
          EasyLoading.showToast('Data loaded successfully',duration: const Duration(seconds:2),toastPosition:EasyLoadingToastPosition.bottom );
          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP Parameter: ${response.requestOptions.queryParameters}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

          var myPostData=response.data as List;
          var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          postList.addAll(newList);
          
          print('uyfy${postList.length}');

     } else {
           print('Failed to load data');
       }
    }catch(e) {
     print('Error Occurred $e');
     EasyLoading.showError('Failed with Error');
   }finally{
     EasyLoading.dismiss();
   }
 }

  //#Post method
 Future <void> _postDataToJsonHolder() async {
   Dio dio = Dio(BaseOptions(
     baseUrl: Apis.baseUrl,
   ));
   var connectivityResult = await (Connectivity().checkConnectivity());
   try {
       if (connectivityResult == ConnectivityResult.none) {
         EasyLoading.showToast('No internet connection',duration: const Duration(seconds:2)) ;
         print('No Internet Connection ');
         } else
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response = await dio.post(Apis.getJsonHolderPostData,data:{
        'userId':'10',
          'title':'myTitle',
          'body':'myBody',
        });
        if (response.statusCode == 201) {
          // EasyLoading.showSuccess('Great Success!');
          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP Parameter: ${response.requestOptions.queryParameters}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

          var myPostData=response.data;
          EasyLoading.showToast('Data loaded successfully at:\n${myPostData['id']}',duration:const Duration(seconds:2 ));

          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //
          // print('uyfy${postList.length}');

     } else {
           print('Failed to load data');
       }
    }catch(e) {
     print('Error Occurred $e');
     EasyLoading.showError('Failed with Error');
   }finally{
     EasyLoading.dismiss();
   }
 }

  //#Put method
 Future <void> _putDataToJsonHolder() async {
   Dio dio = Dio(BaseOptions(
     baseUrl: Apis.baseUrl,
   ));
   var connectivityResult = await (Connectivity().checkConnectivity());
   try {
       if (connectivityResult == ConnectivityResult.none) {
         EasyLoading.showToast('No internet connection',duration: const Duration(seconds:2)) ;
         print('No Internet Connection ');
         } else
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response = await dio.put(Apis.getJsonHolderPostDataByPostId+'1',data:{
        'userId':'10',
          'title':'myTitle',
          'body':'myBody',
        });
        if (response.statusCode == 200) {
          // EasyLoading.showSuccess('Great Success!');
          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP Parameter: ${response.requestOptions.queryParameters}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

          var myPostData=response.data;
          EasyLoading.showToast('Update Data successfully at:\n${myPostData['id']}',duration:const Duration(seconds:2 ));

          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //
          // print('uyfy${postList.length}');

     } else {
           print('Failed to load data');
       }
    }catch(e) {
     print('Error Occurred $e');
     EasyLoading.showError('Failed with Error');
   }finally{
     EasyLoading.dismiss();
   }
 }

  //#Patch method
 Future <void> _patchDataToJsonHolder() async {
   Dio dio = Dio(BaseOptions(
     baseUrl: Apis.baseUrl,
   ));
   var connectivityResult = await (Connectivity().checkConnectivity());
   try {
       if (connectivityResult == ConnectivityResult.none) {
         EasyLoading.showToast('No internet connection',duration: const Duration(seconds:2)) ;
         print('No Internet Connection ');
         } else
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response = await dio.patch(Apis.getJsonHolderPostDataByPostId+'1',data:{
        'userId':'10',
          'title':'myTitle',
          'body':'myBody',
        });
        if (response.statusCode == 200) {
          // EasyLoading.showSuccess('Great Success!');
          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP Parameter: ${response.requestOptions.queryParameters}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

          var myPostData=response.data;
          EasyLoading.showToast('Update Data successfully at:\n${myPostData['id']}',duration:const Duration(seconds:2 ));

          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //
          // print('uyfy${postList.length}');

     } else {
           print('Failed to load data');
       }
    }catch(e) {
     print('Error Occurred $e');
     EasyLoading.showError('Failed with Error');
   }finally{
     EasyLoading.dismiss();
   }
 }

 //#Delete method
 Future <void> _deleteDataToJsonHolder() async {
   Dio dio = Dio(BaseOptions(
     baseUrl: Apis.baseUrl,
   ));
   var connectivityResult = await (Connectivity().checkConnectivity());
   try {
       if (connectivityResult == ConnectivityResult.none) {
         EasyLoading.showToast('No internet connection',duration: const Duration(seconds:2)) ;
         print('No Internet Connection ');
         } else
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response = await dio.delete(Apis.getJsonHolderPostDataByPostId+'19',);
        if (response.statusCode == 200) {
          // EasyLoading.showSuccess('Great Success!');
          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP Parameter: ${response.requestOptions.queryParameters}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

          var myPostData=response.data;
          EasyLoading.showToast('Recorded Data successfully',duration:const Duration(seconds:2 ));

          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //
          // print('uyfy${postList.length}');

     } else {
           print('Failed to load data');
       }
    }catch(e) {
     print('Error Occurred $e');
     EasyLoading.showError('Failed with Error');
   }finally{
     EasyLoading.dismiss();
   }
 }







}
