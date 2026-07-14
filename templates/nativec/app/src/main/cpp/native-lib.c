#include <jni.h>
#include <string.h>

JNIEXPORT jstring JNICALL
Java_com_apkgen_template_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject this) {
    char hello[] = "Hello from C";
    return (*env)->NewStringUTF(env, hello);
}