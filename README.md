# SimpleAPICallExample
This is a project to discover common requirements of API request within iOS applications.
Beginning with objective-C language.

This project use a simple code patterns to request APIs.
And it is implemented as class, APIHandler.

# APIHandler
It's simple and use NSURLConnection. (I think AFNetworking library can be one of options.)
Actullay, this is very simple prototype and need contributions.

See description about classes below.

## SimpleAPIRequest
- has NSURLRequest class about single API.
- has a proper parser for that API.
- can send API request and pass the response to the parser.
- notify API result via block

## APIHandler
- schedule SimpleAPIRequest(start or cancel).
- notify SimpleAPIRequest's result via block

## SampleAPIBuilder and SimpleJSONParser
- These are pair(request and response).
- SampleAPIBuilder describe actual API request(URL, METHOD, Timeout...).
- SimpleJSONParser describe how to parse the response.
- Information about which API request use which parser is definded within SampleAPIBuilder.

## Sample Code
```
[[APIHandler defaultAPIHandler] sendAPIRequest:[SampleAPIBuilder buildAPI] completionHandler:^(BOOL isSuccess, NSDictionary *responseResult, NSError *error) {
  NSLog(@"\nParsed JSON\n%@",responseResult.description);
}];
```
