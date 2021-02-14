//  MovieCell.swift
//  Flix
//
//  Created by Favian Flores on 2/11/21.

import UIKit

class MovieCell: UITableViewCell {
	
	// Outlets
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieDescription: UILabel!
	@IBOutlet weak var movieArt: UIImageView!
	
	// Cell Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
