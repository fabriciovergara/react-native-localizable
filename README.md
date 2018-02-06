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
On strings.xml
```xml
<resources>
    <string name="STRING_FROM_NATIVE">Hello from the NATIVE side, I must've called a thousand time...</string>
</resources>
```
### Instalation iOS 

Create Localizable.strings file as a normal iOS application.

On localizable.strings

```
"STRING_FROM_NATIVE" = "Hello from the NATIVE side, I must've called a thousand time...";
```

### App side

Javascript:
```javascript 
    import Localizable from 'react-native-localizable';
    console.log(Localizable.STRING_FROM_NATIVE);
 ```
 
 Typescript: 
 ```typescript 
    import Localizable from 'react-native-localizable';
    
    interface Strings {
        STRING_FROM_NATIVE: string
    }
    
    const strings = Localizable as String;
    console.log(strings.STRING_FROM_NATIVE);
 ```
