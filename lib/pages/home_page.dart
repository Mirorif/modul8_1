import 'package:flutter/material.dart';
import 'package:modul8_1/models/users_info_model.dart';
import 'package:modul8_1/services/http_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  UserInfo? userInfo;

  void _apiPostList() async {
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    setState(() {
      userInfo = Network.parseUserInfo(response!);
    });
  }
  
  void _url() async {
    if(!await launch(userInfo!.url)) throw 'Could not launch ${userInfo!.url}';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                      color: Colors.blueAccent,
                      image: DecorationImage(
                        image: NetworkImage(userInfo!.avatar_url),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Expanded(child: Center(child: Text(userInfo!.login))),
                  Expanded(child: Center(child: Text(userInfo!.id.toString()))),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                )
              ),
              child: FlatButton(
                onPressed: _url,
                child: const Text("Github Url", style: TextStyle(
                  color: Colors.white,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
