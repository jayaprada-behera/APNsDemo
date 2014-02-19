APNsDemo
========

Apple push notification demo

Apple Push Notification  
 
We have to make configuration in iOS dev centre for implementing APNs.
(SSL Certificate Section )
1.Open keychain access.
2. go to Certificate Assistant
3.  Then request a certificate from Certificate authority.
4.Save the certificate on desktop.

Then go to developer.apple.com
(App ID section)
1. Sign In 
2. iOS dev center
3. iOS dev program 
4.iOS provisioning Profile 
5. Get App id (create a new One if not )
6.Configure push notification service with that app ID
7.tap on submit (It will show all the existing  app IDs).
8.tap on Configure from Action option 
9.It will show services for Development and Distributions
10.After choosing one ,it will ask for The certificate which we have already  have from KeyChain.
11.Upload that .Its called APNs SSL Certificate.
12.Then go to configure App ID page ,Here tap on download .

(Provisioning section )
 Go to edit and modify that or we can delete that again upload.

(client side section)
1. create a new X Code project and can also be implemented with existing one .
2. Go to code sign identity  (choose the downloaded provisioning profile ).
3.Go to didFinishLaunchingWithOptions and register  your application.
(When the user launches his app it will show an alert “”Do u want to enable Push Notification fro your app).We can change the setting in app settings under “Notification settings”.
4.Use delegate methods to start.

Finally we have to get the certificate from keychain (tap on key and export to desktop)and give that to server side.Server side will use this certificate to communicate with Apple Push Notifications.










