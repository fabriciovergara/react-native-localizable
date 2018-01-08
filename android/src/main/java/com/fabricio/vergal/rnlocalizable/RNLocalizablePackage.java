package com.fabricio.vergal.rnlocalizable;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class RNLocalizablePackage implements ReactPackage {

    private final Class<?> mStringClass;

    public RNLocalizablePackage(final Class<?> stringClass) {
        mStringClass = stringClass;
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }

    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        return Arrays.<NativeModule>asList(
            new RNLocalizableModule(reactContext, mStringClass)
        );
    }
}
