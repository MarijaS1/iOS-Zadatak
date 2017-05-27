//
//  RestService.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "RestService.h"
#import "ObjectMapper.h"
#import "DataController.h"
#import "NSURL+PathParameters.h"
#import "NSString+PathParameters.h"
#import "ErrorMessage.h"



#define OP_TAG_LIVESCORES                           100


@implementation RestService

- (void) getAllMatchesWithSportID:(NSNumber *)sportID
                      withSuccess:(void (^)(NSArray *))success
                          failure:(void (^)(MozzartError *))failure {
    
    NSURL *url = [[DataController sharedInstance].serverData getAllMatchesURL];
    NSString *pathPattern = [[DataController sharedInstance].serverData getAllMatchesPathPattern];
    RKObjectMapping *objectMapping = [ObjectMapper mapLivescoreResponse];
    
    NSMutableArray *keys = [NSMutableArray new];
    NSMutableArray *objects = [NSMutableArray new];
    if (sportID) {
        [keys addObject:@"sport_id"];
        [objects addObject:sportID];
    }
    NSDictionary *parameters = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    [self sendRequestWithUrl:url andPathPattern:pathPattern andParams:parameters andSendParametersAsJson:NO andMethod:REQUEST_METHOD_GET andWithTag:OP_TAG_LIVESCORES andWithObjectMapping:objectMapping completionBlockWithSuccess:success failure:failure];
    
}


#pragma mark - Private methods

- (void)    sendRequestWithUrl:(NSURL *)url
                andPathPattern:(NSString *)pathPattern
                     andParams:(NSDictionary *)parameteres
       andSendParametersAsJson:(BOOL)sendParametersAsJson
                     andMethod:(NSString *)method
                    andWithTag:(int)tag
          andWithObjectMapping:(RKObjectMapping *)objectMapping
    completionBlockWithSuccess:(void (^)(id))success
                       failure:(void (^)(MozzartError *))failure {
    [self sendRequestWithUrl:url andPathPattern:pathPattern andParams:parameteres andSendParametersAsJson:sendParametersAsJson andMethod:method andWithTag:tag andWithObjectMapping:objectMapping completionBlockWithSuccess:success failure:failure andNextRequest:nil withResponseDescriptor:nil andNextSuccessBlock:nil andNextFailureBlock:nil];
}


- (void)    sendRequestWithUrl:(NSURL *)url
                andPathPattern:(NSString *)pathPattern
                     andParams:(NSDictionary *)parameters
       andSendParametersAsJson:(BOOL)sendParametersAsJson
                     andMethod:(NSString *)method
                    andWithTag:(int)tag
          andWithObjectMapping:(RKObjectMapping *)objectMapping
    completionBlockWithSuccess:(void (^)(id))success
                       failure:(void (^)(MozzartError *))failure     //failure:(void (^)(MozzartError *))failure
                andNextRequest:(NSMutableURLRequest *)nextRequest
        withResponseDescriptor:(RKResponseDescriptor *)nextResponseDescriptor
           andNextSuccessBlock:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))nextSuccess
           andNextFailureBlock:(void (^)(RKObjectRequestOperation *operation, NSError *error))nextFailure {
    
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:objectMapping method:RKRequestMethodAny pathPattern:pathPattern keyPath:nil statusCodes:statusCodes];
    responseDescriptor.baseURL = [NSURL URLWithString:[[DataController sharedInstance].serverData getBaseUrl]];
    
    //added error handler
    RKObjectMapping *errorMapping = [ObjectMapper mapError];
    
    NSMutableIndexSet *errorStatusCodes =[[NSMutableIndexSet alloc] initWithIndexSet: RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError)];
    [errorStatusCodes addIndexes:RKStatusCodeIndexSetForClass(RKStatusCodeClassRedirection)];
    [errorStatusCodes addIndexes:RKStatusCodeIndexSetForClass(RKStatusCodeClassServerError)];
    
    
    //    RKResponseDescriptor *errorResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError)];
    RKResponseDescriptor *errorResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:errorStatusCodes];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:method];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (sendParametersAsJson) {
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    else {
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    }

    if (parameters) {
        if (sendParametersAsJson) {
            // serialize parameters as json
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:&error];
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            [request setValue:jsonString forHTTPHeaderField:@"json"];
            [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
            NSLog(@"UNDECIDED %@ REQUEST: %@\nWITH BODY: %@", method, url, jsonString);
        }
        else {
            if ([method isEqualToString:REQUEST_METHOD_GET] || [method isEqualToString:REQUEST_METHOD_DELETE]) {
                // if method is GET or DELETE, append parameters to the url
                NSURL *newUrl = [url URLByAppendingParameters:parameters];
                [request setURL:newUrl];
                NSLog(@"UNDECIDED %@ REQUEST: %@", method, newUrl);
            }
            else {
                // else put them in the body of the request
                NSString *jsonString = [NSString stringWithPathParameters:parameters];
                [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
                NSLog(@"UNDECIDED %@ REQUEST: %@\nWITH BODY: %@", method, url, jsonString);
            }
        }
    }
    else {
        NSLog(@"UNDECIDED %@ REQUEST: %@", method, url);
    }
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor, errorResponseDescriptor]];
    [operation setCompletionBlockWithSuccess: ^(RKObjectRequestOperation *operation, RKMappingResult *result)
     {
        
             if ([self checkResponse:result withFailureBlock:failure] == NO) {
                 [self requestedOperationSucceeded:operation withTag:tag andResponse:result andCompletionSuccessBlock:success];
             }
             // return the response
             
     }
     
                                     failure: ^(RKObjectRequestOperation *operation, NSError *error)
     {
         
         MozzartError *mozzartError = [[MozzartError alloc] init];
         
         mozzartError.code = DEFAULT_SERVER_ERROR_CODE;
         NSLog(@"Error with code message: %@", mozzartError.codeMessage);
         
         [self requestedOperationFailed:operation withTag:tag andError:mozzartError andCompletionFailureBlock:failure];

         
         
     }];
    [operation start];
}


- (void)requestedOperationSucceeded:(RKObjectRequestOperation *)operation
                            withTag:(int)tag
                        andResponse:(RKMappingResult *)mappingResults
          andCompletionSuccessBlock:(void (^)(id))success {
    if (tag == OP_TAG_LIVESCORES) {
        Livescores *response = [mappingResults firstObject];
        if (success) {
            success(response);
        }
    }
}

- (void)requestedOperationFailed:(RKObjectRequestOperation *)operation
                         withTag:(int)tag
                        andError:(MozzartError *)error
       andCompletionFailureBlock:(void (^)(MozzartError *))failure {
    if (failure) {
        failure(error);
    }
}

-(BOOL)checkResponse: (RKMappingResult *)result
    withFailureBlock:  (void (^)(MozzartError *))failure {
    BOOL failed = NO;
    NSArray * mappingArray = [result array];
    if([mappingArray count]) {
        NSObject * mappingObject = [mappingArray objectAtIndex:0];
        if([mappingObject isKindOfClass:[MozzartError class]]) {
            MozzartError* udError = (MozzartError*)mappingObject;
            failure(udError);
            failed = YES;
            
        }
        
    }
    return failed;
}




@end
