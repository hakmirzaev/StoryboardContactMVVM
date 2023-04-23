//
//  EditViewModel.swift
//  StoryboardContact
//
//  Created by Bekhruz Hakmirzaev on 23/04/23.
//

import Foundation
import Bond

class EditViewModel {
    var controller: BaseViewController!
    
    func apiContactEdit(contact: Contact, handler: @escaping (Bool) -> Void) {
        controller.showProgress()
        AFHttp.put(url: AFHttp.API_CONTACT_UPDATE + (contact.id)!, params: AFHttp.paramsContactCreate(contact: contact), handler: { response in
            self.controller.hideProgress()
            switch response.result {
            case .success:
                print(response.result)
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        })
    }
}
