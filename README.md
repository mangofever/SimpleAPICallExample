# SimpleAPICallExample
This is a project to discover common requirements of API request within iOS applications.

(not Swift)

# APIHandler
It's simple and uses NSURLConnection. (I think AFNetworking library can be one of options.)
Actullay, this is very simple prototype and needs contributions.

See descriptions below.

## SimpleAPIRequest
- has NSURLRequest class about single API.
- has a proper parser for that API.
- can send API request and pass the response to the parser.
- notifies API result via block

## APIHandler
- schedules SimpleAPIRequest(start or cancel).
- notifies SimpleAPIRequest's result via block

## SampleAPIBuilder and SimpleJSONParser
- These are pair(request and response).
- SampleAPIBuilder describes actual API request(URL, METHOD, Timeout...).
- SimpleJSONParser describes how to parse the response.
- Information about which API request use which parser is definded within SampleAPIBuilder.

## Sample Code
```
[[APIHandler defaultAPIHandler] sendAPIRequest:[SampleAPIBuilder buildAPI] completionHandler:^(BOOL isSuccess, NSDictionary *responseResult, NSError *error) {
  NSLog(@"\nParsed JSON\n%@",responseResult.description);
}];
```
