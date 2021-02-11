//
//  MovieCell.swift
//  Flix
//
//  Created by Favian Flores on 2/11/21.
//

import UIKit

class MovieCell: UITableViewCell {

	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieDescription: UILabel!
	@IBOutlet weak var movieArt: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
