import UIKit

class BankItemDetailView: UIView {
	
	let itemImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "img-1")
		imageView.contentMode = .scaleToFill
		imageView.layer.cornerRadius = 10
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 34, weight: .bold)
		return label
	}()
	
	let subtitleLabel: UILabel = {
		let label = UILabel()
		label.text = "Sent to 40 accounts"
		label.textColor = .gray
		label.font = .systemFont(ofSize: 14, weight: .bold)
		return label
	}()
	
	let successRateLabel: UILabel = {
		let label = UILabel()
		label.text = "  • 55% Successful transfer rate   "
		label.textColor = .white
		label.font = .systemFont(ofSize: 14, weight: .bold)
		label.backgroundColor = UIColor(hex: "#97D700")
		label.layer.cornerRadius = 8
		label.layer.masksToBounds = true
		return label
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
		
		self.addSubview(self.itemImageView)
		self.addSubview(self.nameLabel)
		self.addSubview(self.subtitleLabel)
		self.addSubview(self.successRateLabel)
		
		self.itemImageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 24, height: 24))
		self.nameLabel.anchor(top: self.topAnchor, leading: self.itemImageView.trailingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 10))
		self.subtitleLabel.anchor(top: self.nameLabel.bottomAnchor, leading: self.nameLabel.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 10))
		self.successRateLabel.anchor(top: self.subtitleLabel.bottomAnchor, leading: self.nameLabel.leadingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 10))
	}
}

