//
//  ViewController.swift
//  TSTableViewSectionKitExample
//
//  Created by Thomas Sillmann on 15.12.17.
//  Copyright © 2017 Thomas Sillmann. All rights reserved.
//

import UIKit
import TSTableViewSectionKit

class ViewController: TSTableViewController {
	
	// MARK: - Properties
	
	private lazy var staticCell: UITableViewCell = {
		let staticCell = UITableViewCell(style: .default, reuseIdentifier: nil)
		staticCell.textLabel?.text = "Static Cell"
		return staticCell
	}()
	
	private lazy var dynamicCell: TSTableViewActionCell = {
		let dynamicCell = TSTableViewActionCell(style: .default, reuseIdentifier: nil)
		dynamicCell.textLabel?.text = "Dynamic Cell"
		dynamicCell.actionClosure = {
			self.updateDynamicCellAppearance(dynamicCell)
		}
		return dynamicCell
	}()
	
	// MARK: - Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableViewSections = [TSTableViewSection(title: "My Section", cells: [self.staticCell])]
	}
	
	@IBAction func updateDynamicCellAppearance(_ sender: Any) {
		let dynamicCellIndexPath = IndexPath(row: 1, section: 0)
		tableView.beginUpdates()
		if tableViewSections[0].contains(dynamicCell) {
			tableView.deleteRows(at: [dynamicCellIndexPath], with: .automatic)
			tableViewSections[0].removeCell(dynamicCell)
		} else {
			tableViewSections[0].addCell(dynamicCell)
			tableView.insertRows(at: [dynamicCellIndexPath], with: .automatic)
		}
		tableView.endUpdates()
	}
	
}

// MARK: - UITableViewDataSource

//extension ViewController {
//
//	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		return tableViewSections[indexPath.section].cells[indexPath.row]
//	}
//
//	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return tableViewSections[section].numberOfRows
//	}
//
//	override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//		return tableViewSections[section].title
//	}
//
//	override open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//		return tableViewSections[section].footer
//	}
//
//	override open func numberOfSections(in tableView: UITableView) -> Int {
//		return tableViewSections.count
//	}
//
//}

// MARK: - UITableViewDelegate

//extension ViewController {
//
//	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		if let actionCell = tableViewSections[indexPath.section].cells[indexPath.row] as? TSTableViewActionCell {
//			if let actionClosure = actionCell.actionClosure {
//				actionClosure()
//			}
//		}
//	}
//
//}

