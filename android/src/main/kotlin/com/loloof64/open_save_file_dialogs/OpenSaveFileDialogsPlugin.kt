package com.loloof64.open_save_file_dialogs

import android.app.Activity
import android.content.Intent
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry

typealias Callback = (Result<String?>) -> Unit

/** OpenSaveFileDialogPlugin */
class OpenSaveFileDialogsPlugin :
    FlutterPlugin, OpenSaveFileDialogs, ActivityAware, PluginRegistry.ActivityResultListener {

  companion object {
    val SAVE_FILE_DIALOG_CODE = 1
  }

  private var activity: Activity? = null
  private var callback: Callback? = null

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    OpenSaveFileDialogs.setUp(binding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    OpenSaveFileDialogs.setUp(binding.binaryMessenger, null)
  }

  override fun saveFileDialog(startingFileName: String?, callback: Callback) {
    this.callback = callback
    val intent =
        Intent(Intent.ACTION_CREATE_DOCUMENT).apply {
          addCategory(Intent.CATEGORY_OPENABLE)
          type = "text/plain"
          if (startingFileName != null) {
            putExtra(Intent.EXTRA_TITLE, startingFileName)
          }
        }
    activity?.startActivityForResult(intent, SAVE_FILE_DIALOG_CODE)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
    binding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (requestCode == SAVE_FILE_DIALOG_CODE) {
      if (resultCode == Activity.RESULT_OK) {
        val path = data?.data?.path
        callback?.invoke(Result.success(path))
      } else {
        callback?.invoke(Result.success(null))
      }
      callback = null
    }
    return true
  }
}
