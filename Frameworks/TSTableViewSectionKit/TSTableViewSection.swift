//
//  TSTableViewSection.swift
//  TSTableViewSectionKit
//
//  Created by Thomas Sillmann on 01.12.17.
//  Copyright © 2017 Thomas Sillmann. All rights reserved.
//

import UIKit

open class TSTableViewSection: NSObject {
	
	// MARK: - Properties
	
	open var title: String?
	
	open var cells: [UITableViewCell]
	
	open var footer: String?
	
	open var numberOfRows: Int {
		return cells.count
	}
	
	// MARK: - Initializer
	
	public convenience init(cells: [UITableViewCell]) {
		self.init(title: nil, cells: cells, footer: nil)
	}
	
	public convenience init(title: String, cells: [UITableViewCell]) {
		self.init(title: title, cells: cells, footer: nil)
	}
	
	public init(title: String?, cells: [UITableViewCell], footer: String?) {
		self.title = title
		self.cells = cells
		self.footer = footer
	}
	
	// MARK: - Methods
	
	open func addCell(_ cell: UITableViewCell) {
		cells.append(cell)
	}
	
	open func addCell(_ cell: UITableViewCell, atIndex index: Int) {
		if index <= cells.count {
			cells.insert(cell, at: index)
		}
	}
	
	open func removeCell(_ cell: UITableViewCell) {
		if let cellIndex = cells.index(of: cell) {
			cells.remove(at: cellIndex)
		}
	}
	
	open func index(forCell cell: UITableViewCell) -> Int? {
		return cells.index(of: cell)
	}
	
	open func contains(_ cell: UITableViewCell) -> Bool {
		return cells.contains(cell)
	}
	
}
