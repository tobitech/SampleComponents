import Foundation

struct YearInViewResponse: Codable {
	let currentYearReferrals: String
	let flyWheelStage: String
	let points: String
	let flywheelPercentileGroup: String
	let totalDeposits: String
	let totalWithdrawals: String
	let transactionCount: String
	let transactionsPercentileGroup: String
	let paymentLinks: String
	let successfulPaymentLinks: String
	let canceledPaymentLinks: String
	let billsValue: String
	let billsCount: String
	let mostPaidBillCategory: [String]
	let topReceivingBank: [TopBank]
	let topSentBank: [TopBank]
	let topSent: [TopBeneficiary]
	let topReceived: [TopBeneficiary]
}

struct PaidBillCategory: Codable {
}

struct TopBank: Codable {
	let bankRank: Int
	let institutionname: String
}

struct TopBeneficiary: Codable {
	let personRank: Int
	let destinationBank: String
	let destinationname: String
}
