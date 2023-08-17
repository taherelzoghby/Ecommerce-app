// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:iti/constants/colors.dart';
import 'package:iti/constants/routes.dart';
import 'package:iti/controllers/controllerProvider.dart';
import 'package:iti/screens/widgets/photoWidget.dart';
import 'package:iti/screens/widgets/tileInfoProfile.dart';
import 'package:iti/services/fairebaseAuth.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final Map<String, dynamic> currentUser = firebaseAuth().getCurrentUser();
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: initialColor,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(appInfoPage),
            icon: const Icon(Icons.info),
          ),
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(developerTeamPageRoute),
            icon: const Icon(Icons.developer_mode),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //image
              photoWidgetFile(
                image: // context.watch<controller>().selectedImage,
                    currentUser['image'],
                on_tap: () async {},
              ),
              SizedBox(height: height * .015),
              //name
              Text(
                currentUser['name'],
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * .015),
              //email
              Text(
                currentUser['email'],
                style: const TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: height * .025),
              //account information
              const Text(
                'Account Information',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * .03),
              //Name tile
              tileInfoProfile(
                title: 'Name',
                subTitle: currentUser['name'],
                widget: const Icon(Icons.edit),
              ),
              SizedBox(height: height * .02),
              //Email tile
              tileInfoProfile(
                title: 'Email',
                subTitle: currentUser['email'],
                widget: const Icon(Icons.email),
              ),
              SizedBox(height: height * .02),
              //logout
              tileInfoProfile(
                title: 'Logout',
                subTitle: '',
                onTap: () => context.read<controller>().signOut(context),
                color: Colors.red,
                widget: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
