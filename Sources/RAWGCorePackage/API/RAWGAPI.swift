//
//  RAWGAPI.swift
//  RAWGCorePackage
//
//  Created by Maulana Frasha on 27/11/23.
//

import RxSwift
import Alamofire

public protocol RAWGAPIDataSourceProtocol {
    
    func getGameListRx(apiKey: String) -> Observable<RAWGGameListModel>
    
    func getGameDetailRx(apiKey: String, gameID: String) -> Observable<RAWGGameDetailModel>
    
    func getGameList(apiKey: String, completionHandler: @escaping (Result<RAWGGameListModel, AFError>) -> Void)
    
    func getGameDetail(apiKey: String, gameID: String, completionHandler: @escaping (Result<RAWGGameDetailModel, AFError>) -> Void)
}

public class RAWGAPIDataSource: RAWGAPIDataSourceProtocol {
    
    public init() { }
    
    public func getGameListRx(apiKey: String) -> Observable<RAWGGameListModel> {
        return Observable<RAWGGameListModel>.create { observer in
            let gameListURL = "https://api.rawg.io/api/games?page_size=50&key=\(apiKey)"
            AF.request(gameListURL).responseDecodable(of: RAWGGameListModel.self) { response in
                switch response.result {
                case .success(let success):
                    observer.onNext(success)
                    observer.onCompleted()
                case .failure(let failure):
                    observer.onError(failure)
                }
            }
            return Disposables.create()
        }
    }
    
    public func getGameDetailRx(apiKey: String, gameID: String) -> Observable<RAWGGameDetailModel> {
        return Observable<RAWGGameDetailModel>.create { observer in
            let gameDetailURL = "https://api.rawg.io/api/games/\(gameID)?key=\(apiKey)"

            AF.request(gameDetailURL).responseDecodable(of: RAWGGameDetailModel.self) { response in
                switch response.result {
                case .success(let success):
                    observer.onNext(success)
                    observer.onCompleted()
                case .failure(let failure):
                    observer.onError(failure)
                }
            }
            return Disposables.create()
        }
    }

    public func getGameList(apiKey: String, completionHandler: @escaping (Result<RAWGGameListModel, AFError>) -> Void) {
        let gameListURL = "https://api.rawg.io/api/games?page_size=50&key=\(apiKey)"
        AF.request(gameListURL).responseDecodable(of: RAWGGameListModel.self) { response in
            completionHandler(response.result)
        }
    }

    public func getGameDetail(apiKey: String, gameID: String, completionHandler: @escaping (Result<RAWGGameDetailModel, AFError>) -> Void) {
        let gameDetailURL = "https://api.rawg.io/api/games/\(gameID)?key=\(apiKey)"

        AF.request(gameDetailURL).responseDecodable(of: RAWGGameDetailModel.self) { response in
            completionHandler(response.result)
        }
    }
}

