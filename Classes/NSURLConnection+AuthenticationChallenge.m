//
//  NSURLConnection+AuthenticationChallenge.m
//
//  Created by Bilge Taylan Ulusoy on 20.06.14.
//  Copyright (c) 2014 Bilge Taylan Ulusoy. All rights reserved.
//

#import "NSURLConnection+AuthenticationChallenge.h"

typedef void(^authenticationChallengeBlock)(NSURLAuthenticationChallenge *);
typedef void(^completionBlock)(NSURLResponse *, NSData *, NSError *);

@interface BUNSURLConnectionServerTrustDelegate : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong, readwrite) NSURLResponse *connectionResponse;
@property (nonatomic, strong, readwrite) NSMutableData *connectionData;
@property (nonatomic, strong, readwrite) authenticationChallengeBlock challengeBlock;
@property (nonatomic, strong, readwrite) completionBlock completion;

@end


@implementation BUNSURLConnectionServerTrustDelegate

- (instancetype)init {
    if (self = [super init]) {
        self.connectionData = [[NSMutableData alloc] init];
    }
	
    return self;
}

- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	self.challengeBlock(challenge);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	self.connectionResponse = response;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.connectionData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	self.completion(nil, nil, error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	self.completion(self.connectionResponse, self.connectionData, nil);
}

@end

@implementation NSURLConnection (AuthenticationChallenge)

+(void)connectionWithRequest:(NSURLRequest*)aRequest willSendRequestForAuthenticationChallenge:(void (^)(NSURLAuthenticationChallenge *aChallenge))challengeBlock completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))handler {
	NSURLConnection *urlConnection = nil;
	BUNSURLConnectionServerTrustDelegate *delegate = [[BUNSURLConnectionServerTrustDelegate alloc] init];
	delegate.completion = handler;
	delegate.challengeBlock = challengeBlock;
	
	urlConnection = [[NSURLConnection alloc] initWithRequest:aRequest delegate:delegate];
}

@end
