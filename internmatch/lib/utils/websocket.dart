import 'dart:core';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import './event_handler.dart';

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

  /* Listener */
  /* List of methods to be called when a new message*/
  /* comes in. */

 //ObserverList<Function> _listener = new ObserverList<Function>();

  /* Initializint the web socket connection */

  initCommunication(vertexUrl) async {
  try {
        print("WebSocket:: Trying to connect to "+ vertexUrl);
        
        _channel = IOWebSocketChannel.connect(vertexUrl,headers: {'CONNECTION':'upgrade','UPGRADE':'websocket'});
        _channel.stream.listen(_onIncomingMessage);

      } catch(e){
          print("WebSocket: Unable to make a connection with :" + vertexUrl);
          print("Exception logs: "+e.toString());
      } 
  }

  /* Send message to the vertex*/
  sendMessage(message){
    if(_channel != null){      
      if(_channel.sink != null ){
        print("Sending Messsage::" + message);
        _channel.sink.add(json.encode(message));
      }
    }
  }
  
/*
/*Listenes for incomming message from server */
  addListener(Function callback){
    _listener.add(callback);
  }


/*Remove for message from server */
  removeListener(Function callback){
    _listener.remove(callback);
  }
*/

/*invoked each time when receiving the incoming message form the server*/
  _onIncomingMessage(message){
    _isOn = true;
    print("Receiving form the server");
    print(message);
    eventHandler.handleIncomingMessage(message);
    }       
}
