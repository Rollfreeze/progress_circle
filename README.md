The package provides a beautiful and simple to use widget that renders
a circle with its progress arc. You might need it to show your users 
some progress or activity in your app.

## Features

The widget is quite simple in useand customizable
so you may play with it to choose the appropriate configuration.
Here are some basic states which you can combine to get the necessary customization:

## Round your arc's head or tail
![Round your arc's head or tail](ex1.png)

## Set any icon to any part
![Set any icon to any part](ex2.png)

## Set some message and change the width
![Set some message and change the width](ex3.png)

## Set any color you want
![Set any color you want](ex4.png)

## Usage

To use the basic state just pass the required params:

```dart
ProgressCircle(
    boxSize: 300,
    completed: 7,
    total: 8,
),
```

You may round the head or tail:

```dart
ProgressCircle(
    boxSize: 300,
    completed: 7,
    total: 8,
    isRoundedHead: true,
    isRoundedTail: true,
),
```

If you want to set some icon:

```dart
ProgressCircle(
    boxSize: 300,
    completed: 7,
    total: 8,
    headIcon: Icons.star,
    tailIcon: Icons.star_border,
    headIconColor: Colors.white,
    tailIconColor: Colors.black,
),
```

Set your message to the center:

```dart
ProgressCircle(
    boxSize: 300,
    completed: 7,
    total: 8,
    centerMessage: 'You are beautiful!',
    centerMessageStyle: TextStyle(
        color: Colors.blue,
        fontSize: 14,
    ),
),
```

Play with arc with and change the color:

```dart
ProgressCircle(
    boxSize: 300,
    completed: 7,
    total: 8,
    arcWidth: 45,
    progressArcColor: Colors.orange,
    innerColor: Colors.redAccent,
),
```
