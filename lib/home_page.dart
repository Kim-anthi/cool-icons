import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {

  //create animation controller
  late AnimationController _animationController;

  //initialize animation controller
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }
  //method for user when icon is tapped
  bool videoPlaying = false;
  void _iconTapped(){
    if(videoPlaying == false){
      _animationController.forward();
      videoPlaying = true;
    }
    else{
      _animationController.reverse();
      videoPlaying = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _iconTapped,
          child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _animationController,
            size: 180,
          ),
        ),
      ),
    );
  }
}
