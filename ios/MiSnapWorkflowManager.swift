//
//  MiSnapWorkflowManager.swift
//  AwesomeProject
//
//  Created by Hemang Mehta on 11/12/2023.
//

import Foundation
import UIKit

import CoreNFC
import MiSnap
import MiSnapFacialCapture
import MiSnapVoiceCapture
import MiSnapNFC
import MiSnapCore

@objcMembers
class MiSnapWorkflowManager: UIViewController, MiSnapWorkflowViewControllerDelegate {
  func miSnapWorkflowLicenseStatus(_ status: MiSnapLicenseStatus) {
    
  }
  
  func miSnapWorkflowSuccess(_ result: MiSnapWorkflowResult) {
    
  }
  
  func miSnapWorkflowCancelled(_ result: MiSnapWorkflowResult) {
    
  }
  
  func miSnapWorkflowError(_ result: MiSnapWorkflowResult) {
    
  }
  

  
  
  @objc
  public func initiatePassportDocumentCapture(license: String) -> UIViewController {
    
    let main = DispatchQueue.main
//    main.sync {
      MiSnapLicenseManager.shared.setLicenseKey(license)
      let miSnapWorkflowVC = MiSnapWorkflowViewController(with: [.idFront, .idBack, .face], delegate: self)
    
    return miSnapWorkflowVC
//      presentWorkflowVC(miSnapWorkflowVC)
//    AppDelegate.window?.rootViewController.presentviewcon
//    }
    
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//      [[MiSnaplicenseManager shared] setlicenseKey:license];
//      MiSnapConfiguration *configuration = [[MiSnapConfiguration alloc] initFor:MiSnapScienceDocumentTypeAnyId];
//      
//      
//      [MiSnapWorkflowManager someMethod];
//      
//      _miSnapViewController = [[MiSnapViewController alloc] initWith:configuration delegate:self];
//      AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//      [appDelegate.window.rootViewController presentViewController:self.miSnapViewController animated:YES completion:nil];
//    });
    
    
    
    
  }
  
  @objc
  class public func initiateIdFrontDocumentCapture(license: String) {
    
  }
  
  @objc
  class public func initiateIdBackDocumentCapture(license: String) {
    
  }
  
  @objc
  class public func initiatePassportDocumentCaptureAndNfc(license: String) {
    
  }
  
  @objc
  class public func initiateIdFrontDocumentCaptureAndNfc(license: String) {
    
  }
  
  @objc
  class public func initiateIdBackDocumentCaptureAndNfc(license: String) {
    
  }
  
  @objc
  class public func initiatePassportDocumentCaptureAndNfcAndFace(license: String) {
    
  }
  
  @objc
  class public func initiateIdFrontDocumentCaptureAndNfcAndFace(license: String) {
    
  }
  
  @objc
  class public func initiateIdBackDocumentCaptureAndNfcAndFace(license: String) {
    
  }
  
  

  
  private func presentWorkflowVC(_ vc: MiSnapWorkflowViewController) {
      let minDiskSpace: Int = 10 // Min disk spece in MB required to invoke MiSnapVoiceCaptureViewController
      if !MiSnapWorkflowViewController.hasMinDiskSpace(minDiskSpace) {
          presentAlert(withTitle: "Not Enough Space", message: "Please, delete old/unused files to have at least \(minDiskSpace) MB of free space")
          return
      }

      MiSnapWorkflowViewController.checkMicrophonePermission { granted in
          if !granted {
              let message = "Microphone permission is required to record your voice samples that will be used for your enrollement and verification"
              self.presentPermissionAlert(withTitle: "Microphone Permission Denied", message: message)
              return
          }

          MiSnapWorkflowViewController.checkCameraPermission { granted in
              if !granted {
                  let message = "Camera permission is required to take your selfie that will be used for your enrollement and verification"
                  self.presentPermissionAlert(withTitle: "Camera Permission Denied", message: message)
                  return
              }

              DispatchQueue.main.async {
                  self.present(vc, animated: true, completion: nil)
              }
          }
      }
  }
  
  private func presentAlert(withTitle title: String?, message: String?) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
      alert.addAction(ok)
      
      present(alert, animated: true, completion: nil)
  }
  

  
  private func presentPermissionAlert(withTitle title: String?, message: String?) {
      DispatchQueue.main.async {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
          let openSettings = UIAlertAction(title: "Open Settings", style: .cancel) { _ in
              if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
              }
          }
          alert.addAction(cancel)
          alert.addAction(openSettings)
          
          self.present(alert, animated: true, completion: nil)
      }
  }
  
}
