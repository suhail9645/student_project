import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 4, 1, 17),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children:const [
            CircularProgressIndicator(),
             SizedBox(height: 20,),
             Text('Wait we are feching students data',style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
