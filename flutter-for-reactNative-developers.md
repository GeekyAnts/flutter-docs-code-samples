
# Dart for Javascript developers


## Entry Point

`main()` is the entry function in Dart. In Javascript, we do not any specific entry function.

```
main() {
}
```
```
function main() {
  // To be used as the entry point, but it must be
}
  // has to be called manually.
main();
```

## Printing to the console

```
print('Hello World');
```
```
console.log('Level completed.');
```

## Variables
### Creating and Assigning Variables

Dart variable can be typed but don’t need to be. Whereas, Javascript variables cannot be typed.

```
String name = 'dart';
var otherName = 'Dart';
```
```
var name = 'JavaScript';

```

### Default value

Uninitialized variables have an initial value of null. Even variables with numeric types are initially null, because numbers are objects in Dart, whereas, it is undefined in JavaScript.

```
var name; // == null
int x; // == null
```
```
var name; // == undefined
```

### Hoisting

Dart does not hoist variables unlike JavaScript which hoists variables to the top of their scope.

```
printName() {
  print('Hello, $name');
  var name = 'dart';
} // compilation error here

printName() {
  var name = 'dart';
  print('Hello, $name');
} // Hello, dart
```
```
function printName() {
  console.log('Hello, ' + name);
  var name = 'Bob';
} 
printName(); // Hello, undefined

function printName() {
  var name;
  console.log('Hello, ' + name);
  name = 'Bob';
}

printName(); // Hello, undefined
```

## Checking for null/zero 
The only value that is true is the boolean value true. Unlike JavaScript, other values such as 1 or non-null object are not treated as true.

```
var myNull = null;

if (myNull == null) {
  print('use == null to check null');
}
var zero = 0;

if (zero == 0) {
  print('use == 0 to check zero');
}
```
```
var myNull = null;

if (!myNull) {
  console.log('null is treated as false');
}
var zero = 0;

if (!zero) {
  console.log('0 is treated as false');
}
```

## Functions

```
// Specifying the return type of the function
// in Dart is optional.
fn() {
  ...
  return true;
}

// can also be written as
bool fn() {
  ...
  return true;
}
```
```
function fn() {
  ...
  return true;
}
```

