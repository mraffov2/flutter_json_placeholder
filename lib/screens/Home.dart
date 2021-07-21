import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/PlaceholderProvider.dart';
import 'package:test_app/widgets/AppBar.dart';
import 'package:test_app/widgets/FLoatingButton.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getUsers();
    });
  }

  _getUsers() async {
    bool statusResponse;
    final _planceholdeProvider =
        Provider.of<PlaceholderProvider>(context, listen: false);
    if (_planceholdeProvider.users.length == 0) {
      final statusResponse =
          await _planceholdeProvider.getUsersJsonPlaceHolder();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _planceholdeProvider = Provider.of<PlaceholderProvider>(context);
    final totalWidth = MediaQuery.of(context).size.width.round();
    final totalheight = MediaQuery.of(context).size.height.round();
    return Scaffold(
      appBar: AppBarDetails(title: 'JsonPlaceHolder Users'),
      floatingActionButton: FLoatButton(
          icon: Icons.refresh,
          onPressAction: () async {
            await _planceholdeProvider.getUsersJsonPlaceHolder();
          }),
      body: !_planceholdeProvider.loadingData
          ? Container(
              height: totalheight * 0.95,
              child: _planceholdeProvider.users.length == 0
                  ? Center(
                      child: Text('No users to show'),
                    )
                  : ListView.builder(
                      itemCount: _planceholdeProvider.users.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0, 8),
                                    blurRadius: 5)
                              ]),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _planceholdeProvider.users[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Email: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    _planceholdeProvider.users[index].email,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'City: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    _planceholdeProvider
                                        .users[index].address.city,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Company Name: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    _planceholdeProvider
                                        .users[index].company.name,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }))
          : Container(
              child: Center(
              child: Text('Loading Users'),
            )),
    );
  }
}
