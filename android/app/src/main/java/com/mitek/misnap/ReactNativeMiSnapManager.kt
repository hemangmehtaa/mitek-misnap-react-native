package com.mitek.misnap

import android.app.Activity
import android.content.Intent
import android.util.Base64
import android.util.Log
import com.facebook.react.bridge.*
import com.miteksystems.misnap.core.MiSnapSettings
import com.miteksystems.misnap.workflow.MiSnapFinalResult
import com.miteksystems.misnap.workflow.MiSnapWorkflowActivity
import com.miteksystems.misnap.workflow.MiSnapWorkflowError
import com.miteksystems.misnap.workflow.MiSnapWorkflowStep
import com.miteksystems.misnap.workflow.util.toServerResult

class ReactNativeMiSnapManager(reactContext: ReactApplicationContext) : MiSnap, ReactContextBaseJavaModule(reactContext) {

    private val misnapRequestCode = 3
    private var miSnapPromise: Promise? = null

    override fun getName(): String {
        return "ReactNativeMiSnapManager"
    }

    @ReactMethod
    fun initiatePassportDocumentCapture(license: String?) {
        try {
            //We do not have AnyId option in Android. Hence creating ID_Front
            val  miSnapPassportDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.PASSPORT, license!!)

            miSnapPassportDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            val miSnapWorkflowIntent = MiSnapWorkflowActivity.buildIntent(
                currentActivity!!,
                MiSnapWorkflowStep(miSnapPassportDocumentCaptureSettings)
            )

            currentActivity!!.startActivityForResult(
                miSnapWorkflowIntent,
                misnapRequestCode
            )
        } catch (e: Exception) {
            miSnapPromise!!.reject("ERROR_TRIGGERING_MISNAP_ACTIVITY", e)
            miSnapPromise = null
        }
    }

    @ReactMethod
    fun initiateFrontIdDocumentCapture(license: String?) {
        try {
            val  miSnapFrontIdDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.ID_FRONT, license!!)

            miSnapFrontIdDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            val miSnapWorkflowIntent = MiSnapWorkflowActivity.buildIntent(
                currentActivity!!,
                MiSnapWorkflowStep(miSnapFrontIdDocumentCaptureSettings),
            )

            currentActivity!!.startActivityForResult(
                miSnapWorkflowIntent,
                misnapRequestCode
            )
        } catch (e: Exception) {
            miSnapPromise!!.reject("ERROR_TRIGGERING_MISNAP_ACTIVITY", e)
            miSnapPromise = null
        }
    }

    @ReactMethod
    fun initiateBackIdDocumentCapture(license: String?) {
        try {
            val  miSnapBackIdDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.ID_BACK, license!!)

            miSnapBackIdDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            val miSnapWorkflowIntent = MiSnapWorkflowActivity.buildIntent(
                currentActivity!!,
                MiSnapWorkflowStep(miSnapBackIdDocumentCaptureSettings),
            )

            currentActivity!!.startActivityForResult(
                miSnapWorkflowIntent,
                misnapRequestCode
            )
        } catch (e: Exception) {
            miSnapPromise!!.reject("ERROR_TRIGGERING_MISNAP_ACTIVITY", e)
            miSnapPromise = null
        }
    }

    @ReactMethod
    fun initiatePassportAndNfcWorkflow(license: String?) {
        try {
            val  miSnapPassportDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.PASSPORT, license!!)
            val  miSnapNfcSettings = MiSnapSettings(MiSnapSettings.UseCase.NFC, license!!)

            miSnapPassportDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            miSnapNfcSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            val miSnapWorkflowIntent = MiSnapWorkflowActivity.buildIntent(
                currentActivity!!,
                MiSnapWorkflowStep(miSnapPassportDocumentCaptureSettings),
                MiSnapWorkflowStep(miSnapNfcSettings)
            )

            currentActivity!!.startActivityForResult(
                miSnapWorkflowIntent,
                misnapRequestCode
            )
        } catch (e: Exception) {
            miSnapPromise!!.reject("ERROR_TRIGGERING_MISNAP_ACTIVITY", e)
            miSnapPromise = null
        }
    }

    @ReactMethod
    fun initiateIdAndNfcWorkflow(license: String?) {
        try {
            val  miSnapFrontIdDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.ID_FRONT, license!!)
            val  miSnapBackIdDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.ID_BACK, license!!)
            val  miSnapNFCSettings = MiSnapSettings(MiSnapSettings.UseCase.NFC, license!!)

            miSnapFrontIdDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            miSnapBackIdDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            val miSnapWorkflowIntent = MiSnapWorkflowActivity.buildIntent(
                currentActivity!!,
                MiSnapWorkflowStep(miSnapFrontIdDocumentCaptureSettings),
                MiSnapWorkflowStep(miSnapBackIdDocumentCaptureSettings),
                MiSnapWorkflowStep(miSnapNFCSettings)
            )

            currentActivity!!.startActivityForResult(
                miSnapWorkflowIntent,
                misnapRequestCode
            )
        } catch (e: Exception) {
            miSnapPromise!!.reject("ERROR_TRIGGERING_MISNAP_ACTIVITY", e)
            miSnapPromise = null
        }
    }

    @ReactMethod
    fun initiatePassportNfcAndFaceWorkflow(license: String?) {
        try {
            val  miSnapPassportDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.PASSPORT, license!!)
            val  miSnapNfcSettings = MiSnapSettings(MiSnapSettings.UseCase.NFC, license!!)
            val  miSnapFaceSettings = MiSnapSettings(MiSnapSettings.UseCase.FACE, license!!)

            miSnapPassportDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            miSnapNfcSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            val miSnapWorkflowIntent = MiSnapWorkflowActivity.buildIntent(
                currentActivity!!,
                MiSnapWorkflowStep(miSnapPassportDocumentCaptureSettings),
                MiSnapWorkflowStep(miSnapNfcSettings),
                MiSnapWorkflowStep(miSnapFaceSettings)
            )

            currentActivity!!.startActivityForResult(
                miSnapWorkflowIntent,
                misnapRequestCode
            )
        } catch (e: Exception) {
            miSnapPromise!!.reject("ERROR_TRIGGERING_MISNAP_ACTIVITY", e)
            miSnapPromise = null
        }
    }

    @ReactMethod
    fun initiateIdNfcAndFaceWorkflow(license: String?) {
        try {
            val  miSnapFrontIdDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.ID_FRONT, license!!)
            val  miSnapBackIdDocumentCaptureSettings = MiSnapSettings(MiSnapSettings.UseCase.ID_BACK, license!!)
            val  miSnapNFCSettings = MiSnapSettings(MiSnapSettings.UseCase.NFC, license!!)
            val  miSnapFaceSettings = MiSnapSettings(MiSnapSettings.UseCase.FACE, license!!)

            miSnapFrontIdDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            miSnapBackIdDocumentCaptureSettings.apply {
                analysis.document.documentExtractionRequirement =
                    MiSnapSettings.Analysis.Document.ExtractionRequirement.OPTIONAL
            }

            val miSnapWorkflowIntent = MiSnapWorkflowActivity.buildIntent(
                currentActivity!!,
                MiSnapWorkflowStep(miSnapFrontIdDocumentCaptureSettings),
                MiSnapWorkflowStep(miSnapBackIdDocumentCaptureSettings),
                MiSnapWorkflowStep(miSnapNFCSettings),
                MiSnapWorkflowStep(miSnapFaceSettings)
            )

            currentActivity!!.startActivityForResult(
                miSnapWorkflowIntent,
                misnapRequestCode
            )
        } catch (e: Exception) {
            miSnapPromise!!.reject("ERROR_TRIGGERING_MISNAP_ACTIVITY", e)
            miSnapPromise = null
        }
    }

