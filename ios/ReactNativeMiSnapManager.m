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
#import "AwesomeProject-Bridging-Header.h"
#import "AwesomeProject-Swift.h"

@implementation RCTConvert (UIAccessibilityTraits)

@end

@implementation ReactNativeMiSnapManager
{
  __weak RCTBridge *_bridge;
  BOOL _isPresented;
  MiSnapWorkflowManager *miSnapWorkflowManager;
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

RCT_EXPORT_METHOD(initiatePassportDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    self->miSnapWorkflowManager = [[MiSnapWorkflowManager alloc] init];
    UIViewController *viewController = [self->miSnapWorkflowManager initiatePassportDocumentCaptureWithLicense:license];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Passport document capture - End");
}

//initiateFrontIdDocumentCapture
RCT_EXPORT_METHOD(initiateFrontIdDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    self->miSnapWorkflowManager = [[MiSnapWorkflowManager alloc] init];
    UIViewController *viewController = [self->miSnapWorkflowManager initiatePassportDocumentCaptureWithLicense:license];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Passport document capture - End");
}

//initiateBackIdDocumentCapture
RCT_EXPORT_METHOD(initiateBackIdDocumentCapture:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    self->miSnapWorkflowManager = [[MiSnapWorkflowManager alloc] init];
    UIViewController *viewController = [self->miSnapWorkflowManager initiatePassportDocumentCaptureWithLicense:license];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Passport document capture - End");
}

//initiatePassportAndNfcWorkflow
RCT_EXPORT_METHOD(initiatePassportAndNfcWorkflow:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    self->miSnapWorkflowManager = [[MiSnapWorkflowManager alloc] init];
    UIViewController *viewController = [self->miSnapWorkflowManager initiatePassportDocumentCaptureWithLicense:license];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Passport document capture - End");
}
//initiateIdAndNfcWorkflow
RCT_EXPORT_METHOD(initiateIdAndNfcWorkflow:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    self->miSnapWorkflowManager = [[MiSnapWorkflowManager alloc] init];
    UIViewController *viewController = [self->miSnapWorkflowManager initiatePassportDocumentCaptureWithLicense:license];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Passport document capture - End");
}

//initiatePassportNfcAndFaceWorkflow
RCT_EXPORT_METHOD(initiatePassportNfcAndFaceWorkflow:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    self->miSnapWorkflowManager = [[MiSnapWorkflowManager alloc] init];
    UIViewController *viewController = [self->miSnapWorkflowManager initiatePassportDocumentCaptureWithLicense:license];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Passport document capture - End");
}

//initiateIdNfcAndFaceWorkflow
RCT_EXPORT_METHOD(initiateIdNfcAndFaceWorkflow:(NSString *)license)
{
  RCTLogInfo(@"Initiate Passport document capture - Begin");
  
  dispatch_async(dispatch_get_main_queue(), ^{
    self->miSnapWorkflowManager = [[MiSnapWorkflowManager alloc] init];
    UIViewController *viewController = [self->miSnapWorkflowManager initiatePassportDocumentCaptureWithLicense:license];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
  });
  
  RCTLogInfo(@"Initiate Passport document capture - End");
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
