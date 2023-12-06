//
//  BadgeViewModel.swift
//  NotificationCountBadge
//
//  Created by Burak Ekmen on 6.12.2023.
//

import UIKit

protocol IBadgeViewModel: AnyObject {
    
    init(uiModel: IBadgeUIModel)
    
}

class BadgeViewModel : IBadgeViewModel {
    
    // MARK: Private Props

    // MARK: Public Props
    
    // MARK: Injects
    private var uiModel: IBadgeUIModel

    required init(uiModel: IBadgeUIModel) {
        self.uiModel = uiModel
    }
    
}
