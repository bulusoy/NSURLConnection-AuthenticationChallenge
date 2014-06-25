//
//  NSURLConnection+AuthenticationChallenge.h
//
//  Created by Bilge Taylan Ulusoy on 20.06.14.
//  Copyright (c) 2014 Bilge Taylan Ulusoy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURLConnection (AuthenticationChallenge)

/*!
	@method			connectionWithRequest:willSendRequestForAuthenticationChallenge:completionHander:
	@methodgroup    Loading Data Asynchronously

	@abstract       Loads the data for a URL request and executes a handler block request completes or fails. If there is any authentication challenge, `challengeBlock` will be called.
	@discussion     If the request completes successfully, the data parameter of the handler block contains the resource data, and the error parameter is nil. If the request fails, the data parameter is nil and the error parameter contain information about the failure.
	@param          aRequest The URL request to load. The request object is deep-copied as part of the initialization process. Changes made to request after this method returns do not affect the request that is used for the loading process.
	@param			challengeBlock The challenge block which will be executed when the delegate receives connection:willSendRequestForAuthenticationChallenge:
	@param			handler The handler block to execute.
	@availability	Available since iOS 5.0 and later.
*/
+(void)connectionWithRequest:(NSURLRequest*)aRequest willSendRequestForAuthenticationChallenge:(void (^)(NSURLAuthenticationChallenge *aChallenge))challengeBlock completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))handler;

@end
