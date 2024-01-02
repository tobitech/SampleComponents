import UIKit

class View: UIView {
	let label: UILabel = {
		let label = UILabel()
		label.text = "Our Sample Components"
		label.textAlignment = .center
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
		self.backgroundColor = .white
		self.addSubview(self.label)
		self.label.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
	}
}
