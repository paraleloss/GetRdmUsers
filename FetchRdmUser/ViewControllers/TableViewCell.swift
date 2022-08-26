//
//  TableViewCell.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 26/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: .default, reuseIdentifier: "UserCell")
      setupUI()
   }

   required init?(coder: NSCoder) {
      fatalError("Please use this class from code.")
   }

   private func setupUI() {

      clipsToBounds = true
      frame = CGRect(x: 0, y: 24.5, width: 414, height: 43.5)
      preservesSuperviewLayoutMargins = true

      contentView.clipsToBounds = true
      contentView.contentMode = .center
      contentView.insetsLayoutMarginsFromSafeArea = false
      contentView.isMultipleTouchEnabled = true
      contentView.preservesSuperviewLayoutMargins = true

      textLabel?.contentMode = .left
      textLabel?.font = UIFont.systemFont(ofSize: 0.0)
      textLabel?.frame = CGRect(x: 20, y: 0, width: 374, height: 43.5)
      textLabel?.insetsLayoutMarginsFromSafeArea = false
      textLabel?.isMultipleTouchEnabled = true
      textLabel?.text = "Title"
      textLabel?.textAlignment = .natural
   }
}
