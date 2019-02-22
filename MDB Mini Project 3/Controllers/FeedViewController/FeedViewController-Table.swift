//
//  FeedViewController-Table.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/19/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit
import Material

extension FeedViewController : UITableViewDataSource, UITableViewDelegate {
    
    func height(for index: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(allEvents?.count ?? 0)
        return allEvents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "eventCell") as! FeedTableViewCell
        cell.awakeFromNib()
        let size = CGSize(width: feedTableView.frame.width, height: height(for: indexPath))
        cell.initCellFrom(size: size)
        cell.selectionStyle = .none
        cell.event = allEvents?[indexPath.row]
        return cell
    }
    
   
    
}
