import UIKit

class BanksSectionView: UIView {
	
	var banks: [String] = [
		"Sparkle",
		"Access Bank",
		"Kuda Bank"
	]
	
	let rootStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 16
		return stackView
	}()
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Now, let's take a peek at how active your transfer game has been this year;"
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 14, weight: .bold)
		return label
	}()
	
	let sectionImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "bankssectionimage")
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
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
		self.sectionImageView.anchor(bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 40, right: 24), size: .init(width: 80, height: 80))
		
		self.rootStackView.addArrangedSubview(self.titleLabel)
		self.rootStackView.setCustomSpacing(24, after: self.titleLabel)
		self.setupItemsView()
		self.rootStackView.addArrangedSubview(UIView())
	}
	
	private func setupItemsView() {
		for bank in self.banks {
			let sectionItem = BankItemDetailView()
			sectionItem.nameLabel.text = bank
			sectionItem.constrainHeight(constant: 90)
			self.rootStackView.addArrangedSubview(sectionItem)
		}
	}
}


