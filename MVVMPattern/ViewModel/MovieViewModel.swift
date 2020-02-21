//
//  MovieViewModel.swift
//  MVVMPattern
//
//  Created by Abhijit Kotangale on 09/02/20.
//  Copyright © 2020 Abhijit Kotangale. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {

    var artistName: String?
    var trackName: String?
    
    init(movie: MovieModel) {
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}
