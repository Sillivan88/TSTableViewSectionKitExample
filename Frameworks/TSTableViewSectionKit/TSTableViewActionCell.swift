//
//  TSTableViewActionCell.swift
//  TSTableViewSectionKit
//
//  Created by Thomas Sillmann on 01.12.17.
//  Copyright © 2017 Thomas Sillmann. All rights reserved.
//

import UIKit

open class TSTableViewActionCell: UITableViewCell {
	
	// MARK: - Properties
	
	open var actionClosure: (() -> Void)?
	
}
