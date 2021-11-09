//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit
import SampleDependency
import BackgroundColor

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

    @IBOutlet weak var titleLabel: SampleLabel!
    @IBOutlet weak var movieImageView: UIImageView!

    var movieID: String?

    private var backgroundColor: BackgroundColor = BackgroundColor()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.accessibilityIdentifier = "HomeDetailView"

        titleLabel.setInjection(objInject: backgroundColor)
        titleLabel.updateSampleLabel()

        viewModel = HomeDetailViewModel()

        viewModel.didGetMovieDetail(id: movieID ?? String())
    }

    func didUpdateView(with model: MovieDetailDTO) {
        titleLabel.text = model.title
    }
}

extension BackgroundColor: SampleLabelInjectionType {

    public func updateBackground(label: UILabel) {
        self.setGradientColorBackground(for: label)
    }
}
