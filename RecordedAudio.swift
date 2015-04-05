//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Giovanni Biriba on 04/04/2015.
//  Copyright (c) 2015 Laquysoft. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl:NSURL, title:String) {
       self.filePathUrl = filePathUrl
       self.title = title
    }
}