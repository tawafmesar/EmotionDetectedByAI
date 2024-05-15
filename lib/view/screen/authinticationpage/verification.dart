import 'package:emotiondetectedbyai/view/screen/authinticationpage/unvalid.dart';
import 'package:emotiondetectedbyai/view/screen/authinticationpage/valid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../homescreen/home.dart';


void main() { 
runApp(Vertfication()); 
} 

class Vertfication extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
	return MaterialApp( 
	theme: ThemeData( 
		primarySwatch: Colors.green, // Set the app's primary theme color 
	), 
	debugShowCheckedModeBanner: false, 
	home: PasswordValidator(), 
	); 
} 
} 

class PasswordValidator extends StatefulWidget { 
@override 
_PasswordValidatorState createState() => _PasswordValidatorState(); 
} 

class _PasswordValidatorState extends State<PasswordValidator> { 
TextEditingController _passwordController = TextEditingController(); 
bool _isValid = false; 
String _errorMessage = ''; 

@override 
Widget build(BuildContext context) { 
	return Scaffold( 
	 appBar: AppBar(
        title:                 
        Image.asset('assets/images/gruplogo.png'),
        titleSpacing: 05.0,
        centerTitle: true,
        toolbarHeight: 130.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        actions: <Widget>[
         IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Color.fromRGBO(1, 43, 173, 1),
            ),
            tooltip: 'Back Icon',
            onPressed: () {
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      ); 
            },
          ),]), 
	body: Padding( 
		padding: const EdgeInsets.all(16.0), 
		child: Column( 
		mainAxisAlignment: MainAxisAlignment.center, 
		children: [ 
			// Text field to input the password 
			TextField( 
			controller: _passwordController, 
			obscureText: true, 
			decoration: InputDecoration( 
				labelText: 'Enter ID', 
			), 
			), 
			SizedBox(height: 20), 

			// Button to trigger password validation 
			ElevatedButton( 
			onPressed: () { 
				  setState(() { 
                  _isValid = _validatePassword(_passwordController.text); 
                }); 
              
			}, 
      style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(1, 43, 173, 1), 
  ),
			child: Text('Check Secyrity',style: const TextStyle(fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1))), 
			), 
			SizedBox(height: 20), 

		], 
		), 
	), 
	); 
} 

// Function to validate the password 
bool _validatePassword(String password) { 
	// Reset error message 
	_errorMessage = ''; 

if (password.length < 4 ) { 
Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Valid()),
                      );	} 
               
	if (password.length > 4 ) { 
Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Unvalid()),
                      );	} 


	return _errorMessage.isEmpty; 
} 
} 
