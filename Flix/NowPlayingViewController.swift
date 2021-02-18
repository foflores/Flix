//  MainViewController.swift
//  Flix
//
//  Created by Favian Flores on 2/7/21.

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	// Outlets
	@IBOutlet weak var tableView: UITableView!
	
	// Global
	var movies = [[String:Any]]()

	// ViewController Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.dataSource = self
		tableView.delegate = self
		
		loadApiData()
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let cell = sender as! UITableViewCell
		let indexPath = tableView.indexPath(for: cell)!
		let movie = movies[indexPath.row]
		let movieDetailsViewController = segue.destination as! MovieDetailsViewController
		movieDetailsViewController.movie = movie
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	// TableView
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingCell") as! NowPlayingCell
		
		let movie = movies[indexPath.row]
		let title = movie["title"] as! String
		let overview = movie["overview"] as! String
		let baseUrl = "https://image.tmdb.org/t/p/w300"
		let posterPath = movie["poster_path"] as! String
		let posterUrl = URL(string: baseUrl + posterPath)
		
		cell.movieTitle.text = title
		cell.movieDescription.text = overview
		cell.movieArt.af.setImage(withURL: posterUrl!)
		
		return cell
	}

	// Helper Functions
	func loadApiData() {
		let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
		let task = session.dataTask(with: request) { (data, response, error) in
			if let error = error { print(error.localizedDescription) }
			else if let data = data {
				let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				self.movies = dataDictionary["results"] as! [[String:Any]]
				self.tableView.reloadData()
		   }
		}
		task.resume()
	}
}
