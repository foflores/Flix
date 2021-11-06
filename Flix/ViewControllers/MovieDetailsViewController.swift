//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Favian Flores on 2/13/21.

import UIKit

class MovieDetailsViewController: UIViewController {
	var movie: [String: Any]!

	@IBOutlet weak var movieArt: UIImageView!
	@IBOutlet weak var backdropArt: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieDescription: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		movieTitle.text = movie["title"] as? String
		movieDescription.text = movie["overview"] as? String
		movieTitle.sizeToFit()
		movieDescription.sizeToFit()

		let posterBaseUrl = "https://image.tmdb.org/t/p/w300"
		let posterPath = movie["poster_path"] as! String
		let posterUrl = URL(string: posterBaseUrl + posterPath)

		let backdropBaseUrl = "https://image.tmdb.org/t/p/w780"
		let backdropPath = movie["backdrop_path"] as? String
		var backdropUrl: URL!
		if backdropPath != nil {
			backdropUrl = URL(string: backdropBaseUrl + backdropPath!)
		} else {
			backdropUrl = URL(string: "https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg")
		}

		movieArt.af.setImage(withURL: posterUrl!)
		backdropArt.af.setImage(withURL: backdropUrl!)
	}
}
