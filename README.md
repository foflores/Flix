<div align="center">
	<a href="https://github.com/foflores10/Flix">
		<img src="https://media.foflores.com/projects/flix/icon.png" width=128>
	</a>
	<h3>Flix</h3>
</div>

## About The Project

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Part 2

### User Stories

#### REQUIRED (10pts)

- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS

- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### Notes

One issue I had was implementing the details screen in the collection view. Unlike in the now playing screen, some of the movies returned by the API didn't have a backdrop path. I had to edit the code to present and a default "Image not found" image in its place.

Another issue was I encountered was when adding the tabbar, collectionview, and collectionviewcell. There were a lot of connections to be made through naming, connecting outlets, adding identifiers. I ended up mispelling an outlet connection and spent 15 minutes checking the entire project to find that I missed one letter.

---

## Part 1

### User Stories

#### REQUIRED (10pts)

- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS

- [ ] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### Notes

A challenge I faced while building the app was understanding what the table view was actually doing. I was able to follow along with the video, but it was diffcult for me to understand how the data was inserted into each cell and and then what "reloading" did to update the table.

---

<div align="center">
	<a href="https://projects.foflores.com/flix"><h3>App Previews</h3></a>
</div>
