//
//  Z0AppDelegate.h
//  Container
//
//  Created by Zaidin Amiot on 1/29/13.
//  Copyright (c) 2013 Zaidin Amiot. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class HTTPServer;
@class WebView;

@interface Z0AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *webView;
@property (retain) HTTPServer *httpServer;

@end
