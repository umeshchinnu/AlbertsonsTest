//
//  ViewModel.swift
//  Test
//
//  Created by UMESH MADATHA on 06/09/22.
//

import Foundation
class HomeViewModel {
    func callSearchAPI(searchText: String, completionHandler: @escaping (_ result: Model?) -> Void) {
        let request: NSURLRequest = NSURLRequest(url: URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=\(searchText)") ?? URL(fileURLWithPath: ""))
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest){
             (data, response, error) -> Void in
             if error != nil {
                 completionHandler(nil)
             } else {
                 if  let homeModel = try? JSONDecoder().decode(Model.self, from: data ?? Data()) {
                     completionHandler(homeModel)
                 }
             }
        }
        task.resume()
    }

}
