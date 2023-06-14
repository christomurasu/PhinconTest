//
//  Request.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class Request {
    static let shared = Request()
    
    func fetchPokemon(offset: Int, completionHandler: @escaping (_ result: JSON, _ error: Error?) -> Void) {
        let url = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=20"
        AF.request(url, method: .get
            , parameters: nil, encoding: URLEncoding.httpBody
            , headers: nil).responseJSON{(response) in
                if(response.response?.statusCode==200){
                    do {
                        let json = try JSON(response.result.get())
                        print(json)
                        completionHandler(json, response.error)
                    } catch {
                        return
                    }
                }
        }
    }
    
    func fetchPokemonDetail(name: String, completionHandler: @escaping (_ result: JSON, _ error: Error?) -> Void) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(name)"
        AF.request(url, method: .get
            , parameters: nil, encoding: URLEncoding.httpBody
            , headers: nil).responseJSON{(response) in
                if(response.response?.statusCode==200){
                    do {
                        let json = try JSON(response.result.get())
                        print(json)
                        completionHandler(json, response.error)
                    } catch {
                        return
                    }
                }
        }
    }
}
