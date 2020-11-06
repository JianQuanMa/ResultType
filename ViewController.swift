//
//  ViewController.swift
//  ResultType
//
//  Created by Jian Ma on 11/5/20.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let imageURL: String
    let number_of_lessons: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCourseJosn { (cources, err) in
            <#code#>
        }
    }
    
    fileprivate func fetchCourseJosn(completion: @escaping ([Course]?, Error?) -> ()){
        let urlString = "https://api/letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            if let err = err{
                completion(nil, err)
                return
            }
        }.resume()
        
    }
    


}

