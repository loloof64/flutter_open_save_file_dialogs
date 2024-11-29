package com.loloof64.open_save_file_dialogs

import android.app.Activity
import android.content.Intent
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry
import java.io.FileInputStream
import java.io.FileOutputStream

typealias CallbackString = (Result<String?>) -> Unit

/** OpenSaveFileDialogPlugin */
class OpenSaveFileDialogsPlugin :
    FlutterPlugin, OpenSaveFileDialogs, ActivityAware, PluginRegistry.ActivityResultListener {

  companion object {
    val SAVE_FILE_DIALOG_CODE = 1
    val OPEN_FILE_DIALOG_CODE = 2
  }

  private var activity: Activity? = null
  private var saveFileCallback: CallbackString? = null
  private var openFileCallback: CallbackString? = null
  private var contentToSave: String? = null

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    OpenSaveFileDialogs.setUp(binding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    OpenSaveFileDialogs.setUp(binding.binaryMessenger, null)
  }

  override fun saveFileDialog(content: String, startingFileName: String?, callback: CallbackString) {
    saveFileCallback = callback
    contentToSave = content
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

  override fun openFileDialog(callback: CallbackString) {
    openFileCallback = callback
    val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
      addCategory(Intent.CATEGORY_OPENABLE)
      type = "text/plain"
  }
    activity?.startActivityForResult(intent, OPEN_FILE_DIALOG_CODE)
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
        if (contentToSave == null) {
          saveFileCallback?.invoke(Result.failure(Exception("Could not create file")))
          saveFileCallback = null
          contentToSave = null
          return true
        }
        val uri = data?.data
        if (uri == null) {
          saveFileCallback?.invoke(Result.failure(Exception("Could not create file")))
          saveFileCallback = null
          contentToSave = null
          return true
        }
        val fileDescriptor = try {
          activity?.contentResolver?.openFileDescriptor(uri, "w")?.fileDescriptor
        } catch (e: Exception) {
          saveFileCallback?.invoke(Result.failure(Exception("File descriptor could not be found")))
          saveFileCallback = null
          contentToSave = null
          return true
        }
        if (fileDescriptor == null) {
          saveFileCallback?.invoke(Result.failure(Exception("File descriptor could not be found")))
          saveFileCallback = null
          contentToSave = null
          return true
        }

        val outputStream = FileOutputStream(fileDescriptor!!)
        outputStream.write(contentToSave!!.toByteArray())
        outputStream.close()

        val newFileName = uri!!.path?.split("/")?.last() ?: "#Error:unknown#"
        saveFileCallback?.invoke(Result.success(newFileName))

        saveFileCallback = null
        contentToSave = null
        return true
      } else {
        saveFileCallback?.invoke(Result.success(null))

        saveFileCallback = null
        contentToSave = null
        return true
      }
    }
    else if (requestCode == OPEN_FILE_DIALOG_CODE) {
      if (resultCode == Activity.RESULT_OK) {
        val uri = data?.data
        if (uri == null) {
          openFileCallback?.invoke(Result.failure(Exception("File not found")))
          openFileCallback = null
          return true
        }
        val fileDescriptor = try {
          activity?.contentResolver?.openFileDescriptor(uri, "r")?.fileDescriptor
        } catch (e: Exception) {
          openFileCallback?.invoke(Result.failure(Exception("File descriptor could not be found")))
          openFileCallback = null
          return true
        }
        if (fileDescriptor == null) {
          openFileCallback?.invoke(Result.failure(Exception("File descriptor could not be found")))
          openFileCallback = null
          return true
        }

        val inputStream = FileInputStream(fileDescriptor!!)
        val buffer = ByteArray(1024)
        var bytesRead: Int
        val stringBuilder = StringBuilder()

        while (inputStream.read(buffer).also { bytesRead = it } != -1) {
            stringBuilder.append(String(buffer, 0, bytesRead))
        }

        inputStream.close()

        openFileCallback?.invoke(Result.success(stringBuilder.toString()))

        openFileCallback = null
        return true
      }
    }
    return true
  }
}
