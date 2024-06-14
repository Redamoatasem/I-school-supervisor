import 'package:flutter/material.dart';
import 'package:tracker_login_register/shared/constant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Edit Profile',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/ahmed_moh.PNG'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                initialValue: 'Reda Moatasem',
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                initialValue: 'Redamoatasem@gmail.com',
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                initialValue: '************',
                obscureText: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                initialValue: '01202604594',
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     // Save changes action
              //   },
              //   child: Text('Save changes'),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.orange[600],
              //     padding: EdgeInsets.symmetric(vertical: 12),
              //     textStyle: TextStyle(fontSize: 18),
              //   ),
              // ),
              InkWell(
                child: Image.asset('assets/save_changes.PNG'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
