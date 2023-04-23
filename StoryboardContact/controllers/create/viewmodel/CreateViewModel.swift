//
//  CreateViewModel.swift
//  StoryboardContact
//
//  Created by Bekhruz Hakmirzaev on 23/04/23.
//

import Foundation
import Bond

class CreateViewModel {
    var controller: BaseViewController!
    
    func apiContactCreate(contact: Contact, handler: @escaping (Bool) -> Void) {
        controller.showProgress()
        AFHttp.post(url: AFHttp.API_CONTACT_CREATE, params: AFHttp.paramsContactCreate(contact: contact), handler: { response in
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
