package com.example.myapp

import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.stackmobile/termux"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "checkTermuxAPI" -> {
                        result.success(isPackageInstalled("com.termux.api"))
                    }
                    "executeCommand" -> {
                        val command = call.argument<String>("command")
                        result.success(mapOf(
                            "exitCode" to 0,
                            "output" to "Command execution not yet implemented: $command",
                            "error" to null
                        ))
                    }
                    "readFile" -> {
                        val path = call.argument<String>("path")
                        try {
                            val file = java.io.File(path!!)
                            if (file.exists() && file.canRead()) {
                                result.success(file.readText())
                            } else {
                                result.error("FILE_ERROR", "Cannot read file: $path", null)
                            }
                        } catch (e: Exception) {
                            result.error("READ_ERROR", e.message, null)
                        }
                    }
                    "writeFile" -> {
                        val path = call.argument<String>("path")
                        val content = call.argument<String>("content")
                        try {
                            java.io.File(path!!).writeText(content!!)
                            result.success(null)
                        } catch (e: Exception) {
                            result.error("WRITE_ERROR", e.message, null)
                        }
                    }
                    "listFiles" -> {
                        val path = call.argument<String>("path")
                        try {
                            val dir = java.io.File(path!!)
                            if (dir.exists() && dir.isDirectory) {
                                val files = dir.listFiles()?.map { it.name } ?: emptyList()
                                result.success(files)
                            } else {
                                result.error("DIR_ERROR", "Invalid directory: $path", null)
                            }
                        } catch (e: Exception) {
                            result.error("LIST_ERROR", e.message, null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun isPackageInstalled(packageName: String): Boolean {
        return try {
            packageManager.getPackageInfo(packageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }
}
