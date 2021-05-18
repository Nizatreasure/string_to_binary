import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text(
          'About Developer',
          style: TextStyle(color: Colors.brown[200]),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown[200]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text('This app was developed by Undie Ebenezer Unimakpel.',
                style: TextStyle(color: Colors.brown[700], fontSize: 16)),
          ),
          SizedBox(height: 10),
          InkWell(
            highlightColor: Colors.brown[400],
            onTap: () {
              openUrl('mailto: ebenezerundie@gmail.com', context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.mail,
                    color: Colors.brown[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ebenezerundie@gmail.com',
                    style: TextStyle(color: Colors.brown[700], fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.brown[400],
            onTap: () {
              openUrl('tel:+2348117933576', context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(children: [
                Icon(
                  Icons.call,
                  color: Colors.brown[700],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '+2348117933576',
                  style: TextStyle(
                      color: Colors.brown[700], fontSize: 16, letterSpacing: 1),
                ),
              ]),
            ),
          ),
          InkWell(
            highlightColor: Colors.brown[400],
            onTap: () {
              openUrl('whatsapp://send?phone=+2348024128943', context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.brown[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '+2348024128943',
                    style: TextStyle(
                        color: Colors.brown[700],
                        fontSize: 16,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.brown[400],
            onTap: () {
              openUrl('https://www.linkedin.com/in/undie-ebenezer-69740085',
                  context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.brown[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'undie-ebenezer',
                    style: TextStyle(
                        color: Colors.brown[700],
                        fontSize: 16,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.brown[400],
            onTap: () {
              openUrl('https://www.facebook.com/nizatreasure', context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.brown[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'nizatreasure',
                    style: TextStyle(
                        color: Colors.brown[700],
                        fontSize: 16,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.brown[400],
            onTap: () {
              openUrl('https://www.twitter.com/nizatreasure', context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.brown[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'nizatreasure',
                    style: TextStyle(
                        color: Colors.brown[700],
                        fontSize: 16,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.brown[400],
            onTap: () {
              openUrl('https://www.instagram.com/nizatreasure', context);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.brown[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'nizatreasure',
                    style: TextStyle(
                        color: Colors.brown[700],
                        fontSize: 16,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> openUrl(String url, BuildContext context) async {
  if (await canLaunch(url))
    launch(url);
  else
    showError(context);
}

Future<void> showError(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown[300],
          content: Text(
            'Could not launch application',
            style: TextStyle(color: Colors.brown[800]),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.brown[900], fontSize: 16),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
