//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    // MARK: ViewModel

    var viewModel: HomeViewModelProtocol! {
        didSet {
            self.viewModel.didTapCell = { [unowned self] identifier, index in
                self.performSegue(withIdentifier: identifier, sender: index)
            }

            self.viewModel.didFinishGetTopRatedMovies = { [unowned self] movies in
                self.data = movies
                self.tableView.reloadData()
            }
        }
    }

    // MARK: Properties

    @IBOutlet var tableView: UITableView!
    private var data: MoviesDTO?

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"

        viewModel = HomeViewModel(
            api: DependencyManager.resolve(MovieService.self)
        )

        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "HomeTableView"

        viewModel.didGetMovies()


    }

    // MARK: Coordinator

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == viewModel.homeDetailsIdentifier {
            let id = (sender as? Int) ?? 0
            // Aqui vamos adicionar o item que será parte do detalhes
            let vc = segue.destination as? HomeDetailsViewController
            vc?.movieID = String(describing: id)
        }
    }
}

// Mark: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let id = data?.results?[safe: indexPath.row]?.id ?? 0
        viewModel.goToHomeDetails(movieID: id)
    }
}

// Mark: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {

        return data?.results?.count ?? 0
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = UITableViewCell()

        guard let movie = data?.results?[safe: indexPath.row] else {
            return cell
        }
        cell.imageView?.image = nil
        let imageURL = URL(
            string: CoreAPIService.defaultImageURL + (movie.poster_path ?? "")
        )
        cell.imageView?.kf.setImage(with: imageURL)
        cell.textLabel?.text = movie.title
        cell.textLabel?.numberOfLines = 0

        cell.isAccessibilityElement = true
        cell.accessibilityIdentifier = "HomeCell_\(indexPath.row)"

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}
