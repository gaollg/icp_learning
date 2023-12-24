import Text "mo:base/Text";
import Blob "mo:base/Blob";
import Nat "mo:base/Nat";

// import HttpRequest "./certified_assets";
// import HttpResponse "./certified_assets";

actor Counter {
  stable var currentValue : Nat = 0;

  public func increment() : async () {
    currentValue += 1;
  };

  public query func get() : async Nat {
    currentValue;
  };

  public func set(n : Nat) : async () {
    currentValue := n;
  };

  public type HeaderField = (Text, Text);
  type HttpRequest = {
    url : Text;
    method : Text;
    body : Blob;
    headers : [HeaderField];
  };
  type HttpResponse = {
    body : Blob;
    headers : [HeaderField];
    // streaming_strategy : ?StreamingStrategy;
    status_code : Nat16;
  };

  public query func http_request(arg : HttpRequest) : async HttpResponse {

    let body = "Current Count: "  #  Nat.toText(currentValue);
    return {
      body = Text.encodeUtf8(body);
      headers = [];
      status_code = 200;
    };
  };

};
