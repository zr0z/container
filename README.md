Container
=========

Simple Mac OSX application container for web technologies.

Installation
------------

This project needs (cocoapods)[http://beta.cocoapods.org) 
for managing its dependencies.

    $ sudo gem install cocoapods

Install the dependencies in the Container project.

    $ pod install

Make sure to always open the Xcode workspace instead 
of the project file when building your project:

    $ open Container.xcworkspace

Usage
-----

The document root of your html project is in `Resources/www`.
You can add directly your file in the finder and they will
appear in your project.

The entry point must be an `index.html` file.

Build and enjoy.

WebGL
-----

If you want to enable webgl in the webview, you can add the following
lines at the beggining of the `-applicationDidFinishLaunching` method:
    
    // Enable WebGL.
    WebPreferences *preferences = [self.webView preferences];
    if ([preferences respondsToSelector:@selector(setWebGLEnabled:)])
    {
        [preferences performSelector:@selector(setWebGLEnabled:)
                          withObject: [NSNumber numberWithBool:YES]];
    }
