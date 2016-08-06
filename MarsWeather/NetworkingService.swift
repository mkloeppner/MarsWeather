//
//  NetworkingService.swift
//  MarsWeather
//
//  Created by Martin Klöppner on 06/08/16.
//  Copyright © 2016 Martin Klöppner. All rights reserved.
//

import Foundation

public class NetworkingService {
    
    private let urlSession : NSURLSession
    
    public init() {
        self.urlSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    }
    
    public func get(url: NSURL, query: Dictionary<String, String>, success: (AnyObject) -> Void) {
        var mutableURLPath = url.absoluteString
        for (key, value) in query {
            let index = query.indexForKey(key)
            var paramSeperator = "&"
            if index == query.startIndex {
               paramSeperator = "?"
            }
             mutableURLPath = mutableURLPath.stringByAppendingString(paramSeperator);
             mutableURLPath = mutableURLPath.stringByAppendingString("\(key)=\(value)")
        }
    
        let request = NSURLRequest(URL: NSURL(string: mutableURLPath)!)
        self.urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            do {
                if let data = data {
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
                    NSOperationQueue.mainQueue().addOperationWithBlock({ 
                        success(jsonData)  
                    })
                }
            } catch _ as NSError {
                return
            }

        }).resume()
    
    }
    
}