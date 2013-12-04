//
//  Z0AppDelegate.m
//  Container
//
//  Created by Zaidin Amiot on 1/29/13.
//  Copyright (c) 2013 Zaidin Amiot. All rights reserved.
//

#import "Z0AppDelegate.h"
#import <WebKit/WebKit.h>
#import "HTTPServer.h"

@implementation Z0AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Enable Fullscreen
  [self.window setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
	
	// Initalize http server.
	self.httpServer = [[HTTPServer alloc] init];
	
	// Tell the server to broadcast its presence via Bonjour.
	[self.httpServer setType:@"_http._tcp."];
	
	// Set port.
  [self.httpServer setPort:54321];
	
	// Serve files from the standard Sites folder
  NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
	NSString *docRoot = [resourcePath stringByAppendingPathComponent:@"www"];
    
	[self.httpServer setDocumentRoot:docRoot];
	
	NSError *error = nil;
	if(![self.httpServer start:&error])
	{
		NSLog(@"Error starting HTTP Server: %@", error);
	}
    
  NSString *urlAddress = @"http://127.0.0.1:54321/";
  NSURL *url = [NSURL URLWithString:urlAddress];
  NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
  [[self.webView mainFrame] loadRequest:requestObj];
}
@end
