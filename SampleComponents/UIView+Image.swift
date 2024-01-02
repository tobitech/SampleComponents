import UIKit

extension UIView {
	//	func asImage() -> UIImage? {
	//		UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
	//		guard let context = UIGraphicsGetCurrentContext() else { return nil }
	//		layer.render(in: context)
	//		let image = UIGraphicsGetImageFromCurrentImageContext()
	//		UIGraphicsEndImageContext()
	//		return image
	//	}
	
	func asImage() -> UIImage {
		let renderer = UIGraphicsImageRenderer(bounds: bounds)
		return renderer.image { rendererContext in
			layer.render(in: rendererContext.cgContext)
		}
	}
}

extension UIScrollView {
	
	func takeScrollViewScreenShot() -> UIImage? {
		UIGraphicsBeginImageContextWithOptions(self.contentSize, false, UIScreen.main.scale)
		
		let savedContentOffset = self.contentOffset
		let savedFrame = self.frame
		
		self.contentOffset = CGPoint.zero
		self.layer.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)
		
		self.layer.render(in: UIGraphicsGetCurrentContext()!)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		
		self.contentOffset = savedContentOffset
		self.frame = savedFrame
		UIGraphicsEndImageContext()
		return image
	}
}

