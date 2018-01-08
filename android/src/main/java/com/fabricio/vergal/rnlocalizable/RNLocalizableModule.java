package com.fabricio.vergal.rnlocalizable;

import android.content.res.Resources;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Nullable;

public class RNLocalizableModule extends ReactContextBaseJavaModule {

    private static final String MODULE_NAME = "RNLocalizable";
    private static final String STRING_FIELD = "string";

    private final Class<?> mStringClass;

    public RNLocalizableModule(final ReactApplicationContext reactContext,
                               final Class<?> stringClass) {
        super(reactContext);
        mStringClass = stringClass;
    }

    @Override
    public String getName() {
        return MODULE_NAME;
    }

    @Nullable
    @Override
    public Map<String, Object> getConstants() {
        final Map<String, Object> constants = new HashMap<>();
        final Resources resources = getReactApplicationContext().getResources();
        final String packageName = getReactApplicationContext().getPackageName();
        final Field[] fields = mStringClass.getDeclaredFields();

        for (int i = 0; i < fields.length; i++) {
            final Field field = fields[i];
            final String key = field.getName();
            final String value = getStringByName(resources, packageName, key);
            if (value != null) {
                constants.put(key, value);
            }
        }

        return constants;
    }

    private static final String getStringByName(final Resources res,
                                                final String pkgName,
                                                final String name) {
        String stringValue = null;
        try {
            final int id = res.getIdentifier(name, STRING_FIELD, pkgName);
            if (id != 0) {
                stringValue = res.getString(id);
            }
        } catch (Exception ignore) {
        }

        return stringValue;
    }
}
