//
//  ViewController.swift
//  Jokes
//
//  Created by Mobark Alseif on 15/05/1443 AH.
//

import UIKit

struct Joke : Decodable {
    
    let jokes : [Jokes]
    let available : Int
    
}

struct Jokes : Decodable {
    
    let id : Int
    let joke : String
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        request()
    }

    func request () {
 let url = URL(string: "https://api.humorapi.com/jokes/search?api-key=6d484bb7f09047b395d2e5d0801d9751")
        
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data , response , error in
            if let error = error {
                print(error.localizedDescription)
            } else {
//                let data = String(data: data! , encoding: String.Encoding.utf8)
//                print(data)
                if let data = data {
                    do {
                        let newJoke = try? JSONDecoder().decode(Joke.self, from: data)
                        print(newJoke?.available)
                    } catch {
                       print(error)
                    }
                }
                
            }
        } .resume()
        
        
       }
  
}
