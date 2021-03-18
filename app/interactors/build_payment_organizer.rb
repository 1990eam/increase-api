# frozen_string_literal: true

class BuildPaymentOrganizer
  include Interactor::Organizer

  organize CreatePayment,
           BuildHeader,
           BuildTransactions,
           BuildDiscounts,
           BuildFooter,
           FetchClientData
end
