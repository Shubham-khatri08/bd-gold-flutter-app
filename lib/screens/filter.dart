import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> brandsList = ['ACNE', 'Addidas', 'Black Cat', 'Bribe', 'Canon', 'Cogger', 'Delve', 'Nike'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context).translate('filters'),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor),
                    ),
                    SizedBox(height: 20),
                    Text(AppLocalizations.of(context).translate('price_range'),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor)),
                    SizedBox(height: 10),
                    PriceFilter(),
                    SizedBox(height: 20),
                    Text(AppLocalizations.of(context).translate('sizes'),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor)),
                    SizedBox(height: 10),
                    SizeFilter(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context).translate('brands'),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor)),
                        Text(AppLocalizations.of(context).translate('btn_select_all'),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: textLightColor)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: BrandFilter(brandsList),
                    )
                  ],
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 24)],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor, width: 1.5, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        textColor: primaryColor,
                        child: Text(AppLocalizations.of(context).translate('btn_clear'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 1)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 12,
                        color: primaryColor,
                        textColor: Colors.white,
                        child: Text(AppLocalizations.of(context).translate('btn_apply'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
            )
          ],
        )
    );
  }
}

class PriceFilter extends StatefulWidget {
  @override
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  static const min = 50.0;
  static const max = 1000.0;
  double low = min;
  double high = max;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$$min", textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: primaryColor)),
            Text("\$$max", textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: primaryColor)),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
          ),
          child: RangeSlider(
            min: min, max: max,
            activeColor: primaryColor,
            divisions: 100,
            values: RangeValues(low, high),
            labels: RangeLabels(low.toString(), high.toString()),
            onChanged: (values) => setState((){
              low = values.start;
              high = values.end;
            }),
          ),
        ),
      ],
    );
  }
}

class SizeFilter extends StatefulWidget {
  @override
  _SizeFilterState createState() => _SizeFilterState();
}

class _SizeFilterState extends State<SizeFilter> {
  int selectedSize = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sizeBox(0, 'XS'),
        sizeBox(1, 'S'),
        sizeBox(2, 'M'),
        sizeBox(3, 'L'),
        sizeBox(4, 'XL'),
      ],
    );
  }

  Widget sizeBox(int index, String title) {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: 54, height: 54,
          child: Card(
            color: (selectedSize == index) ? primaryColor : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: (selectedSize == index) ? 4 : 1,
            child: InkWell(
              onTap: () {
                setState(() => selectedSize = index);
              },
              child: Center(
                child: Text(title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                        color: (selectedSize == index) ? Colors.white : textLightColor)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BrandFilter extends StatefulWidget {
  final List<String> brandsList;
  BrandFilter(this.brandsList);
  @override
  _BrandFilterState createState() => _BrandFilterState();
}

class _BrandFilterState extends State<BrandFilter> {
  String selectedBrand = 'Addidas';
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: widget.brandsList.length,
      itemBuilder: (context, index) {
        return listItem(widget.brandsList[index]);
      },
      separatorBuilder: (context, index) {
        return separator();
      },
    );
  }

  Widget listItem(String title) {
    return InkWell(
      onTap: () {
        setState(() => selectedBrand = title);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
                    color: (selectedBrand == title) ? primaryColor : textMidColor)),
            if (selectedBrand == title) ... [
              Icon(Icons.check, color: primaryColor, size: 22)
            ]
          ],
        ),
      ),
    );
  }

  Widget separator() {
    return Divider(height: 1, thickness: 1, color: lineColor);
  }
}
