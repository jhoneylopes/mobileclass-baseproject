//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

final class HomeDetailsViewController: UIViewController {

    var viewModel: HomeDetailViewModelProtocol! {
        didSet {
            self.viewModel.didUpdateView = { [weak self] model in
                self?.didUpdateView(with: model)
            }

            self.viewModel.didUpdateImageView = { [weak self] imageURL in
                self?.movieImageView.image = UIImage(contentsOfFile: imageURL.path)
            }
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!

    var movieID: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HomeDetailViewModel()

        viewModel.didGetMovieDetail(id: movieID ?? String())
    }

    func didUpdateView(with model: MovieDetailDTO) {
        titleLabel.text = model.title
    }
}
