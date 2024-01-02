import UIKit

class SectionItemView: UIView {
	
	let itemImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "img-1")
		imageView.contentMode = .scaleToFill
		imageView.layer.cornerRadius = 10
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	let label: UILabel = {
		let label = UILabel()
		label.text = "Entertainment"
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20, weight: .bold)
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
		self.addSubview(self.label)
		
		self.itemImageView.centerYInSuperview()
		self.itemImageView.anchor(leading: self.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40))
		
		self.label.centerYInSuperview()
		self.label.anchor(leading: self.itemImageView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 10))
	}
}
