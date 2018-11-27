//
//  MapMarker.swift
//  Swift10-Map
//
//  Created by Lalita Narupiyakul on 22/11/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit
import MapKit

class MapMarker: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D=CLLocationCoordinate2DMake(0, 0)
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
    
}
