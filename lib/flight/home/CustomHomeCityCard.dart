import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flighttickets/flight/home/CustomHomeCity.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';

class CityCard extends StatelessWidget {
	final City city;

	CityCard({this.city});

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 8.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					this.getCityCardClipRRect(),
					this.getCityCardRow()
				],
			),
		);
	}

	Widget getCityCardRow() {
		return Row(
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				SizedBox(width: 5.0),
				Text('${formatCurrency.format(city.newPrice)}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)),
				SizedBox(width: 5.0),
				Text('${formatCurrency.format(city.oldPrice)}', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12.0))
			],
		);
	}

	Widget getCityCardClipRRect() {
		return ClipRRect(
			borderRadius: BorderRadius.all(Radius.circular(10.0)),
			child: Stack(
				children: <Widget>[
					Container(
						height: 210.0,
						width: 160.0,
						child: CachedNetworkImage(
							imageUrl: '${city.imagePath}',
							fit: BoxFit.cover,
							fadeInDuration: Duration(milliseconds: 500),
							fadeInCurve: Curves.easeIn,
							placeholder: Center(child: CircularProgressIndicator())
						),
					),
					Positioned(
						left: 0.0,
						bottom: 0.0,
						width: 160.0,
						height: 60.0,
						child: Container(
							decoration: BoxDecoration(
								gradient: LinearGradient(
									begin: Alignment.bottomCenter,
									end: Alignment.topCenter,
									colors: [Colors.black, Colors.black.withOpacity(0.1)]
								)
							),
						),
					)
				],
			),
		);
	}
}
