//
//  ProjectViewController.swift
//  MVVM Demo
//
//  Created by Mac-00010 on 26/12/18.
//  Copyright © 2018 Mac-00010. All rights reserved.
//

import UIKit
import SDWebImage

class ProjectViewController: UIViewController {

    @IBOutlet weak var tblProject : UITableView!
    @IBOutlet weak var activityLoader : UIActivityIndicatorView!

    var viewModel : ProjectListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalize()
    }

    //MARK:-
    //MARK:- General Method
    
    func initalize() {
        self.title = "Projects"
        tblProject.register(UINib(nibName: "ProjectListTblCell", bundle: nil), forCellReuseIdentifier: "ProjectListTblCell")
        tblProject.estimatedRowHeight = 170
        tblProject.rowHeight = UITableView.automaticDimension
        self.loadTableView()
    }

    func loadTableView() {
       
        viewModel = ProjectListViewModel()
        viewModel.loadProjectList(completion: { (isSuccess) in
            self.activityLoader.startAnimating()
            
            if isSuccess {
                self.activityLoader.stopAnimating()
                self.tblProject.reloadData()
            }
        })
    }
}

//MARK:-
//MARK:- UITableview Delegate and Datasource

extension ProjectViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projectViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectListTblCell") as? ProjectListTblCell {
            
            let project = viewModel.projectViewModels[indexPath.row]
            
            cell.lblPjctName.text = project.name
            cell.lblLocation.text = project.address
            cell.lblReraNo.text = project.reraNumber
            cell.imgVPrjct.sd_setImage(with: URL(string: project.image!), placeholderImage: nil, options: .retryFailed, completed: nil)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
