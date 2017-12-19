//
//  TSTableViewController.swift
//  TSTableViewSectionKit
//
//  Created by Thomas Sillmann on 07.12.17.
//  Copyright © 2017 Thomas Sillmann. All rights reserved.
//

import UIKit

open class TSTableViewController: UITableViewController {
	
	// MARK: - Properties
	
	open var tableViewSections: [TSTableViewSection]!
	
}

// MARK: - UITableViewDataSource

extension TSTableViewController {
	
	override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return tableViewSections[indexPath.section].cells[indexPath.row]
	}
	
	override open func numberOfSections(in tableView: UITableView) -> Int {
		return tableViewSections.count
	}
	
	override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableViewSections[section].cells.count
	}
	
	override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if let sectionHeader = tableViewSections[section].title {
			return sectionHeader
		}
		return nil
	}
	
	override open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		if let sectionFooter = tableViewSections[section].footer {
			return sectionFooter
		}
		return nil
	}
	
}

// MARK: - UITableViewDelegate

extension TSTableViewController {
	
	override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return tableViewSections[indexPath.section].cells[indexPath.row].frame.size.height
	}
	
	override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let actionCell = tableViewSections[indexPath.section].cells[indexPath.row] as? TSTableViewActionCell {
			if let actionClosure = actionCell.actionClosure {
				actionClosure()
			}
		}
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
}
