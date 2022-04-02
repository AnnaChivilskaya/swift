//
//  NetworkingViewController.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import UIKit
import Alamofire

class NetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //sendGetRequest()
        
        //sendGetRequestURLComponents()
        
        //sendPostRequestURLComponents()
        
        sendGetRequestAlamofire()
   
    }
    
    func sendGetRequestAlamofire() {
        
        let params: Parameters = [
            "q": "Moscow,DE",
            "appid": "bb1b15e88fa797225412429c1c50c122a1"]
        
        guard let url =  URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=bb1b15e88fa797225412429c1c50c122a1")
        else { return }
        
        AF.request(url, parameters: params).responseJSON { response  in
            
            print(response.value)
        }
    }
    
    func sendPostRequestURLComponents() {
        // Конфигурация по умолчанию
                let configuration = URLSessionConfiguration.default

        // собственная сессия
                let session =  URLSession(configuration: configuration)
                
        // создаем конструктор для URL
                var urlComp = URLComponents()
        // устанавливаем схему
                urlComp.scheme = "http"
        // устанавливаем хост
                urlComp.host = "samples.openweathermap.org"
        // путь
                urlComp.path = "/data/2.5/forecast"
        // параметры для запроса
            urlComp.queryItems = [
                    URLQueryItem(name: "q", value: "München,DE"),
                    URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")
                ]
        guard let url = urlComp.url  else  { return }
        
        // задача для запуска
                let task = session.dataTask(with: url) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
                    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        // выводим в консоль
                    print(json)
                }
        // запускаем задачу
                task.resume()
    }
    
    func sendGetRequest() {
        guard let url =  URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=bb1b15e88fa797225412429c1c50c122a1")
        else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            
            print(json as  Any)
        }
        task.resume()
    }

}
