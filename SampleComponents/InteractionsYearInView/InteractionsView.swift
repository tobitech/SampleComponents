import UIKit

class InteractionsView: UIView {
	
	let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.showsVerticalScrollIndicator = false
		return scrollView
	}()
	
	let rootStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 10
		stackView.layoutMargins = .init(top: 10, left: 20, bottom: 10, right: 20)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}()
	
	let bannerImage: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "banner"))
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
		self.backgroundColor = .white
		
		self.addSubview(self.scrollView)
		self.scrollView.addSubview(self.rootStackView)
		
		let topPeopleSentView = CellSectionView(items: [
			"Joanna Obi",
			"Hadiza Sanmi",
			"Tunde Alabi"
		], sectionImageName: "sentsectionimage")
		let topPeopleReceivedView = CellSectionView(items: [
			"Marcus Adams",
			"Chioma Kevin",
			"Tunde Alabi"
		], sectionImageName: "receivedsectionimage")
		let banksSection = BanksSectionView()
		
		self.rootStackView.addArrangedSubview(self.bannerImage)
		self.rootStackView.addArrangedSubview(topPeopleSentView)
		self.rootStackView.addArrangedSubview(topPeopleReceivedView)
		self.rootStackView.addArrangedSubview(banksSection)
		
		self.scrollView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.trailingAnchor)
		self.rootStackView.anchor(top: self.scrollView.topAnchor, leading: self.scrollView.leadingAnchor, bottom: self.scrollView.bottomAnchor, trailing: self.scrollView.trailingAnchor)
		self.rootStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
		
		topPeopleSentView.constrainHeight(constant: 230)
		topPeopleReceivedView.constrainHeight(constant: 230)
		banksSection.constrainHeight(constant: 515)
	}
}

