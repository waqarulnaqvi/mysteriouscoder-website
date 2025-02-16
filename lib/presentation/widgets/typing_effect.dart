import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mysteriouscoder/core/styles.dart';

class TypingEffect extends StatefulWidget{
  final String text;
  final Duration speed;
  final double fontSize;

  const TypingEffect({super.key,required this.text,this.speed=const Duration(milliseconds: 150),this.fontSize=20.0});

  @override
  State<TypingEffect> createState() => _TypingEffectState();
}

class _TypingEffectState extends State<TypingEffect> {
String _displayedText = "";
int _currentIndex = 0;
Timer? _timer;

@override
void initState() {
  super.initState();
  _startTyping();
}

@override
void dispose() {
  _timer?.cancel();
  super.dispose();
}


void _startTyping(){
  _timer =Timer.periodic(widget.speed, (timer){
    if(_currentIndex<widget.text.length)
      {
        _displayedText+=widget.text[_currentIndex];
        _currentIndex++;
      }
    else{
    _displayedText="";
    _currentIndex=0;
    }
    setState(() {});

  });
}



  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: reusableTextStyle(fontSize: widget.fontSize,color: Theme.of(context).colorScheme.surface),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
