import UIKit

class YearReviewView: UIView {
	let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "You spent a million this year."
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 40)
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.setContentCompressionResistancePriority(.required, for: .vertical)
		return label
	}()
	
	let subtitleLabel: UILabel = {
		let label = UILabel()
		label.text = "This is another year to set things right. \nThis made the AppDelegate the perfect place for developers to configure the UIWindow container to programmatically launch the entry point of the application"
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20)
		label.textColor = .gray
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.setContentCompressionResistancePriority(.required, for: .vertical)
		return label
	}()
	
	let footnote: UILabel = {
		let label = UILabel()
		label.text = "After trying all above suggestion I found no properties change is need for the UIStackView. I just change the properties of the UILabels as following (The labels are added to a vertical stack view already)."
		label.textAlignment = .center
		label.textColor = .gray
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.setContentCompressionResistancePriority(.required, for: .vertical)
		return label
	}()
	
	let banner: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "banner")
		imageView.contentMode = .scaleToFill
		return imageView
	}()
	
	let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.showsVerticalScrollIndicator = false
		return scrollView
	}()
	
	let rootStackView: UIStackView = {
		let stackView = UIStackView()
//		stackView.distribution = .fillProportionally
//		stackView.alignment = .fill
		stackView.axis = .vertical
		stackView.spacing = 10
		stackView.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}()
	
	let shareButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Share with others", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = .black
		button.layer.cornerRadius = 10
		button.clipsToBounds = true
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		self.backgroundColor = .white
		
		self.addSubview(self.shareButton)
		self.addSubview(self.scrollView)
		self.scrollView.addSubview(self.rootStackView)
		
		self.rootStackView.addArrangedSubview(self.titleLabel)
		self.rootStackView.addArrangedSubview(self.subtitleLabel)
		self.rootStackView.addArrangedSubview(self.banner)
		self.rootStackView.addArrangedSubview(StackedProfileImageView())
		self.rootStackView.addArrangedSubview(self.footnote)
		
		self.banner.constrainHeight(constant: 600)
		
		self.shareButton.anchor(leading: self.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 10, right: 20), size: .init(width: 0, height: 50))
		self.scrollView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.shareButton.topAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 0))
		self.rootStackView.anchor(top: self.scrollView.topAnchor, leading: self.scrollView.leadingAnchor, bottom: self.scrollView.bottomAnchor, trailing: self.scrollView.trailingAnchor)
		self.rootStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
	}
}
