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
    let imageUrl: String
    let number_of_lessons: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchCourseJson { (cources, err) in
//            if let err = err{
//                print("failed to decode ", err)
//            return
//            }
//            cources?.forEach({ (cource) in
//                print(cource.name)
//            })
//        }
        fetchCourseJson { (res) in
            switch res {
            case .failure(let err):
                print("we have an err: \(err)")
            case .success(let cources):
                cources.forEach { (course) in
                    print(course.name)
                }
            }
        }
        
    }
    
  //  fileprivate func fetchCourseJson(completion: @escaping ([Course]?, Error?) -> ()){
    fileprivate func fetchCourseJson(completion: @escaping (Result<[Course], Error>) -> () ){
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            if let err = err{
           //     completion(nil, err)
                completion(.failure(err))
                return
            }
            do {
                let cources = try JSONDecoder().decode([Course].self, from: data!)
               // completion(cources, nil)
                completion(.success(cources))
            } catch let jsonErr{
             //   completion(nil, jsonErr)
                completion(.failure(jsonErr))
            }
        }.resume()
        
    }
    


}

