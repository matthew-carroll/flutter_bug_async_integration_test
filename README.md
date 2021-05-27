# Integration Test Async Bug

This app shows a button at the center of the screen. Pressing the button waits for 3 seconds
, then sends a GET request over the network. A spinner is displayed during the action.

Running this app on Android, iOS, web, and Mac OS results in expected behavior in real time.

Running this behavior as an integration test works as expected on Android, iOS, and Mac.

But, running this behavior as an integration test on web **doesn't** wait for the asynchronous
behavior to complete. The test ends abruptly in the middle. This happens despite the display of
an animating spinner during the request.