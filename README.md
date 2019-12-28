# flutter_manifest

Flutter package to manage Web App manifest.

https://developer.mozilla.org/en-US/docs/Web/Manifest

## Generate manifest

```
flutter pub run flutter_manifest:generate
```

### Add manifest to assets
```
flutter:
  assets:
    - manifest.json
```

### Use manifest in index.html
```
<head>
  ...
  <link rel="manifest" href="./assets/manifest.json">
</head>
```

### Override and/or add fields to manifest
```
flutter_manifest:
  orientation: "portrait"
  theme_color: "#F00"
  background_color: "#000"
```

## Read manifest
```
final manifest = await Manifest.read();
showAboutDialog(
  context: context,
  applicationName: manifest.name,
  applicationVersion: manifest.version,
  children: [
    Text(manifest.description)
  ]
);
```