import 'package:flutter/material.dart';

import 'package:climax/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}


/*

 * The objective of making this app is to learn about asynchronous programming in Dart
 

  ! What you will create

   ? We create an app which is able to find out the live weather data in the current location of the device as well as the weather for any city you can think of! whose design was inspired by Olia Gozha

    ! What I learnt : 

     * How to use Dart to perform asynchronous task
     * Understand async and await
     * Learn about Futures and how to work with them
     * How to network with Dart http package
     * What APIs are and how to use them to get data from the internet
     * What JSONs are and how to parse them using the Dart convert package
     * How to pass data forwards and backwards between screens using Navigator
     * How to handle exceptions in Dart using try/catch/throw
     * Learn about lifecycle of Stateful Widgets and how to override them
     * How to use Geolocator package to get live location data for both android & ios
     * How to use TextField widget to take user input
     
     
    
    Goal :
      * We gonna be building a beautiful weather-app,in the process we learn how to get gps location of various devices

      * How can we network and make api-calls to grab live-data from internet

      
      I had classified all the different files into different sections

      ? Essentially,UI kept pretty simple & relatively easy because we gonna be doing lot of back-end stuff

   ? When we load up our app, first thing that happens ,it will load  up the loading-screen as the first route

   ? Inside this LoadingScreen,it will contain stateless widget with RaisedButton which says 'Get-Location'

   First thing taht we wanted to do is to grab  user's location when we tap on this button


   ! In order to do this,we gonna leverage the power of flutter packages and there's a package called geolocator- To be able to get location services for both Android & Ios

   We have to call single line of code as they described in the documentation

    Now,we gonna create a  new method,which is not gonna written anything all it can do is to get the location and inside this method,it's going to do everything necessary to be able to bring us the current user-location

   * To query the current location of the device,simply made a call to the getCurrentPosition,as input we mention how accurate the location to be

   ? We can get these time-comsuming tasks happening in the back-ground  instead of happening in fore-ground  and blocking-up our UI,freezing up our app

   We need to dedicate  time  specifically to learn about asynchronous programming in Dart

   The more accuracy it is,more battery-intensive will be
  
   To get the location,we need to make changes in the android folder/manifest.xml

    First thing,we need to do when we click on this button,it'll trigger some persmission  msg


   ! Dart Futures & Async-Await

   ? We need to understand what is Asynchronous Programming & Why it's useful?
  
    Synchronous behaviour- Everything happens synchronously(sequence-fashion)

    Let's say if you load an image asynchronously

     ? Nobody likes being on hold waiting on the call,you might realize that there's a different way of doing this task'Ask for passport number which eventually customer looks for passport number and then you get into task '

   * You could have draft the email and sent to customers one by one,after that you can do any of the task you need to do in this free-time

 ? As the replies come in,you can respond to them,you no longer have to be in phone waiting for their response

 ? Notice that  this is all being done by one worker that's you

* You're letting the customer take their time in finding passport number and only getting your attention once tehy have result

 We are setting the duration to 3 sec & will sleep the task up to duration period

 ? Instead of using synchronous sleep(),we can use Future.delayed() it has 2 arguments-one is duration and other one is computation task that runs after delay to simulate asynchronous behaviour

But,It will allow other lines of code to run if they can,once it's duration is done it'll trigger it's callback

It's good for some taks which takes or doing time-intensive operations But sometimes results of task to be able to continue to next task

If a task relies on asynchronous task,we can make our code actually wait,we know the task2 is asynchronous one and we allow other task to continue on,before proceeding to next-task we'll wait to definite amount of time to get finished by using async-await

We also need to make changes instead of returning string,we need to return future

 Future is something that will exist in the future
 Once our task completes,our future can be actual string or integer or any other data type

 We also need to mark method as async  to be able to say wait we use await keyword


If we want to asynchronous tasks in sequence manner because some of the tasks relies on other task,then we need to use async-await & future
 
 ! What exactly are futures?
 Well,it's kind of similar to receipts

 let me explain what i mean,
 
 Let's say that you go to the coffee-shop and you ordered a couple of coffee,Now at this point you get a receipt with an order-number
  
And,you can go away and do something else like check instagram,check facebook while your coffee is made
You don't want to stand there waiting for it to be done
Once the coffe is done,they'll shout few order and say please come in ,collect your coffee
Now,you  show up and actually get them based on your order receipt
 
It's not the actual thing that you want,it's just a promise that you get something in future

Your future will materialize into real-object

You can be more specific about your future type ,we can do that by using <>

We can steadily use this idea of doing things asynchronously

If we remove await keyword,it will actually returns future(promise),to get actual position we need to use await

 ! Stateful Widget Lifecycle Methods

 ? But what if wanted the location as soon as our screen loads up,as soon as we open up our app it'll try & detect our location and based on that location we'll get the weather

  ! How would I getLocation as soon as our screen loads up ?

   In order to do this,we have to learn about widget life cycles
   
   Stateless widgets are basically very simply like a block,you can't see them in half,change them and do anything with them unless you destroy them and create a new one

 Everytime you want a change in it,You have to create a new one 


For stateless widgets,their life-cycles are very simple they had only one build()

Inside the build(),whatever the appearance of the widget you want to show up on the screen

On the other hand, we also have Stateful Widget

We know these Stateful Widgets can be combined,we can track the state using State Object(It also keep track of variables such as what's the configuration of my widget,what are other properties of my widget,I can change those variables by using setState() and update the app )

Now,in this case state object actually lives little longer

It's got more life-cycle methods-initState(),build(),deactivate()

? Just as we humans born & we grow up,we go through different life stages and we also die so do our stateful widgets

But we can tap into each of those stages in the life-cycle if we wanted different things to happen at various times


* When these life-cycle methods are actually called?


Most frequently used life-cycle method -build()

There are other life-cycle methods,but these are most-useful

If we want something to happen ,when  the stateful widget is created,we can put that code inside initState() 

These are the methods that we can tap into to make our code run at particular time

we can refactor all of the things related to location in separate dart file

! Dart Exception-Handling

 So in order to handle all of these errors or exceptions arise when we run our app

 Before you run your code,compiler tells you that ther's a problem with your code and don't run it

 These errors are called compile-time errors,these errors very easy for developers to fix-up or resolve or catch

 But something unexpected happens while yiur code is running

 There's a method in dart parse() which allows to take string as input and convert into  datatype you want

  Run-time errors are known as Exceptions which are uncaught

  As our code gets large,we don't really know what gets passed around


 try{
  ? do something that might fail
 }
 catch(e){
   ? Catch an exception that occur
   ? whenever exception occurs,it gets printed out teh exception and also provides the alternative,this means we are handling exception here
 }

 It gets triggered only when exception occurs


Dart ?? (null-aware operator) They tend to shorten your code This operator returns expression on it's left except if it's null and if so ,it return right expression

* someVariable ?? defaultValue

Let me show how to create custom exceptions using try..catch..throw
-Persmision denied or disabled these are the two case where an exception gets triggered or bring into action using throw keyword



* Creating a separate Location class in the location.dart file

 ? This class needs to have two properties : a latitude and a longitude .

 ? The Location class also needs to have a method called getCurrentLocation(). Move the try..catch block code where you have  in loading_screen file into this method

 ? Now,we need to update the getLocation() inside loading_screen file so that you create a new Location object,call the getCurrentLocation(),print the value stored inside latitude and longitude

 This is how we refactor our code  so that all the logic of getting the current-location will be handled by a dedicated Location object

  We assign the values of properties by using position.latitude & position.longitude

   ! Remember we can only wait on methods that return futures


Now,we got the location of the user-device,next-step is to turn that location into actual weather data and to do that,we need to use online services where they actually collect weather data(OpenWeatherMap)

It would be nice if we grab the location of current-user and tell what the weather for their location,Now in order to do this we have to use an api(application programming interface)

! What exactly these api's are ?
 
 ? API stands for Application programming interface

  It's a set of commands,functions,protocols and objects that programmers can use to create software or interact with an external system.

 ?  It provides developers with standard commands for performing common operations so they don't have to write the code from scratch


 * One type of API is to create a software
 * There's also an api that allows you to interact with external system

 Tender App -Match-making app

  ? Shared-interests and shared-friends  -These data comes from Fb when tinder makes a request to fb ,asking it to get some information about particular user and once it sends the response,we can check with users who were also on tinder

  It's a bit like being a citizen of small town


  ? There are some api's where you can't just go in and demand something for example bank

You also need to pass key to unlock the bank-account

External servers are like computers running on someone's else

  * It's like an interface between user and software just like bank-teller b/w user and bank-safe

      You could do lot more operations other than get some data  through api

      In bank-situation,you can do withdraw,deposit,get-balance operations

      * There are certain ways of making an api-request,if that request is valid then they can give you valid response
  
   There are only certain things that are handled by API'S

    When we try to get some data from an external system , we have to do that through series of commands & functions that have been pre-defined for us to use.

    Only authorized ways of doing the things,we could actually get data

    If we wanted to access current weather data for any location,we can make an api calls

    We can make a request to browser by simply putting url

    We can also pass query-parameters to the api

    * How can we fetch data from OpenWeatherMap servers through interacting their api's To do that,we are using networking library from flutter


  ! Networking in Flutter
 
 In order to fetch data from internet,we can take you step by step on how to use http package

 * HTTP library- it's used for making HTTP requests & very easy to use
 
 ? Add it as dependency & import it 

 ? In order to make a network request,all we have to do is to call get() from http library then we pass an url  that we wanted to fetch data 
  - get() takes url & map as input ,returns future response
  We wanted to create a new variable of type Response,then we need to use async..await

    ! What exactly this Response Object is ?
    An HTTP response where the entire response body is known in advance
    When we create a new Response object,it has a lot of properties & methods

  We can access properties like body to get data and statuscode to know status code of response

  It's kind of code for particular outcome
  404 status code- resource that you are trying to access from external server doesn't actually exists
  200-OK(Successful)
  4**(Something Bad happen)
  5**(Server issues)
  1**(Hold on)
  2**(here you go)
  3**(Go away)
  4**(Fucked up)
  5**(I fucked up)
There's whole bunch of status code that can be send-back

One of the most common ways of using this http package in flutter-code by using 'as' keyword

All of the things comes from http-package,so we are using alias name

API-Data is formatted in a json fashion

API's either provide data in xml(Extensible Markup Language) or json format
? json-javascript object notation
It's a format extremely similar to  how you create  objects in JS
 {key:value}
 This looks very similar to maps in dart where key-name must be string and value can be key-value pair itself

  JSON Viewer Awesome -chrome  plugin  now it's much easier to look at

 Transporting the data across internet-json

  * If you unpack the data in json to some other format

  We can make use of dart-convert library

If you want to access some data from json,you can use key & []

We store them in variable whatever things that we want


 We can simple reduce the amount of repetition here by decoding data just only once

The reason why we are setting variables of type dynamic,jsonDecode returns dynamic  it doesn't know until data gets processed


 This is how we parse the JSON data 

 we need to have app-id to authorize us  in using api


XML is essentially a bunch of key-value pairs
  ? <key>value</key> (key-tag)


! How to Register own app id so that we can pass our own latitude & longitude that we are getting from app

To get data based on geographic coords, we create new apiKey replaced by app-id & latitude,longitudes put them into the url

To get those values,we add $ before lat & long

Cupertino-Emulator (default)
 we can get back data from json to take out particular things

Instead of doing networking & requesting all in one file,we can refactor them out


! Show a spinner while user waits

 What we'll make :
  we have a loading_screen where we fetching our location & weather data
  we have location screen where we displaying the weather information to the user

  We can improve the transition from one-screen to other by adding a spinner
  We split out the functionality into separate dart files so that we can do other things in future & use it in somewhere else

   We need to display weather data in location_screen so that we can display it on the screen ,in order to pass data to the screen,we need to use Navigator

   Once it got the location and weather data,then it will push that data to next screen
    We can add a loading indicator so that they actually know something is happening in the background

    We will use flutter-spinkit
    what it does is,it gives access to lot of animated loading indicators 
  The way we use it,we just tap into particular widget whatever we want


 * How we pass data from one screen to other
 
  ? We could pass data forwards through our routes by simply creating properties
  When the stateful widget is initialized,we just tap into constructor which takes weather-data

  ! How  to pass data  to a state object?
 Getting data from location_screen object to location-screen state object
  Widgets lived inside build() of the Stateful object

 The state object knows which stateful widget it belongs to

  ! Update the weather using weather-model

  * We can update the app-ui based on live weather data

  ? We can refactor the methods of location

 Next step is,to move on to city-screen
 We can navigate to it when user taps on location_city icon

  What we want here,we will have a text-widget which takes location_city as argument

  TextField is just an text input widget,we can use various properties of it to change how it looks

   * How do we get the value that we enter in TextField widget ?
   * There's also an property called onChanged(),this will trigger and pass in value of the text-field into anonymous call-backs
   

   ! How to pass data backwards through navigation stack
   Instead of printing them to the console,store them in property and assign that value to this property

   When the user taps weather button,inside the {},

   ? Navigator.push() has actually had optional output future of dynamic type
   ? That output could be input of pop()

   ? You can add async-await keyword for anonymous functions















   

*/