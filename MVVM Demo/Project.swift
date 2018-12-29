//
//  Project.swift
//  MVVM Demo
//
//  Created by Mac-00010 on 26/12/18.
//  Copyright © 2018 Mac-00010. All rights reserved.
//

//Model :- This is stored domain - specific information(Data) in simplest format.

import Foundation

class Project {
 
    var projectID : Int?
    var projectName : String?
    var location : String?
    var projectImg : String?
    var reraNumber : String?
    
    init?(dict : [String :Any]) {
        
        guard let id = dict["projectId"] as? Int, let name = dict["projectName"] as? String, let address = dict["address"] as? String, let reranumber = dict["reraNumber"] as? String, let image = dict["projectImage"] as? String else {
            return nil
        }
        
        self.projectID = id
        self.projectName = name
        self.projectImg = image
        self.location = address
        self.reraNumber = reranumber
    }

}
