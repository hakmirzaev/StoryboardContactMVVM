//
//  CreateViewController.swift
//  StoryboardContact
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import UIKit

class CreateViewController: BaseViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    var viewModel = CreateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        bindViewModel()
    }

    func initView() {
        title = "Create Contact"
    }
    
    func callHomeViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func bindViewModel(){
        viewModel.controller = self
    }
    
    @IBAction func createButton(_ sender: Any) {
        if nameLabel.text != nil && phoneLabel.text != nil {
            viewModel.apiContactCreate(contact: Contact(name: nameLabel.text!, phone: phoneLabel.text!), handler: { response in
                if response {
                    self.callHomeViewController()
                }
            })
        }
    }
    

}
