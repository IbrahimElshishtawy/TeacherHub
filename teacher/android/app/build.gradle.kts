plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}
android {
    compileSdkVersion 32

    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 32
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    // Enable core library desugaring to support Java 8+ features
    buildTypes {
        release {
            // Add this to enable desugaring
            coreLibraryDesugaringEnabled true
        }
    }
}

dependencies {
    // Add the core library desugaring dependency
    coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:1.2.0'
}

dependencies {
    // إضافة الاعتماد اللازم ل coreLibraryDesugaring
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:1.2.0")

    // باقي الاعتماديات
    implementation("com.journeyapps:zxing-android-embedded:4.3.0")
    implementation("androidx.appcompat:appcompat:1.4.2")
    implementation("com.google.zxing:core:3.5.0")
}

flutter {
    source = "../.."
}