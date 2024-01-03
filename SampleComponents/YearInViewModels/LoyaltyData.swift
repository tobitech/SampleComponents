import Foundation

struct LoyaltyData {
	let referrals: String
	let loyaltyLevel: String
	let loyaltyLevelPercentile: String
	let invitees: [String] // if this empty don't show the stacked profiles view.
}

struct TransactionReviewData {
	let totalSpent: String
	let totalReceived: String
	let count: String
	let percentileGroup: String
}

struct FeatureChampionData {
	let payLinksCount: String
	let successfulPayLinks: String
	let canceledPayLinks: String
	let billsCount: String
	let totalBillsValue: String
	let highestBillCategory: String
	let topBillCategories: [String] // change to array of BillCategory.
}

struct InteractionsReviewData {
	let topReceivingBank: [TopBank]
	let topSentBank: [TopBank]
	let topSent: [TopBeneficiary]
	let topReceived: [TopBeneficiary]
}
