Check out this very basic [demo](http://outlawandy.github.io/angular-notice)

also available via `bower install angular-push-notice`  (angular-notice was taken)

###Usage

Declare angular-notice as a dependency of your module.  If you want the default animations to work out of the box, you will also need to declare the angular's animation module and include it with your project.

    angular.module('MyApp',['push.notice','ngAnimate'])


Angular-notice comes with a directive that you need to include in your html. Anywhere in scope will do. Declare it as either an element or attribute.

    <notifications></notifications>


There are 2 built in styles of Notification, `notice` and `warn`. Though, you can easily add others if your app requires.

The `notifications` directive listens for events to trigger its behavior. 2 of them by default, again, feel free to add more.

To trigger notifications in your app.  You may either `$broadcast` the proper event your self, or you may use the built-in service for convenience.

In your controllers:

    $rootScope.$broadcast("push:notice", "A message You want Displayed in a colorful box");

or inject the `notifier` service and call methods on it:

    notifier.warn("How come bad news is always red?");




You may have noticed by now that this module is not very configurable out of the box.
You would be correct, it is certainly no [Toastr](https://github.com/CodeSeven/toastr).
This is, in part a design desision...

Actually, who am I kidding, its the direct result of pure lazyness.

The truth is that I wrote this module to do exactly what I needed it to, for the project I was working on at the time.
I didn't need all the configuration options you get from a jQuery plugin like [toastr](https://github.com/CodeSeven/toastr).
If you do, then you are probably better off choosing another solution.

That said, it is my humble opinion that the simplicity of this module, is actually it's strong suit.
Whether you are an Angular expert or a newbie, I think that you will find the source code to be quite approachable.  It's only a handful of functions after all.
If this module does generally what you want, then clone it or `bower install` it and modify it to be your own.
If you want notifications to show up somewhere else on the screen, its only css.

Okay, If you're still here, thank you for allowing me this soapbox.  But now, my friend, I'm afraid it is time for you to get back to work. Have a wonderful day!