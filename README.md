# react-native-localizable

Decrease your bundle size by using translation directly from native layer as native a normal native app :)

### Instalation
```
npm install --save react-native-localizable
react-native link react-native-localizable
```

### Instalation Android 

```java
@Override
protected List<ReactPackage> getPackages() {
    return Arrays.<ReactPackage>asList(
        new MainReactPackage(),
        new RNLocalizablePackage(R.string.class) // << Add your application R.string here!
    );
}
```

### Instalation iOS 

Create Localizable.strings file as a normal iOS application.

### App side

```javascript 
    import Localizable from 'react-native-localizable';
    console.log(Localizable.STRING_FROM_NATIVE);
 ```
 
 ```typescript 
    import Localizable from 'react-native-localizable';
    
    interface Strings {
        STRING_FROM_NATIVE: string
    }
    
    const strings = Localizable as String;
    console.log(strings.STRING_FROM_NATIVE);
 ```
