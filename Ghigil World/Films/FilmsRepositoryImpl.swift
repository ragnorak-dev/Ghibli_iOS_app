//
//  FilmsRepositoryImpl.swift
//  Ghigil World
//
//  Created by Raul Illan on 10/11/23.
//

import Foundation
import Combine

class FilmsRepositoryImpl : FilmsRepository {
    
    let filmListCloudDataSource: FilmListCloudDataSource
    
    init (filmListCloudDataSource: FilmListCloudDataSource = FilmListCloudDataSource()) {
        self.filmListCloudDataSource = filmListCloudDataSource
    }
    
    func getFilms() -> AnyPublisher<[FilmModel], Error> {
        return filmListCloudDataSource.getFilmList().map {
            serverFilmListResponse -> [FilmModel] in
            return serverFilmListResponse.map { serverFilmResponse -> FilmModel in
                serverFilmResponse.toModel()
            }
        }
        .mapError({
            print($0)
            return $0 })
        .eraseToAnyPublisher()
        }
}
