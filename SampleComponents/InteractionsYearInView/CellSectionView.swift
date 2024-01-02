import UIKit

class CellSectionView: UIView {
	
	let sectionImageName: String
	let items: [String]
	
	let rootStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 8
		return stackView
	}()
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Top 3 people you sent money to;"
		label.font = .systemFont(ofSize: 14, weight: .bold)
		return label
	}()
	
	lazy var sectionImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: self.sectionImageName)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	init(items: [String], sectionImageName: String) {
		self.sectionImageName = sectionImageName
		self.items = items
		super.init(frame: .zero)
		self.setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		self.backgroundColor = UIColor(hex: "#FFFAEC")
		self.layer.cornerRadius = 8
		self.layer.masksToBounds = true
		
		self.addSubview(self.rootStackView)
		self.addSubview(self.sectionImageView)
		
		self.rootStackView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 24, left: 24, bottom: 24, right: 24))
		self.sectionImageView.anchor(bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 16), size: .init(width: 76, height: 72))
		
		self.rootStackView.addArrangedSubview(self.titleLabel)
		self.rootStackView.setCustomSpacing(24, after: self.titleLabel)
		self.setupItemsView()
		
		self.rootStackView.addArrangedSubview(UIView())
	}
	
	private func setupItemsView() {
		for item in self.items {
			let sectionItem = SectionItemView()
			sectionItem.label.text = item
			sectionItem.constrainHeight(constant: 40)
			self.rootStackView.addArrangedSubview(sectionItem)
		}
	}
}

