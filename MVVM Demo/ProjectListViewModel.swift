//
//  ProjectListViewModel.swift
//  MVVM Demo
//
//  Created by Mac-00010 on 26/12/18.
//  Copyright © 2018 Mac-00010. All rights reserved.
//

//ViewModel :- a viewModel, which is a file that holds the values to be presented in your view. The logic we write to format the values (i.e. formatting a string to be inserted into a UILabel) to be presented to the view takes place in the viewModel.

import Foundation

class ProjectListViewModel: NSObject {

    var projectViewModels = [ProjectViewModel]()
    typealias fetchProjectList = ((_ isSuccess : Bool) -> ())
    
    //...Call API here
    func loadProjectList(completion : @escaping fetchProjectList) {
        
        APIRequest.shared().loadProjectList { (response, error) in
            
            if response != nil {
                if let arrData = response?.value(forKey: "data") as? [[String : Any]] {
                  let project = arrData.compactMap(Project.init)
                  self.projectViewModels = (project.compactMap(ProjectViewModel.init))
                    completion(true)
                }
            }
        }
    }
}

class ProjectViewModel : NSObject {
    
    var id : Int?
    var name : String?
    var image : String?
    var address : String?
    var reraNumber : String?
  
    /*
    init(dict : [String : Any]) {
        self.id = dict["projectId"] as? Int
        self.name = dict["projectName"] as? String
        self.image = dict["projectImage"] as? String
        self.address = dict["address"] as? String
        self.reraNumber = dict["reraNumber"] as? String
    } */
    
    init(project : Project) {
        self.id = project.projectID
        self.name = project.projectName
        self.image = project.projectImg
        self.address = project.location
        self.reraNumber = project.reraNumber
    }
}
