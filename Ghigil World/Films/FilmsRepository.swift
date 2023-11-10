//
//  FilmsRepository.swift
//  Ghigil World
//
//  Created by Raul Illan on 10/11/23.
//

import Combine

protocol FilmsRepository {
    
    func getFilms() -> AnyPublisher<[FilmModel], Error>
}
