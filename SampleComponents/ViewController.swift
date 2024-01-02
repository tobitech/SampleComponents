import UIKit
import LinkPresentation

class ViewController: UIViewController {
	
	var shareImage = UIImage()
	let rootView = YearReviewView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view = self.rootView
		
		self.rootView.shareButton.addTarget(self, action: #selector(self.shareButtonTapped), for: .touchUpInside)
	}
	
	@objc func shareButtonTapped() {
		guard let image = self.rootView.scrollView.takeScrollViewScreenShot() else { return }
		self.shareImage = image
		
		let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
		self.present(activityController, animated: true)
	}
}

@available(iOS 13.0, *)
extension ViewController: UIActivityItemSource {
	func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
		return self.shareImage
	}
	
	func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
		return self.shareImage
	}
	
	func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
		let metadata = LPLinkMetadata()
		metadata.title = "Your 2023 Sparkle Year in View"
		metadata.imageProvider = NSItemProvider(object: self.shareImage)
		return metadata
	}
}

