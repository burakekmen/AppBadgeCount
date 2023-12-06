//
//  BadgeBuilder.swift
//  NotificationCountBadge
//
//  Created by Burak Ekmen on 6.12.2023.
//

import Foundation

enum BadgeBuilder {
    static func generate() -> BadgeViewController {
        let uiModel = BadgeUIModel()
        let viewModel = BadgeViewModel(uiModel: uiModel)
        
        return BadgeViewController(viewModel: viewModel)
    }
}
