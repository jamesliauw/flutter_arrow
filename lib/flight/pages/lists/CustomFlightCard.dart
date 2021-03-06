import 'package:flutter/material.dart';
import 'package:flighttickets/flight/pages/lists/CustomFlightDetails.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/pages/lists/CustomFlightDetailChip.dart';

/// 列表ITEM
class FlightCardItem extends StatelessWidget {

	/// 航班信息
	final FlightDetails flightDetails;

	FlightCardItem({this.flightDetails});

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.symmetric(vertical: 8.0),		// 只指定上下边矩
			child: Stack(
				children: <Widget>[
					this.buildFlightCardContainer(),
					this.buildFlightPositioned()
				],
			),
		);
	}

	/// 航班位置容器
	Widget buildFlightPositioned() {
		return Positioned(
			top: 10.0,
			right: 0.0,
			child: Container(
				padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
				child: Text('${flightDetails.discount}%', style: TextStyle(color: appTheme.primaryColor, fontSize: 14.0, fontWeight: FontWeight.bold)),
				decoration: BoxDecoration(color: discountBackgroundColor, borderRadius: BorderRadius.all(Radius.circular(10.0))),
			)
		);
	}

	/// 航班信息容器
	Widget buildFlightCardContainer() {
		return Container(
			margin: const EdgeInsets.only(right: 16.0),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.all(Radius.circular(10.0)),
				border: Border.all(color: flightBorderColor)
			),
			child: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Row(
							children: <Widget>[
								Text('${formatCurrency.format(flightDetails.newPrice)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
								SizedBox(width: 4.0),
								Text('(${formatCurrency.format(flightDetails.oldPrice)})', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, decoration: TextDecoration.lineThrough, color: Colors.grey),)
							],
						),
						Wrap(
							spacing: 8.0,
							runSpacing: -8.0,
							children: <Widget>[
								FlightDetailChip(Icons.calendar_today, '${flightDetails.date}'),
								FlightDetailChip(Icons.flight_takeoff, '${flightDetails.airlines}'),
								FlightDetailChip(Icons.star, '${flightDetails.rating}'),
							],
						)
					],
				),
			),
		);
	}
}
