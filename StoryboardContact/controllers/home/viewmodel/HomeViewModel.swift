//
//  HomeViewModel.swift
//  StoryboardContact
//
//  Created by Bekhruz Hakmirzaev on 23/04/23.
//

import Foundation
import Bond

class HomeViewModel {
    var controller: BaseViewController!
    let items = Observable<[Contact]>([])
    
    func apiContactList() {
        controller.showProgress()
        
        AFHttp.get(url: AFHttp.API_CONTACT_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            self.controller.hideProgress()
            switch response.result {
            case .success:
                let contacts = try! JSONDecoder().decode([Contact].self, from: response.data!)
                self.items.value = contacts
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiContactDelete(contact: Contact, handler: @escaping (Bool) -> Void) {
        controller.showProgress()
        
        AFHttp.del(url: AFHttp.API_CONTACT_DELETE + contact.id!, params: AFHttp.paramsEmpty(), handler: { response in
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
