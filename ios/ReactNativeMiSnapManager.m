//
//  ReactNativeMiSnapManager.m
//  AwesomeProject
//
//  Created by Hemang Mehta on 07/06/2023.
//

#import <Foundation/Foundation.h>
#import "ReactNativeMiSnapManager.h"
#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import <React/RCTLog.h>
#import "AppDelegate.h"
#import <MiSnapLicenseManager/MiSnapLicenseManager.h>
#import <MiSnap/MiSnap.h>
#import <MiSnapUX/MiSnapUX.h>

#import <React/RCTAssert.h>
#import <React/RCTBorderCurve.h>
#import <React/RCTBorderStyle.h>
#import <React/RCTBridge.h>
#import <React/RCTConvert+Transform.h>
#import <React/RCTConvert.h>
#import <React/RCTLog.h>
#import <React/RCTShadowView.h>
#import <React/RCTUIManager.h>
#import <React/RCTUIManagerUtils.h>
#import <React/RCTUtils.h>
#import <React/RCTView.h>
#import <React/UIView+React.h>
#import <React/RCTTouchHandler.h>

@implementation RCTConvert (UIAccessibilityTraits)

@end

@implementation ReactNativeMiSnapManager
{
  __weak RCTBridge *_bridge;
  BOOL _isPresented;
  MiSnapViewController *_miSnapViewController;
  RCTTouchHandler *_touchHandler;
  
    CGRect _lastViewFrame;
  
}

RCT_EXPORT_MODULE()


@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue
{
  return RCTGetUIManagerQueue();
}

- (void)setBridge:(RCTBridge *)bridge
{
  RCTErrorNewArchitectureValidation(
      RCTNotAllowedInBridgeless, self, @"RCTViewManager must not be initialized for the new architecture");
  _bridge = bridge;
}

- (UIView *)view
{
  return [RCTView new];
}

- (RCTShadowView *)shadowView
{
  return [RCTShadowView new];
}

RCT_EXPORT_METHOD(initiateAnyIdDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Any ID document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [[MiSnapLicenseManager shared] setLicenseKey:license];
    MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypeAnyId];
    _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Any ID document capture - End");
}

RCT_EXPORT_METHOD(initiatePassportDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [[MiSnapLicenseManager shared] setLicenseKey:license];
    MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypePassport];
    _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate passport document capture - End");
}

RCT_EXPORT_METHOD(initiateFrontIdDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Front Id document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [[MiSnapLicenseManager shared] setLicenseKey:license];
    MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypeIdFront];
    _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Front Id document capture - End");
}

RCT_EXPORT_METHOD(initiateBackIdDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Back Id document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [[MiSnapLicenseManager shared] setLicenseKey:license];
    MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypeIdBack];
    _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Back Id document capture - End");
}

RCT_EXPORT_METHOD(initiateFrontCheckDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Front Check document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [[MiSnapLicenseManager shared] setLicenseKey:license];
    MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypeCheckFront];
    _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Front Check document capture - End");
}

RCT_EXPORT_METHOD(initiateBackCheckDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Back Check document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [[MiSnapLicenseManager shared] setLicenseKey:license];
    MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypeCheckBack];
    _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Back Check document capture - End");
}

RCT_EXPORT_METHOD(initiateGenericDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate generic document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [[MiSnapLicenseManager shared] setLicenseKey:license];
    MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypeGeneric];
    _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate generic document capture - End");
}

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(getName)
{
  return [[UIDevice currentDevice] name];
}

- (NSArray<NSString *> *)customBubblingEventTypes __attribute__((deprecated("Use RCTBubblingEventBlock props instead."))) {
  
  return [[NSArray alloc] init];
}

+ (BOOL) requiresMainQueueSetup {
  return YES;
}

- (void)miSnapCancelled:(MiSnapResult * _Nonnull)result {
  
}

- (void)miSnapException:(NSException * _Nonnull)exception {
  
}

- (void)miSnapLicenseStatus:(MiSnapLicenseStatus)status {
  
}

- (void)miSnapSuccess:(MiSnapResult * _Nonnull)result {
  RCTLogInfo(@"******** yay ********* %@", result.mibi.string);
}

@end