private val mActivityEventListener =
    object : BaseActivityEventListener() {
        override fun onActivityResult(
            activity: Activity?,
            requestCode: Int,
            resultCode: Int,
            intent: Intent?
        ) {
            if (requestCode == misnapRequestCode) {
                try {
                    if (miSnapPromise != null && resultCode == Activity.RESULT_OK) {
                        val rejection = Arguments.createMap()
                        val miSnapResult = Arguments.createMap()
                        val misnapSuccessSessions = Arguments.createArray()
                        /**
                         * Once the [ActivityResult] is available, get the available session results from
                         * [MiSnapWorkflowActivity.Result.results] and handle them accordingly.
                         *
                         * The list of results will match the order in which the [MiSnapWorkflowStep]s
                         * were defined at the time of creating the launch [Intent].
                         */

                        MiSnapWorkflowActivity.Result.results.forEachIndexed { _, stepResult ->
                            val session = Arguments.createMap()
                            when (stepResult) {
                                is MiSnapWorkflowStep.Result.Success -> {
                                    when (val result = stepResult.result) {
                                        is MiSnapFinalResult.DocumentSession -> {
                                            session.putString(misnapSessionsTypeKey, misnapDocumentSession)
                                            session.putArray(misnapSuccessSessionsWarningsKey, Arguments.fromList(result.warnings))

                                            val base64EncodedImg =
                                                Base64.encodeToString(result.jpegImage, Base64.NO_WRAP)
                                            session.putString(misnapResultMIBIKey, result.misnapMibiData.mibiData)
                                            session.putString(misnapResultImageKey, base64EncodedImg)
                                            session.putString(misnapResultPdf417Key, result.barcode?.encodedBarcode)
                                            // TODO check if this result is ok or we should parse mrz object into required strings...
                                            session.putString(misnapResultMrzKey, result.extraction?.mrz.toString())
                                            // session.putString(misnapResultVideoKey, result.video.contentToString())
                                        }

                                        is MiSnapFinalResult.FaceSession -> {
                                            session.putString(misnapSessionsTypeKey, misnapFaceSession)
                                            session.putArray(misnapSuccessSessionsWarningsKey, Arguments.fromList(result.warnings))

                                            val base64EncodedImg =
                                                Base64.encodeToString(result.jpegImage, Base64.NO_WRAP)
                                            session.putString(misnapResultMIBIKey, result.misnapMibiData.mibiData)
                                            session.putString(misnapResultImageKey, base64EncodedImg)
                                            // session.putString(misnapResultVideoKey, result.video.contentToString())
                                        }
                                        is MiSnapFinalResult.BarcodeSession -> {
                                            session.putString(misnapSessionsTypeKey, misnapBarcodeSession)
                                            session.putArray(misnapSuccessSessionsWarningsKey, Arguments.fromList(result.warnings))

                                            val base64EncodedImg =
                                                Base64.encodeToString(result.jpegImage, Base64.NO_WRAP)
                                            session.putString(misnapResultMIBIKey, result.misnapMibiData.mibiData)
                                            session.putString(misnapResultImageKey, base64EncodedImg)
                                            session.putString(misnapResultPdf417Key, result.barcode?.encodedBarcode)
                                            // session.putString(misnapResultVideoKey, result.video.contentToString())
                                        }
                                        is MiSnapFinalResult.NfcSession -> {
                                            session.putString(misnapSessionsTypeKey, misnapNfcSession)

                                            session.putString(misnapResultMIBIKey, result.misnapMibiData.mibiData)
                                            // TODO check if this result is ok or we should parse the [com.miteksystems.misnap.core.serverconnection.MiSnapTransactionResult] object into required strings...
                                            session.putString(misnapResultNfcServerDataKey, result.toServerResult().toString())
                                            // TODO We should parse the [com.miteksystems.misnap.nfc.NfcReader.ChipData] object into required strings (toString is override on porpouse)
                                            session.putString(misnapResultNfcChipDataKey, result.nfcData.toString())
                                            // session.putString(misnapResultVideoKey, result.video.contentToString())
                                        }

                                        else -> {}
                                    }
                                }
                                is MiSnapWorkflowStep.Result.Error -> {
                                    when (val errorResult = stepResult.errorResult.error) {
                                        is MiSnapWorkflowError.Permission -> {
                                            rejection.putString(misnapErrorPermissionKey, "No permission")
                                        }
                                        is MiSnapWorkflowError.Camera -> {
                                            rejection.putString(misnapErrorCameraKey, "Camera error")
                                        }
                                        is MiSnapWorkflowError.Cancelled -> {
                                            session.putString(misnapErrorCancelKey, "Cancelled")
                                        }
                                        is MiSnapWorkflowError.License -> {
                                            rejection.putString(misnapErrorLicenseKey, errorResult.reason)
                                        }
                                        is MiSnapWorkflowError.Analysis -> TODO()
                                        is MiSnapWorkflowError.SettingState -> TODO()
                                        is MiSnapWorkflowError.Nfc.DocumentNotNfcEnabled -> {
                                            session.putString("MISNAP_NFC_CANCELED", "NFC not supported by document")
                                        }
                                        is MiSnapWorkflowError.Nfc.DeviceDoesNotSupportNfc -> {
                                            session.putString("MISNAP_NFC_CANCELED", "NFC not supported by device")
                                        }
                                        is MiSnapWorkflowError.Nfc.InvalidCredentials -> TODO()
                                        is MiSnapWorkflowError.Nfc.Skipped -> {
                                            session.putString("MISNAP_NFC_CANCELED", "NFC Capture Skipped")
                                        }
                                        is MiSnapWorkflowError.CombinedWorkflow -> TODO()
                                        is MiSnapWorkflowError.CombinedWorkflowSkippedStep -> {
                                            session.putString("MISNAP_NFC_CANCELED", "NFC Capture Skipped")
                                        }

                                        else -> {}
                                    }
                                }
                            }
                            misnapSuccessSessions.pushMap(session)
                        }

                        if (rejection.keySetIterator().hasNextKey()) {
                            Log.e("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                            val iteraResult = rejection.entryIterator
                            while (iteraResult.hasNext()) {
                                val resultKey = iteraResult.next()
                                Log.i("MiSnapManager", resultKey.value.toString())
                            }
                            Log.e("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                            miSnapPromise!!.reject(misnapErrorLicenseKey, "MiSnap license error")
                        } else if (misnapSuccessSessions.size() > 0) {
                            miSnapResult.putArray(misnapResultSuccessSessionsKey, misnapSuccessSessions)
                            Log.i("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                            miSnapPromise!!.resolve(miSnapResult)
                        }

                    } else if (resultCode == Activity.RESULT_CANCELED) {
                        if (intent != null) {
                            Log.i("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                            Log.i("MiSnapManager", "BARCODE-SWITCH")
                            Log.i("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                            miSnapPromise!!.resolve("BARCODE-SWITCH")
                        } else {
                            Log.i("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                            Log.i("MiSnapManager", "MISNAP_CANCELED")
                            Log.i("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                            miSnapPromise!!.reject("MISNAP_CANCELED", "Capture Canceled")
                        }
                    }
                } catch (e: Exception) {
                    e.printStackTrace()
                    Log.i("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                    Log.i("MiSnapManager", "MISNAP ERROR")
                    Log.i("MiSnapManager", "<><><><><><><><> miSnapResult <><><><><><><><>")
                    miSnapPromise!!.reject("MISNAP_CANCELED", "Capture Canceled")
                } finally {
                    // Once you're done handling the results, clear them before invoking a new session.
                    MiSnapWorkflowActivity.Result.clearResults()
                    miSnapPromise = null
                }
            }
        }
    }

    init {
        reactContext.addActivityEventListener(mActivityEventListener)
    }
}
