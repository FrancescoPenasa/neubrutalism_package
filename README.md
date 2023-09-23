Collection of simple and personalizable widgets in Neubrutalism design.

## Features

- NeuButton: buttons with two type of animations
- Incoming features: card and containers.

## Getting started

Just install the package `flutter pub add neubrutalism_theme` no further actions required.

## Usage
Usable as an `ElevatedButton`
```dart
const myBtn = Center(
  child: NeuButton(
    btnType: NeuBtnType.round,
      onPressed: () {
        isPressed = true;
        },
      child: const Text('Test Button'),
      ),
    );
```

## Additional information

I am still working on this package, any suggestion on new design or animations style arre encouraged and accepted.