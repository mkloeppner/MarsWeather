//
//  AppDelegate.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var container: Container = {
        let container = Container()
        
        container.registerForStoryboard(PlanetWeatherViewController.self) { r, c in
            c.planetWeather = r.resolve(PlanetWeather.self);
            c.planetWeatherFetcher = r.resolve(PlanetWeatherFetcher.self)
        }
        container.registerForStoryboard(TemperatureViewController.self) { r, c in
            c.formattingService = r.resolve(FormattingService.self)
        }
        
        container.register(FormattingService.self) { _ in return NumberFormatterFormattingServiceAdapter() }
        container.register(NetworkingService.self) { _ in return NetworkingService() }
        
        container.register(PlanetWeatherFetcher.self, factory: { r in
            return r.resolve(MarsWeatherApi.self)! })
        
        container.register(MarsWeatherApi.self) { r in
            var p = MarsWeatherApi()
            p.networking = r.resolve(NetworkingService.self)
            p.modelTypeFactory = r.resolve(MarsWeatherFactory.self)
            return p
            }
        
        container.register(MarsWeatherFactory.self) { r in
            var marsWeatherFactory = MarsWeatherFactory()
            marsWeatherFactory.formattingService = r.resolve(FormattingService.self)
            return marsWeatherFactory
        }
        
        return container
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
        window.rootViewController = storyboard.instantiateInitialViewController()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

