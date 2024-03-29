import "../projectEnv.dart";
  class  BridgeEnvs{

    static get bridgeUrl{
      return Project.url+"/api/events/init?url="+Project.url;
    }

    static get authUrl{
      return authServerUrl+"/realms/"+realm+"/account";
    }

    static var realm ;
    static var authServerUrl;
    static var sslExternal;
    static var credentialsSecret;
    static var vertexUrl;
    static var apiUrl;
    static var url;
    static var ENV_GENNY_HOST;
    static var ENV_GENNY_INITURL;
    static var ENV_GENNY_BRIDGE_SERVICE;
    static var ENV_GENNY_BRIDGE_EVENTS;
    static var ENV_GENNY_BRIDGE_VERTEX;
    static var ENV_SIGNATURE_URL;

    static bool fetchSuccess = false;

    static final Map map= {
    'realm': (val) => realm = val,
    'auth-server-url': (val) => authServerUrl = val,
    'ssl-required' : (val) => sslExternal = val,
    'credentials' : (val) => credentialsSecret = val,
    'vertx_url' : (val) => vertexUrl = val,
    'api_url' : (val) => apiUrl = val,
    'url' : (val) => url = val ,
    'ENV_GENNY_HOST' : (val) => ENV_GENNY_HOST = val,
    'ENV_GENNY_INITURL': (val) => ENV_GENNY_INITURL = val,
    'ENV_GENNY_BRIDGE_SERVICE' : (val) => ENV_GENNY_BRIDGE_SERVICE = val,
    'ENV_GENNY_BRIDGE_EVENTS': (val) => ENV_GENNY_BRIDGE_EVENTS = val,
    'ENV_GENNY_BRIDGE_VERTEX': (val) => ENV_GENNY_BRIDGE_VERTEX = val,
    'ENV_SIGNATURE_URL': (val) => ENV_SIGNATURE_URL = val
    };
  
}



