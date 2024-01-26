#import "TestFlutterPlugin.h"
#import "message.h"
#import <Foundation/Foundation.h>

@interface TestFlutterPlugin () <AppNativeApi>
@end


@implementation TestFlutterPlugin


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
                                     methodChannelWithName:@"test_flutter_plugin"
                                     binaryMessenger:[registrar messenger]];
    TestFlutterPlugin *instance = [[TestFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    
    
    AppNativeApiSetup([registrar messenger], instance);
    
    
}

 


- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}





- (nullable NSString *)getBrokerIdWithError:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    return @"123";
}

- (nullable NSString *)getHostWithError:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    return @"10.253.22.122";
}



- (void)dealloc{
    NSLog(@"TestFlutterPlugin dealloc");
}


@end
