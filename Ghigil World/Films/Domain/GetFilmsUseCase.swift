//
//  GetFilmsUseCase.swift
//  Ghigil World
//
//  Created by Raul.Illan on 5/7/22.
//

import Foundation
import Combine

class GetFilmsUseCase {
    
    let filmsRpository: FilmsRepository
    
    init(filmsRpository: FilmsRepository = FilmsRepositoryImpl()) {
        self.filmsRpository = filmsRpository
    }
    
    func getFilmsList() -> AnyPublisher<[FilmModel], Error> {
        return filmsRpository.getFilms()
    }
}