## Iterators
```
var data = { ... };

for (var key in data.keys) {
  print('$key, ${data[key]}');
}

// Alternatively, the forEach loop is a method on a Map in Dart.

data.forEach((key, value) {
  print('${key}, ${value}');
});
```
```
var data = { ... };

for (var key in data) {
  console.log('key', key);
  console.log('value', data[key]);
}
```
**Note:** Check [here](https://www.dartlang.org/resources/synonyms) for more differences.





# Learn The Basics

## What is the equivalent of Hello World program in Flutter?

In React Native, you would start off your development process by creating the project using `create-react-native-app` command line tool. The equivalent in [Flutter](https://flutter.io/getting-started/) is the `flutter` command line tool. 


| flutter create flutterhelloworld | create-react-native-app rnhelloworld| 
| --------------------------------- |:-------------:| 



## How do I use import Statements?

```
import React from "react"; 
import { StyleSheet, Text, View } from "react-native"; 
``` 

Contrary to React Native way of importing each component as they are used, In Flutter, you import the `material.dart` from the flutter package, which allows you to not only use any widget without exclusively importing it but to be able to follow the widget to its root file and understand how it internally implements it. 

```import 'package:flutter/material.dart';```

Let’s have a look at each of the classes :

 ``` 
 void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
          mainAxisAlignment:   MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Hello World',
            ),
          ],
        ),
      );
  }
} 
```

```
export default class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>Hello World</Text>
      </View>
    );
  }
}
```

The App class in React Native extends a React.Component and implements the render method by returning a view component as shown. 
In Flutter, the execution starts off with the runApp method and the widget/widget tree is passed as the parameter. 

## How do I use Widgets and nest them to form a Widget tree?

When writing an app, you’ll commonly author new widgets that are subclasses of either [StatelessWidget](https://docs.flutter.io/flutter/widgets/StatelessWidget-class.html) or [StatefulWidget](https://docs.flutter.io/flutter/widgets/StatefulWidget-class.html), depending on whether your widget manages any state. Here, MyApp class extends a StatelessWidget and ovverrides a build function, which describes the widget in terms of other, lower-level widgets. 

 In this example, the widget tree consists of two widgets, the [Center](https://docs.flutter.io/flutter/widgets/Center-class.html) widget and its child, the [Text](https://docs.flutter.io/flutter/widgets/Text-class.html) widget. The framework forces the root widget to cover the screen, which means the text “Hello World” ends up centered on screen.

***Note*** :  Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/hello-world/flutterhelloworld) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/hello-world/rnhelloworld) code.

# Project Structure & Resources

## Where do I start writing the code?

If you have used CRNA, you started writing the code in `App.js`. In Flutter, the entry file is `’root’/lib/main.dart` and execution starts from the main function.

[Folder Image](add folder structure image here)


## How are files structured in a Flutter app?

<pre>
┬
└ root
	┬
    ├ .idea
    ├ android
	├ build
	├ ios
    ├ lib
    	┬
    	└ main.dart
    ├ test
    └ pubspec.yaml
</pre>

<b>`root/.idea`</b> - IDE’s project specific settings files.

<b>`root/android`</b> -  file containing android native code.

<b>`root/build`</b> - stores iOS apk and Android app installation packages.

<b> `root/ios` </b> - file containing iOS native code.

<b> `root/lib` </b> - dart source files.

<b>`root/test`</b> - automated test files.

<b>`root/pubspec.yaml`</b> - metadata for the app. Equivalent of `package.json` in React Native

## What are the standard practices to structure your mobile app?

To better structure your app, all the source files go into `/lib`.

<pre>
┬
└ root
	┬
    ├ lib
    	┬
        ├ components
        ├ screens
        ├ utils
        ├ themes
        ├ routes.dart
    	└ main.dart
</pre>

<b>`lib/components`</b> - contains all the small components.

<b>`lib/screens`</b> - contains screens using components.

<b>`lib/utils`</b> - contains reusable functions.

<b>`lib/themes`</b> - contains themes which can be used globally.

<b>`lib/routes.dart`</b> - contains all the routes.

<b>`lib/main.dart`</b> - entry point the app.

## How do I install packages/libraries?

* Just add the packages in `pubspec.yaml` dependencies.
* run `flutter packages get` from the terminal.

In Flutter, `flutter packages get` is equivalent of `yarn add {package-name}` / ` npm install {package-name}`





# Views

## What is the equivalent of a `View` in Flutter?

In React Native, View is a container that supports layout with flexbox, style, some touch handling, and accessibility controls. In Flutter, we have layout specific widgets like [Container](https://docs.flutter.io/flutter/widgets/Container-class.html), [Column](https://docs.flutter.io/flutter/widgets/Column-class.html), [Row](https://docs.flutter.io/flutter/widgets/Row-class.html), [Center](https://docs.flutter.io/flutter/widgets/Center-class.html) etc. Check the [layout widget catalog](https://flutter.io/widgets/layout/).

## What is the equivalent of `FlatList` / `ListView`?

A scrollable list of widgets arranged linearly.
In React Native we use FlatList or ListView for a performant interface for rendering simple, flat lists.

```
<FlatList
  data={[ ... ]}
  renderItem={({ item }) => <Text>{item.key}</Text>}
/>
```
In Flutter, we use [`ListView`](https://docs.flutter.io/flutter/widgets/ListView-class.html) is the most commonly used scrolling widget. It renders the child widget for `itemCount` number of times. 
```
var data = [ ... ];
new ListView.builder(
	itemCount: data.length,
	itemBuilder: (context, int index) {
		return new Text(
        	data[index],
		);
	},
)
```

***Note*** :  Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/scrollable/flutterscrollable/lib/main.dart) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/scrollable/rnscrollable/App.js) code.

## How do I use a Canvas to draw/paint?

In React Native, no in-built component is present, so we use third party libraries like `react-native-canvas` to use canvas.



```
handleCanvas = canvas => {
  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "skyblue";
  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx.fillRect(150, 100, 300, 300);
  ctx.stroke();
  };
  render() {
    return (
      <View>
        <Canvas ref={this.handleCanvas} />
      </View>
    );
}
```

In Flutter, we use [`CustomPaint`](https://docs.flutter.io/flutter/widgets/CustomPaint-class.html) widget to draw during the paint phase. We implement abstract class [`CustomPainter`](https://docs.flutter.io/flutter/rendering/CustomPainter-class.html) and pass it to `painter` property in `CustomPaint` widget. 
```
class MyCanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.amber;
    canvas.drawCircle(new Offset(100.0, 200.0), 40.0, paint);
    Paint paintRect = new Paint();
    paintRect.color = Colors.lightBlue;
    Rect rect =
        new Rect.fromPoints(new Offset(150.0, 300.0), new Offset(300.0, 400.0));
    canvas.drawRect(rect, paintRect);
  }

  bool shouldRepaint(Sky oldDelegate) => false;
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}

class _MyCanvasState extends State<MyCanvas> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomPaint(
        painter: new MyCanvasPainter(),
      ),
    );
  }
}
```

***Note*** :  Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/scrollable/flutterscrollable/lib/main.dart) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/scrollable/rnscrollable/App.js) code.



# Layouts

## How do I layout my Widgets? 

In React Native, you would normally use the style prop on the view component to specify the flex, flex direction, alignItems and so on to layout the underlying components like this :  

```
<View
  style={{
   flex: 1,
   flexDirection: "column",
   justifyContent: “space-between”,
   alignItems: “center”
  }}
>
``` 


The main thing to keep in mind is that unlike web styling, and even React Native styling where Views perform all layout and also perform some styling, Layout is determined by a combination of the type of Widget you choose and its layout & styling properties. In Flutter, everything is a widget even the ones required to layout the underlying widgets.



For example, the [Column](https://docs.flutter.io/flutter/widgets/Column-class.html) takes an array of children and not any styling properties (only layout properties such as `CrossAxisAlignment` and `direction` among others), while [Container](https://docs.flutter.io/flutter/widgets/Container-class.html) takes a combination of layout and styling properties. You could use a `center` widget to center the child widget tree.The framework forces the root widget to cover the screen, which means the descendent widget tree ends up centered on screen.

```
new Center(
	child: new Container(
      child: new Column(
      mainAxisAlignment: mainaxis,
        children: <Widget>[
          new Container(
            color: Colors.red,
            width: 100.0,
            height: 100.0,
          ),
          new Container(
            color: Colors.blue,
            width: 100.0,
            height: 100.0,
          ),
          new Container(
            color: Colors.green,
            width: 100.0,
            height: 100.0,
          ),
        ],
      ),
	)
);
```



Another example would be when you need to align your components in a [Row](https://docs.flutter.io/flutter/widgets/Row-class.html) or [Column](https://docs.flutter.io/flutter/widgets/Column-class.html). In React Native, you would specify it as a prop. `flexDirection: “row”` . But in Flutter, you would use a Row widget and provide the required widget/widget tree as its children. 

***Note*** :  Check the working code for [Flutter]https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/Layout_sample/flutter-basic-layout-code/basiclayout_sample) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/Layout_sample/rn-simple-layout) code.





# Styling

## How to custom style my components in Flutter?

In React Native we can add style inline as well as use stylesheets.
```
<View style={styles.container}>
	<Text style={{ fontSize: 32, color: "cyan", fontWeight: "600" }}>
		This is a sample text
	</Text>
</View>
```
```
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center"
  }
});
```

Similarly in Flutter, widgets are highly customizable and layout specific components like [`Padding`](https://docs.flutter.io/flutter/widgets/Padding-class.html), [`Center`](https://docs.flutter.io/flutter/widgets/Center-class.html),[`Card`](https://docs.flutter.io/flutter/material/Card-class.html), [`Stack`](https://docs.flutter.io/flutter/widgets/Stack-class.html) etc. can be used. If you want to use same text style at multiple places, you can use [`TextStyle`](https://docs.flutter.io/flutter/dart-ui/TextStyle-class.html) class and provide it to style property of Text.
```
var textStyle = new TextStyle(
      fontSize: 32.0, color: Colors.cyan, fontWeight: FontWeight.w600);
```
```
new Center(
	child: new Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: <Widget>[
			new Text(
				'Sample text',
				style: textStyle,
			),
			new Padding(
				padding: new EdgeInsets.all(20.0),
				child: new Icon(Icons.lightbulb_outline,
                	size: 48.0, color: Colors.redAccent)
			),
		],
	),
)
```
***Note*** :  Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/styling/flutterstyling/lib/main.dart) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/styling/rnstyling/App.js) code.



