import 'dart:core';
import 'package:flutter/foundation.dart';
import '../models/event.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import './event_handler.dart';

/*main(){

  //var vertexUrl = "wss://bridge-internmatch.outcome-hub.com/frontend/websocket";
  var vertexUrl = "https://bridge-internmatch.outcome-hub.com/frontend/websocket";
  socket.initCommunication(vertexUrl);
}*/

WebSockets socket = new WebSockets();

class WebSockets {
  static final WebSockets _sockets = new WebSockets._internal();

  factory WebSockets(){
    return _sockets;
  }

  WebSockets._internal();
  
  /*websocket ope channel */
  IOWebSocketChannel _channel;

  bool _isOn = false;

  /*CLoses the webSocket Communication*/
  reset(){
    if(_channel != null){
      if(_channel.sink != null){
        _channel.sink.close();
        _isOn = false;
      }
    }
  }
  
  /* Initializint the web socket connection */

  initCommunication(vertexUrl) async {
  try {
        print("WebSocket:: Trying to connect to "+ vertexUrl);
        
        _channel = await IOWebSocketChannel.connect(vertexUrl,headers: {'CONNECTION':'upgrade','UPGRADE':'websocket'});
        _channel.stream.listen(_onIncomingMessage);

      } catch(e){
          print("WebSocket: Unable to make a connection with :" + vertexUrl);
          print("Exception logs: "+e.toString());
      } 
  }

  /* Send message to the vertex*/
  sendMessage(message){
    if(_channel != null){      
      if(_channel.sink != null){
        print("Sending Messsage::" + message);
        _channel.sink.add(json.encode(message));
        _channel.stream.listen(_onIncomingMessage);
      }
    }
  }
  
/*invoked each time when receiving the incoming message form the server*/
  _onIncomingMessage(message){
    _isOn = true;
    print("Receiving form the server");
    print(message);
    eventHandler.handleIncomingMessage(message);
    }       
}
