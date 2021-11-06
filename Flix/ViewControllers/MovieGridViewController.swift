//
//  GridViewController.swift
//  Flix
//
//  Created by Favian Flores on 2/18/21.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	@IBOutlet weak var movieGrid: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		loadApiData()
		movieGrid.dataSource = self
		movieGrid.delegate = self
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let cell = sender as! UICollectionViewCell
		let indexPath = movieGrid.indexPath(for: cell)!
		let movie = movies[indexPath.row]
		let movieDetailsViewController = segue.destination as! MovieDetailsViewController
		movieDetailsViewController.movie = movie
	}

	var movies: [[String: Any]] = []

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		movies.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
		let movie = movies[indexPath.item]
		let baseUrl = "https://image.tmdb.org/t/p/w300"
		let posterPath = movie["poster_path"] as! String
		let posterUrl = URL(string: baseUrl + posterPath)
		cell.movieGridCellImage.af.setImage(withURL: posterUrl!)
		return cell
	}

	func loadApiData() {
		let url = URL(string: "https://www.vaccinespotter.org/api/v0/states/NY.json")!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
		let task = session.dataTask(with: request) { data, _, error in
			if let error = error {
				print(error.localizedDescription)
			} else if let data = data {
				let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				self.movies = dataDictionary["results"] as! [[String: Any]]
				self.movieGrid.reloadData()
			}
		}
		task.resume()
	}
}