## How to use `Icons` and `Colors` in Flutter?

In React Native, there is no in-built support for icons. Third party libraries have to be used.

Flutter has in-built support for material icons and to use them [`Icons`](https://docs.flutter.io/flutter/material/Icons-class.html) class is used. You can get the list of all icons [here](https://docs.flutter.io/flutter/material/Icons-class.html#constants).

For Colors, [`Colors`](https://docs.flutter.io/flutter/material/Colors-class.html) class is used which uses Material design's [color palette](https://material.io/guidelines/style/color.html).
```
new Icon(Icons.lightbulb_outline, color: Colors.redAccent)
```


## How to add style themes in Flutter?

In React Native, we define common themes for components in stylsheets and use it in components.

Similarly, we an add uniform styling for almost everything by defining it in [`themeData`](https://docs.flutter.io/flutter/material/ThemeData-class.html) class and passing it to theme property in [`MaterialApp`](https://docs.flutter.io/flutter/material/MaterialApp-class.html) that wraps all the widgets and acts as the root widget of the app.
```
class MyApp extends StatelessWidget {
  @override
	Widget build(BuildContext context) {
		return new MaterialApp(
			theme: new ThemeData(
        		primaryColor: Colors.cyan,
				brightness: Brightness.dark,
      		),
      		home: new MyHomePage(),
    	);
  	}
}
```



# State Management 

## State

In React Native, the state variables are defined and initialised in the constructor and the `setState` function is called which then calls the render method of the class. 
```

this.state = {
	buttonText: "blink",
	ifBlink: false,
	showText: true,
	text: "I love blinking"
};

this.setState({
	buttonText: "Stop blinking"
});
```

In Flutter, the [`setState`](https://docs.flutter.io/flutter/widgets/State/setState.html) function is directly called with the variables to be changed as shown :
```
setState((){
	showtext=!showtext;
});

```

***Note*** :  Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/State_sample/flutter_basic_statesample) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/State_sample/reactnative-state-sample) code.

## Props

React Native, most components can be customized when they are created, with different parameters. These creation parameters are called props. 

In Flutter you would just assign a local variable marked `final` with the prop received in the parameterised constructor and use in the subsequent code.


# Routing

## How do I navigate between screens in Flutter? 

In React Native, there are three main built-in navigators if you are using react-navigation-- StackNavigator, TabNavigator and DrawerNavigator. Each of these provide a way to configure and define the screens. From the example, this code snippet shows the definition of each of the navigators :

```

const MyApp = TabNavigator(
{ Home: { screen: HomeScreen }, Notifications: { screen: tabNavScreen } },
 {
   tabBarPosition: "bottom",
   animationEnabled: true,
   tabBarOptions: {
     activeTintColor: "#e91e63",
   }
 }
);

const SimpleApp = StackNavigator({
 Home: { screen: MyApp },
 stackScreen: { screen: StackScreen }
});

export default (MyApp1 = DrawerNavigator({
 Home: {
   screen: SimpleApp
 },
 Screen2: {
  screen: drawerScreen
 }
})
);

```


In Flutter, there are two main concepts to understand-- A [Route](https://docs.flutter.io/flutter/widgets/Route-class.html) is an abstraction for a “screen” or “page” of an app, and a [Navigator](https://docs.flutter.io/flutter/widgets/Navigator-class.html) is a widget that manages routes.
A `Navigator` is defined as a widget that manages a set of child widgets with a stack discipline.The navigator manages a stack of `Route` objects and provides methods for managing the stack, like [`Navigator.push`](https://docs.flutter.io/flutter/widgets/Navigator/push.html) and [`Navigator.pop`](https://docs.flutter.io/flutter/widgets/Navigator/pop.html).

At first the definition of the routes are provided as a parameter(routes)  to the [`MaterialApp`](https://docs.flutter.io/flutter/material/MaterialApp-class.html) widget.
 A code snippet from our example is as follows : 

```
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
   			
            	...
    
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => new usualNavscreen(),
      '/b': (BuildContext context) => new drawerNavscreen(),
    }
        
    			...
    );
  }
}

```
To navigate to named route :

```
Navigator.of(context).pushNamed('/a');
```

## How do I use Tab Navigation and Drawer Navigation in Flutter? 
In React Native, you would define a Tab and Drawer navigators and use them in your class to show tabs and drawers and navigate. 

In Flutter, we use [`drawer`](https://docs.flutter.io/flutter/material/Drawer-class.html) and [`bottomNavigationBar`](https://docs.flutter.io/flutter/material/TabBar-class.html) parameters of the [`Scaffold`](https://docs.flutter.io/flutter/material/Scaffold-class.html) to achieve the same. 

### Tab Navigation
In order to use Tab navigation, we need to use two widgets-- TabBar and TabBarView. 
A TabBar Widget is used to create a TabBar and Tab widgets are passed as children to the TabBar widget as shown bellow :
```
    TabController controller=new TabController(length: 3, vsync: this);

bottomNavigationBar: new Material (
        child: new TabBar(
          tabs: <Tab> [
        new Tab(icon: new Icon(Icons.person),),
        new Tab(icon: new Icon(Icons.email),),

      ],
          controller: controller,
      ),
        color: Colors.blue,
      ),
```
Also, a [`TabController`](https://docs.flutter.io/flutter/material/TabController-class.html) must be passed. A TabController coordinates tab selection between a [`TabBar`](https://docs.flutter.io/flutter/material/TabBar-class.html) and a [`TabBarView`](https://docs.flutter.io/flutter/material/TabBarView-class.html).

TabBarView widget is passed as the `body` parameter of the `Scaffold` widget. All the screens corresponding to the TabBar widget’s tabs are given as the children to TabBarView widget along with the same TabController as shown :
```
body: new TabBarView(
          children: <Widget> [
        new home.homeScreen(),
        new tabScreen.tabScreen()
      ],
      controller: controller,
      )

```

### Drawer navigation
A Drawer is simply called upon when a Drawer widget is passed along the drawer parameter to the `Scaffold` widget. You can provide a [`Button`](https://docs.flutter.io/flutter/material/RaisedButton-class.html), a [`Text`](https://docs.flutter.io/flutter/widgets/Text-class.html)  widget or a List of items to display as the child to the Drawer widget. In our example here, we have used a [`ListTile`](https://docs.flutter.io/flutter/material/ListTile-class.html) widget and provided navigation on tap. 
```
drawer: new Drawer(
        child:new ListTile(
              leading: new Icon(Icons.change_history),
              title: new Text('Screen2'),
              onTap: () {
                Navigator.of(context).pushNamed("/b");
              },
            ),
        elevation: 20.0,
      ),
```

***Note*** :  Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/Navigation_example/flutter_navigation) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/Navigation_example/reactnative-navigation-example) code.



# Gesture Detection and Touch Event Handling

## How do I add an click/press listeners to a widget in Flutter

In React Native, we can add various listeners to components using `Touchables` component or using `PanResponder`.

```
<TouchableOpacity
	onPress={() => { console.log("Press"); }}
	onLongPress={() => { console.log("Long Press"); }}
>
	<Text>Tap or Long Press</Text>
</TouchableOpacity>
```

In Flutter, First way could be using buttons or touchable widgets which have `onPress` parameters. Another way is wrapping widgets in [`GestureDetector`](https://docs.flutter.io/flutter/widgets/GestureDetector-class.html) widget which  can add event detection to any widget by just pass function in the respective callback.

```
new GestureDetector(
	child: new Scaffold(
		appBar: new AppBar(
			title: new Text("Gestures"),
        ),
        body: new Center(
			child: new Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
                    new Text('Tap, Double Tap, Long Press or Swipe')],
			)),
      	),
	onTap: () {
        print('Tap');
	},
	onDoubleTap: () {
		print('Double Tap');
	},
	onLongPress: () {
    	print('Long Press');
	},
	onVerticalDragStart: (DragStartDetails d) {
    	print('Swipe');
	},
);
```
Check the [list of all Flutter `GestureDetector` callbacks](https://docs.flutter.io/flutter/widgets/GestureDetector-class.html#Properties).

***Note*** : Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/gestures/fluttergestures/lib/main.dart) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/gestures/rngestures/App.js) code.


# Making HTTP Networking Requests

## How do I fetch data from API calls?


React Native provides the Fetch API for networking. You just have to make fetch request and then handle the response to get the data.
```
 _getIPAddress = () => {
  fetch("https://httpbin.org/ip")
      .then(response => response.json())
      .then(responseJson => {
          this.setState({ _ipAddress: responseJson.origin });
      })
      .catch(error => {
          console.error(error);
      });
};
```
Similar flow is followed in Flutter but it uses the dart:io core http support, so to create an HTTP Client we need to add an import.
```
import 'dart:io';
```
The client supports common HTTP operations, such as GET, POST, PUT, DELETE.

```
_getIPAddress() async {
    String url = 'https://httpbin.org/ip';
    var httpClient = createHttpClient();
    var response = await httpClient.get(url);
    String ip = JSON.decode(response.body)['origin'];
    setState(() {
		_ipAddress = ip;
    });
  }

```

**Note** :  Check the working code for [Flutter](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/api-calls/flutterapicalls/lib/main.dart) and its equivalent [React Native](https://github.com/GeekyAnts/flutter-docs-code-samples/blob/master/api-calls/rnapicalls/App.js) code.


# Form Input

## How do I use `TextInput` field in Flutter?

In React Native, typically you would use a TextInput component to show a text input box and use the callBack received everytime you changed the text in the box like (this)[] example. Validation is done upon click of the submit button and if checked then routed to the next screen. 

```

<TextInput
   placeholder="Enter you Password
   onChangeText={password => this.setState({ password })}
 />
 <Button title="Submit" onPress={this.validate} />

```

## How do I use `Forms` in Flutter?

In the Flutter land, we have a [`Form`](https://docs.flutter.io/flutter/widgets/Form-class.html) widget, where [`TextFormField`](https://docs.flutter.io/flutter/material/TextFormField-class.html) widgets along with the submit button are passed as children. The TextFromField widget has a parameter called [`onSaved`](https://docs.flutter.io/flutter/widgets/FormField/onSaved.html) which takes a function and executes when the form is saved. 
The process is to call methods on FormState to save, reset, or validate each FormField that is a descendant of this Form. To obtain the FormState, you may use Form.of with a context whose ancestor is the Form, or pass a GlobalKey to the Form constructor and call GlobalKey.currentState.  All the TextFormField’s onSaved functions will be called and upon saving the Text, validate them and then route to a different screen. You can check out the working code [here](https://github.com/GeekyAnts/flutter-docs-code-samples/tree/master/input-fields/flutterinputfields)

```
new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    validator: (value) =>
                        !value.contains('@') ? 'Not a valid email.' : null,
                    onSaved: (val) => _email = val,
          
                  ),
                  new TextFormField(
                    validator: (val) =>
                        val.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => _password = val,
                                       obscureText: true,
                  ),
                  new RaisedButton(
                    onPressed: _submit,
                    child: new Text('Login'),
                  ),
                ],
              ),
            ),

```


# Platform specific code

When building a cross-platform app, you'll want to re-use as much code as possible.Scenarios may arise where it makes sense for the code to be different. In React Native, separate implementation can be given at almost anywhere in the app code by recognizing the platform the app will run on. To get the target platform you need to use this component :

```
if (Platform.OS === "ios") {
      return "iOS";
    } else if (Platform.OS === "android") {
      return "android";
    } else {
      return "not recognised";
    }

```

The same goes in Flutter, 

```
if (Theme.of(context).platform == TargetPlatform.iOS) {
      return "iOS";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return "android";
    } else {
      return "fuchsia";
    } else {
      return "not recognised ";
    }

```




