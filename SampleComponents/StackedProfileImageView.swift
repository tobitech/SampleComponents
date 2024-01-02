import UIKit

class StackedProfileImageView: UIView {
	var images: [String] = [
		"img-1",
		"img-2",
		"img-3",
		"img-4",
		"img-5",
		"img-6",
		"img-7",
		"img-8",
		"img-9",
		"img-10"
	]
	
	let rootStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.distribution = .fill
		stackView.axis = .horizontal
		stackView.spacing = -10
		return stackView
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
		self.addSubview(self.rootStackView)
		
		self.rootStackView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
		
		if self.images.count > 5 {
			let profiles = Array(self.images.prefix(5))
			self.setupProfileImages(images: profiles)
			// add the count of remaining images
			self.setupCountView(count: self.images.count - 5)
		} else {
			self.setupProfileImages(images: self.images)
		}
		
		// add a spacer view to fill the rest of the stack view.
		self.rootStackView.addArrangedSubview(UIView())
	}
	
	private func setupProfileImages(images: [String]) {
		for image in images {
			let imageView = UIImageView(image: UIImage(named: image))
			imageView.backgroundColor = .lightGray
			imageView.layer.borderWidth = 1
			imageView.layer.borderColor = UIColor.gray.cgColor
			imageView.layer.cornerRadius = 16
			imageView.layer.masksToBounds = true
			imageView.constrainHeight(constant: 32)
			imageView.constrainWidth(constant: 32)
			self.rootStackView.addArrangedSubview(imageView)
		}
	}
	
	private func setupCountView(count: Int) {
		let countView = UIView()
		countView.backgroundColor = .green // Sparkle green
		countView.layer.cornerRadius = 16
		countView.layer.masksToBounds = true
		
		let label = UILabel()
		label.text = "+\(count)"
		label.textColor = .white
		label.font = .systemFont(ofSize: 16, weight: .bold)
		
		countView.addSubview(label)
		
		label.centerInSuperview()
		countView.constrainWidth(constant: 32)
		countView.constrainHeight(constant: 32)
		self.rootStackView.addArrangedSubview(countView)
	}
}

