//
//  EditViewController.swift
//  StoryboardContact
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import UIKit

class EditViewController: BaseViewController {

    var contact: Contact = Contact(name: "", phone: "")
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    var viewModel = EditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        bindViewModel()
    }
    
    func initView() {
        nameLabel.text = contact.name!
        phoneLabel.text = contact.phone!
        
        title = "Edit Contact"
    }
    
    func callHomeViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    func bindViewModel(){
        viewModel.controller = self
    }

    @IBAction func saveButton(_ sender: Any) {
        if nameLabel.text != nil && phoneLabel.text != nil {
            viewModel.apiContactEdit(contact: Contact(id: contact.id!, name: nameLabel.text!, phone: phoneLabel.text!), handler: { response in
                if response {
                    self.callHomeViewController()
                }
            })
        }
    }
}
