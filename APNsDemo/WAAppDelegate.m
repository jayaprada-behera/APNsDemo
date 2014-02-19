//
//  WAAppDelegate.m
//  APNsDemo
//
//  Created by Jayaprada Behera on 18/02/14.
//  Copyright (c) 2014 Webileapps. All rights reserved.
//

#import "WAAppDelegate.h"
#define App_Name   @"Myapp"

@implementation WAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    /*
     when app is closed and we recv a push notification no one is there to handle so ios will store all that notification in  this "launchOptions" dict locally,and when we again launch the application we can count the number of messages and according to that we can show the badges

     */
    
    
    [[UIApplication sharedApplication]registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    
    return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    //This method will register ur device with the server
    [self registerDevice:deviceToken];
}
-(void)registerDevice:(NSData *)deviceToken{
    
    //device token is a hexadecimal so we have to remove special character
    
    NSMutableString *string = [[NSMutableString alloc]init];
    int length = [deviceToken length];
    char const *bytes = [deviceToken bytes];
    
    //depending on legth extract each byte from data and strore that into a string
    for (int i = 0; i < length; i ++) {
        [string appendString:[NSString stringWithFormat:@"%02.2hhx",bytes[i]]];
    }
    
    //We don't want to slow down my app due to webservices request so ,a background process is used
    [self performSelectorInBackground:@selector(connectionWebRegister:) withObject:string];
    
}
-(void)connectionWebRegister:(NSString *)deviceTokenString{

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.serviceprovider/registerTokenId?tokenId=%@&app=%@",deviceTokenString,App_Name]];
    
    NSData *res = [NSData dataWithContentsOfURL:url];
    if (res != NULL) {
        NSString *str = [[NSString alloc]initWithBytes:[res bytes] length:[res length] encoding:NSUTF8StringEncoding];
        
    }
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
//configure ur appid with iOS provisioning profile,if not it will show error

}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
 
    //userInfo dict contains all the info about the notification ,i.e the behaviour which server sends
    
    NSMutableDictionary *test = [userInfo objectForKey:@"aps"];
    
    [[[UIAlertView alloc]initWithTitle:@"" message:@"Message" delegate:Nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil]show];
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
