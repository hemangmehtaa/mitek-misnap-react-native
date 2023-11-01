//
//  ReactNativeMiSnapManager.h
//  AwesomeProject
//
//  Created by Hemang Mehta on 07/06/2023.
//

#ifndef ReactNativeMiSnapManager_h
#define ReactNativeMiSnapManager_h


#endif /* ReactNativeMiSnapManager_h */

//#import <RCTAppDelegate.h>
#import <UIKit/UIKit.h>

#import <React/RCTBridgeModule.h>
#import <React/RCTConvert.h>
#import <React/RCTDefines.h>
#import <React/RCTEventDispatcherProtocol.h>
#import <React/RCTLog.h>
#import <React/UIView+React.h>
#import <MiSnapUX/MiSnapUX.h>

@class RCTBridge;
@class RCTShadowView;
@class RCTSparseArray;
@class RCTUIManager;


typedef void (^RCTViewManagerUIBlock)(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry);

@interface ReactNativeMiSnapManager : NSObject <RCTBridgeModule, MiSnapViewControllerDelegate>

//@property(nonatomic, copy) RCTDirectEventBlock onShow;
@property(nonatomic, strong)MiSnapViewController *miSnapViewController;
@property(nonatomic, weak) RCTBridge *bridge;

@end
